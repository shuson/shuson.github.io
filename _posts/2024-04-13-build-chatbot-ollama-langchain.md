---
layout: post
title: Let's build a simple grid system like Bootstrap
tags:
    - ollama
    - chatbot
    - chatgpt
    - langchain
    - mistral
---

You don't have thousand pieces of H100, but you still can have a chatgpt alike chatbot "trained" with your own data.
[RAG](https://blogs.nvidia.com/blog/what-is-retrieval-augmented-generation/) can make it happen easily.


## TLDR;

Here are some key steps in short:

1. Use ollama as a model server
2. Use langchain and chroma to get your data ready
3. Use steamlit to make it interactive


## ctrl-CV part

From now on, I assume you have already installed ollama and pulled model, either llama2 or mistral 7B or bigger ones.

To make code run in an isolation python env, do create a virtual env using any tool you feel comfortable.

1. Build RAG engine, here is the code to ctrl-c:
```
import os

from langchain_community.vectorstores import Chroma
from langchain_community.chat_models import ChatOllama
from langchain_community.document_loaders import TextLoader
from langchain_community.embeddings import FastEmbedEmbeddings
from langchain.schema.output_parser import StrOutputParser
from langchain.text_splitter import RecursiveCharacterTextSplitter
from langchain.schema.runnable import RunnablePassthrough
from langchain.prompts import PromptTemplate
from langchain.vectorstores.utils import filter_complex_metadata


class Rag:
    vector_store = None
    retriever = None
    chain = None

    def __init__(self):
        self.model = ChatOllama(model="mistral")
        self.text_splitter = RecursiveCharacterTextSplitter(chunk_size=1024, chunk_overlap=100)
        self.prompt = PromptTemplate.from_template(
            """
            <s> [INST] You need to act like a chatbot by learning from [KNOWLEDGE]. You need to follow the rules below to ensure its quality:
                1. If the query has nothing relavent to [KNOWLEDGE], you will not answer it, and reply "I don't get related document of your question".
                2. Based on [KNOWLEDGE] and the query from user, compile and reply to user with the most relavent answer.
                3. Keep the answer clear and short within 80 words.
                4. Don't reply with nonsense and unrelavent answer.
                5. Use English only to reply.
                [/INST] 
            </s> 
            [INST] Question: {question} 
            Context: {context} 
            Answer: [/INST]
            """
        )

    def ingest(self, path_str: str):
        docs = []
        if os.path.isfile(path_str):
            loader = TextLoader(path_str)
            docs.extend(loader.load())
        else:
            for root, _, files in os.walk(path_str):
                for file in files:
                    if file.endswith('.txt'):
                        file_path = os.path.join(root, file)
                        loader = TextLoader(file_path)
                        docs.extend(loader.load())

        chunks = self.text_splitter.split_documents(docs)
        chunks = filter_complex_metadata(chunks)

        vector_store = Chroma.from_documents(documents=chunks, embedding=FastEmbedEmbeddings())
        self.retriever = vector_store.as_retriever(
            search_type="similarity_score_threshold",
            search_kwargs={
                "k": 3,
                "score_threshold": 0.5,
            },
        )

        self.chain = ({"context": self.retriever, "question": RunnablePassthrough()}
                      | self.prompt
                      | self.model
                      | StrOutputParser())

    def ask(self, query: str):
        if not self.chain:
            return "Please, add a path contains txt documents first."

        return self.chain.invoke(query)

    def clear(self):
        self.vector_store = None
        self.retriever = None
        self.chain = None
```


2. Create a bot with simple UI:
```

import os
import tempfile
import streamlit as st
from streamlit_chat import message
from rag import Rag

st.set_page_config(page_title="raGPT")


def display_messages():
    st.subheader("Chat")
    for i, (msg, is_user) in enumerate(st.session_state["messages"]):
        message(msg, is_user=is_user, key=str(i))
    st.session_state["thinking_spinner"] = st.empty()


def process_input():
    if st.session_state["user_input"] and len(st.session_state["user_input"].strip()) > 0:
        user_text = st.session_state["user_input"].strip()
        with st.session_state["thinking_spinner"], st.spinner(f"Thinking"):
            agent_text = st.session_state["assistant"].ask(user_text)

        st.session_state["messages"].append((user_text, True))
        st.session_state["messages"].append((agent_text, False))


def read_and_save_file():
    st.session_state["assistant"].clear()
    st.session_state["messages"] = []
    st.session_state["user_input"] = ""

    for file in st.session_state["file_uploader"]:
        with tempfile.NamedTemporaryFile(delete=False) as tf:
            tf.write(file.getbuffer())
            file_path = tf.name

        with st.session_state["ingestion_spinner"], st.spinner(f"Ingesting {file.name}"):
            st.session_state["assistant"].ingest(file_path)
        os.remove(file_path)


def page():
    if len(st.session_state) == 0:
        st.session_state["messages"] = []
        st.session_state["assistant"] = Rag()

    st.header("Chat with TXT")

    st.subheader("Upload a txt document")
    st.file_uploader(
        "Upload document",
        type=["txt"],
        key="file_uploader",
        on_change=read_and_save_file,
        label_visibility="collapsed",
        accept_multiple_files=True,
    )

    st.session_state["ingestion_spinner"] = st.empty()

    display_messages()
    st.text_input("Message", key="user_input", on_change=process_input)


if __name__ == "__main__":
    page()
```

3. There you go, hit ``python bot.py`` to run it.

## Conclusion

RAG's key is the embedding vector backed the search accuracy. Once the context is retrieved, the base model can do understanding of given prompt by its instruction.


