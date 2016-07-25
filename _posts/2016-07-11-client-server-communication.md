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

others related reading:

* TCP: low-level, bi-directional, full-duplex, and guaranteed order transport layer. No browser support (except via plugin/Flash).

* HTTP 1.0: request-response transport protocol layered on TCP. The client makes one full request, the server gives one full response, and then the connection is closed. The request methods (GET, POST, HEAD) have specific transactional meaning for resources on the server.

* HTTP 1.1: maintains the request-response nature of HTTP 1.0, but allows the connection to stay open for multiple full requests/full responses (one response per request). Still has full headers in the request and response but the connection is re-used and not closed. HTTP 1.1 also added some additional request methods (OPTIONS, PUT, DELETE, TRACE, CONNECT) which also have specific transactional meanings. However, as noted in the introduction to the HTTP 2.0 draft proposal, HTTP 1.1 pipelining is not widely deployed so this greatly limits the utility of HTTP 1.1 to solve latency between browsers and servers.

* Long-poll: sort of a "hack" to HTTP (either 1.0 or 1.1) where the server does not response immediately (or only responds partially with headers) to the client request. After a server response, the client immediately sends a new request (using the same connection if over HTTP 1.1).

* HTTP streaming: a variety of techniques (multipart/chunked response) that allow the server to send more than one response to a single client request. The W3C is standardizing this as Server-Sent Events using a text/event-stream MIME type. The browser API (which is fairly similar to the WebSocket API) is called the EventSource API.
Comet/server push: this is an umbrella term that includes both long-poll and HTTP streaming. Comet libraries usually support multiple techniques to try and maximize cross-browser and cross-server support.

* WebSockets: a transport layer built-on TCP that uses an HTTP friendly Upgrade handshake. Unlike TCP, which is a streaming transport, WebSockets is a message based transport: messages are delimited on the wire and are re-assembled in-full before delivery to the application. WebSocket connections are bi-directional, full-duplex and long-lived. After the initial handshake request/response, there is no transactional semantics and there is very little per message overhead. The client and server may send messages at any time and must handle message receipt asynchronously.

* SPDY: a Google initiated proposal to extend HTTP using a more efficient wire protocol but maintaining all HTTP semantics (request/response, cookies, encoding). SPDY introduces a new framing format (with length-prefixed frames) and specifies a way to layering HTTP request/response pairs onto the new framing layer. Headers can be compressed and new headers can be sent after the connection has been established. There are real world implementations of SPDY in browsers and servers.

* HTTP 2.0: has similar goals to SPDY: reduce HTTP latency and overhead while preserving HTTP semantics. The current draft is derived from SPDY and defines an upgrade handshake and data framing that is very similar the the WebSocket standard for handshake and framing. An alternate HTTP 2.0 draft proposal (httpbis-speed-mobility) actually uses WebSockets for the transport layer and adds the SPDY multiplexing and HTTP mapping as an WebSocket extension (WebSocket extensions are negotiated during the handshake).

* WebRTC/CU-WebRTC: proposals to allow peer-to-peer connectivity between browsers. This may enable lower average and maximum latency communication because as the underlying transport is SDP/datagram rather than TCP. This allows out-of-order delivery of packets/messages which avoids the TCP issue of latency spikes caused by dropped packets which delay delivery of all subsequent packets (to guarantee in-order delivery).

* QUIC: is an experimental protocol aimed at reducing web latency over that of TCP. On the surface, QUIC is very similar to TCP+TLS+SPDY implemented on UDP. QUIC provides multiplexing and flow control equivalent to HTTP/2, security equivalent to TLS, and connection semantics, reliability, and congestion control equivalentto TCP. Because TCP is implemented in operating system kernels, and middlebox firmware, making significant changes to TCP is next to impossible. However, since QUIC is built on top of UDP, it suffers from no such limitations. QUIC is designed and optimised for HTTP/2 semantics.