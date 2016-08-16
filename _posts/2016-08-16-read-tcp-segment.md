---
layout: post
title: Read TCP segment by example
tags:
    - network
---

# What is a TCP segment?

TCP is a transport layer protocol used by applications that require guaranteed delivery. And the byte stream is transfered in segment illustrated below. 

~~~
0                   1                   2                   3   
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |          Source Port          |       Destination Port        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                        Sequence Number                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Acknowledgment Number                      |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Data |           |U|A|P|R|S|F|                               |
   | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
   |       |           |G|K|H|T|N|N|                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |           Checksum            |         Urgent Pointer        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             data                              |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
~~~

## Explain the segment by tcpdump
Let's say, we have a client-server connection example, which are about to playing "echo" game.

1. The client starts a connection to server, tcpdump will capture following segments as 3 time shake-hand:

~~~
// seg 1
13:27:45.927137 IP (tos 0x0, ttl  64, id 304, offset 0, flags [DF], proto: TCP (6), length: 60) 127.0.0.1.60534 > 127.0.0.1.6888: S, cksum 0x5f32 (correct), 2584692379:2584692379(0) win 32792 <mss 16396,sackOK,timestamp 10962859 0,nop,wscale 6>

//seg 2
13:27:45.927254 IP (tos 0x0, ttl  64, id 0, offset 0, flags [DF], proto: TCP (6), length: 60) 127.0.0.1.6888 > 127.0.0.1.60534: S, cksum 0x3648 (correct), 2589673026:2589673026(0) ack 2584692380 win 32768 <mss 16396,sackOK,timestamp 10962860 10962859,nop,wscale 6>

//seg 3
13:27:45.927265 IP (tos 0x0, ttl  64, id 305, offset 0, flags [DF], proto: TCP (6), length: 52) 127.0.0.1.60534 > 127.0.0.1.6888: ., cksum 0x1d6a (correct), 2584692380:2584692380(0) ack 2589673027 win 513 <nop,nop,timestamp 10962860 10962860>
~~~

Blabla:

    1. tos: [Type of Service](https://en.wikipedia.org/wiki/Type_of_service)
    2. TTL(time - to - live): means maxium number of routers passed through, whenever this segment passes through a router, TTL minus 1.
    3. id: IP packet indentification, for the use of grouping data
    4. offset: grouping data
    5. flags: DF means no grouping, MF means multiple grouping
    6. proto: protocol in use
    7. 127.0.0.1.60534 > 127.0.0.1.6888: source IP address to destination
    8. S: means new connection established, the SYN flag becomes "1" and ISN(Initial Sequence Number) is created for both client as "2584692379", for server side the ISN is "2589673026" when server responds
    9. chksum: for checking 
    10. win: TCP window for the control of congestion. Tell the other side how many data the sender can recieve.
    11: ack: tell the other side, the data is recieved.

2. Client sends "a" to server side, tcpdump will capture the following segments:

~~~
// seg 1
13:27:48.248592 IP (tos 0x0, ttl  64, id 306, offset 0, flags [DF], proto: TCP (6), length: 54) 127.0.0.1.60534 > 127.0.0.1.6888: P, cksum 0xfe2a (incorrect (-> 0xb344), 2584692380:2584692382(2) ack 2589673027 win 513 <nop,nop,timestamp 10965181 10962860>

// seg 2
13:27:48.248739 IP (tos 0x0, ttl  64, id 495, offset 0, flags [DF], proto: TCP (6), length: 52) 127.0.0.1.6888 > 127.0.0.1.60534: ., cksum 0x0b47 (correct), 2589673027:2589673027(0) ack 2584692382 win 512 <nop,nop,timestamp 10965181 10965181>

// seg 3
13:27:48.249061 IP (tos 0x0, ttl  64, id 496, offset 0, flags [DF], proto: TCP (6), length: 54) 127.0.0.1.6888 > 127.0.0.1.60534: P, cksum 0xfe2a (incorrect (-> 0xaa32), 2589673027:2589673029(2) ack 2584692382 win 512 <nop,nop,timestamp 10965181 10965181>

// seg 4
13:27:48.249085 IP (tos 0x0, ttl  64, id 307, offset 0, flags [DF], proto: TCP (6), length: 52) 127.0.0.1.60534 > 127.0.0.1.6888: ., cksum 0x0b43 (correct), 2584692382:2584692382(0) ack 2589673029 win 513 <nop,nop,timestamp 10965182 10965181>
~~~

Blabla:

    1. seg 1, P means PUSH, "a\n" is 2 bits, so the length is 54. If no data transfered, length should be 52
    2. seg 2, it means server ACK the data sending from client.
    3. seg 3, server responds with "a\n"
    4. seg 4, client ACK the data sending from server

3. Client closes connection to server side, tcpdump will capture the following segments:

~~~
// seg 1
13:38:10.081895 IP (tos 0x0, ttl  64, id 310, offset 0, flags [DF], proto: TCP (6), length: 52) 127.0.0.1.60534 > 127.0.0.1.6888: F, cksum 0x897d (correct), 2584692386:2584692386(0) ack 2589673033 win 513 <nop,nop,timestamp 11586913 10966477>

// seg 2
13:38:10.081987 IP (tos 0x0, ttl  64, id 498, offset 0, flags [DF], proto: TCP (6), length: 52) 127.0.0.1.6888 > 127.0.0.1.60534: F, cksum 0x11e0 (correct), 2589673033:2589673033(0) ack 2584692387 win 512 <nop,nop,timestamp 11586913 11586913>

// seg 3
13:38:10.081993 IP (tos 0x0, ttl  64, id 311, offset 0, flags [DF], proto: TCP (6), length: 52) 127.0.0.1.60534 > 127.0.0.1.6888: ., cksum 0x11df (correct), 2584692387:2584692387(0) ack 2589673034 win 513 <nop,nop,timestamp 11586913 11586913>
~~~

Blabla:

    1. seg 1, F means Fin, close request
    2. seg 2, server responds F to close connection
    3. seg 3, client side confirms the close request.

EOB
//