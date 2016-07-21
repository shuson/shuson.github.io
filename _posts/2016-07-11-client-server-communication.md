---
layout: post
title: Some tips about client-server communication
---

* Traditional Ajax request
This way is to set an _internal_ to make XMLHttpRequest, and it is easy to implement but not efficient for server, too heavy.

* Comet (another Ajax way)
When XMLHttpRequest is sent, the server won't respond until server has required data or the timeout is reached, the client received the response and open another request and loop this.

* Websocket (The future)
Easy as socket

* Server Sent Event (alternative)
Server sends the response after a connection setup