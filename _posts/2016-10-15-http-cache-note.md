---
layout: post
title: Best practise about HTTP caching
tags:
    - web
---

## Why Caching

- make non-first website loading faster
- save money for website owner

## How http handle caching

Before we dig into details, lets go through how caching act in the GET request flow.

![caching flow](https://i.v2ex.co/2t44FmgT.jpeg)

# there are two steps of caching validation.

- Local validation of caching (by priority)

    1. Cache-Control, according to "no-cache", "no-store", "max-age" and other options
    2. Expires, with HTTP-date like Expires: Thu, 01 Dec 1994 16:00:00 GMT

    Use Cache-Control and Expires together to make more support from all browsers.

- Remote validation after local validation finished without a decision of using cache.

    1. If-Modified-Since: Http-date
    2. Last-Modified: Http-date
    3. If-None-Match: version
    4. ETag: hashed version

# Rules of using cache control

- Static Resource

    For picture, js, and css files, use versioning strategy like ```base.css?s3xD5jx``` <br />
    Then set HTTP headers like:
        
        1. Cache-Control: public, max-age=31536000
        2. Expires: Thu, 15 Oct 2017 16:00:00 GMT //a year later
        3. ETag: "529eb7216432b69370103d6bdd5724dcb4"
        4. Last-Modified: Thu, 07 Jul 2016 22:01:41 GMT
        5. Vary: Accept-Encoding

- Dynamic Resource

    Usually, no caching for dynamic Resource

        1. Cache-Control: public, max-age=0
        2. Expires: Thu, 15 Oct 2016 16:00:00 GMT
        3. ETag: "529eb7216432b69370103d6bdd5724dcb4"
        4. Last-Modified: Thu, 07 Jul 2016 22:01:41 GMT
        5. Vary: Accept-Encoding

references: 
- https://bryantsai.com/http-caching/
- https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
//