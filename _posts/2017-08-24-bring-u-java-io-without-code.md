---
layout: post
title: Bring Java IO to you without a single line of code
tags:
    - java
---

### Introduction

In short, Java I/O package (``java.io``) was designed to provide stream-based system input/output through file systems, data streams and serialization.

Programs read inputs from data sources (e.g., keyboard, file system, network, memory buffer, or another program) and write outputs to data destinations (e.g., display console, file system, network, memory buffer, or another program). In Java standard I/O, inputs and outputs are handled by the so-called *streams*.

### Types of Stream I/O

A *stream* is a sequential and contiguous one-way flow of data (just like water or oil flows through the pipe). The Java program receives data from a source by opening an **input stream**, and sends data to a destination by opening an **output stream**. 

There are two types of streams: char-based (reading and writing characters) and byte-based (reading and writing bytes)

char-based streams are classes extending abstract class ``abstract class Reader`` and ``abstract class Writer``.

byte-based streams are classes extending abstract class ``abstract class InputStream`` and ``abstract class OutputStream``.

Besides, there are bridges between byte streams and character streams: ``InputStreamReader`` and `` OutputStreamWriter``.

![IO_StreamVsCharacter.png](https://www.ntu.edu.sg/home/ehchua/programming/java/images/IO_StreamVsCharacter.png)

### Operation of Stream I/O

####  1. Open and Read from I/O Streams

Open an I/O stream by constructing an instance of `InputStream` or `Reader`. The `abstract` superclass `InputStream` or `Reader` declares an `abstract` method `read()` to read one byte or one char from the input source. The `read()` method returns an `int`, because it uses -1 to indicate end-of-stream.

One I/O stream is often chained to other stream for purposes such as filtering, data-format conversion.

#### 2. Open and Write to I/O Streams

Open an I/O stream by constructing an instance of `OutputStream` or `Writer`. Similar to the input counterpart, the `abstract` superclass `OutputStream` or `Writer` declares an abstract method `write()` to write one byte or one char to the output destination. `write()` takes an `int`.

#### 3. Close I/O Streams

 Both the `InputStream` or `Reader` and the `OutputStream` or `Writer` provides a `close()` method to close the stream, which performs the necessary clean-up operations to free up the system resources.

It is a good practice to explicitly close the I/O stream, by running `close()` in the `finally` clause of `try-catch-finally` to free up the system resources immediately when the stream is no longer needed. 

JDK 1.7 introduces a new `try-with-resources` syntax, which automatically closes all the opened resources after `try` or `catch`, as follows. This produces much neater codes.

### Bridge between byte-based and char-based I/O Streams

Java's I/O operations are complicated when dealing with encoding schemes. Java internally stores characters (`char` type) in 16-bit UCS-2 character set. But the external data source/destination could store characters in other character set, for example ASCII, UTF-8 etc.

We can use `InputStreamReader` and `OutputStreamWriter` to convert byte-based stream to char-based stream.