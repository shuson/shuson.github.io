---
layout: post
title: The minimum things about URL Encoding
tags:
    - foundation
---

### What is URL Encoding?

We know [URL](http://www.ietf.org/rfc/rfc1738.txt), composed by characters, is used as a locater of resources on Internet. And a browser is one of the entrances from Computer, which has its own character encoding rules. There is a boundary between Internet and Computer, so the rules of character encoding are different.

So URL encoding converts characters into a format that can be transmitted over the Internet.

### What is the rules of URL encoding?

URL can only be sent over the Internet using the [ASCII character-set](https://www.w3schools.com/charsets/ref_html_ascii.asp). Only alphanumerics [0-9a-zA-Z], the special characters "$-_.+!*'()," [not including the quotes], and reserved characters used for their reserved purposes may be used un-encoded within a URL.

When we send URL via browser from Computer, we always input characters outside of ASCII set. So URL must be converted into a valid ASCII format.

But this is not enough, there are categories of safe, reserved, unsafe characters:

| Classification           | Included characters                      | Encoding required? |
| ------------------------ | ---------------------------------------- | ------------------ |
| Safe characters          | Alphanumerics `[0-9a-zA-Z]`, special characters `$-_.+!*'(),`, and reserved characters used for their reserved purposes (e.g., question mark used to denote a query string) | NO                 |
| ASCII Control characters | Includes the ISO-8859-1 (ISO-Latin) character ranges 00-1F hex (0-31 decimal) and 7F (127 decimal.) | YES                |
| Non-ASCII characters     | Includes the entire “top half” of the ISO-Latin set 80-FF hex (128-255 decimal.) | YES                |
| Reserved characters      | `; / ? : @ = &` (does not include blank space) | YES*               |
| Unsafe characters        | Includes the blank/empty space and ``" < > # % { } | \ ^ ~ [ ] `` | YES                |

\* Note: Reserved characters only need encoding when not used for their defined, reserved purposes.

refs: https://perishablepress.com/stop-using-unsafe-characters-in-urls/

To make it clear, there are 3 rules:

1. URI characters before "?", we name it address part, it is encoded by UTF-8 with Percentage Encoding. Which means a non-ascii character, for example Chinese character **春** is encoded as "%E6%98%A5"

2. URI characters after "?", we call it query part, it is encoded based by its Operation System, for Chinese characters, it might be GB2312 or UTF-8.

3. When GET/POST or make HTTP request in a web browser, the encoding is determined by 

   ```html
   <meta http-equiv="Content-Type" content="text/html;charset=xxxx">
   ```

As we can see, there are different browsers, OS and web page charsets. There is, indeed, a silver bullet to handle this mess. 

> Encode whatever in a URL according to rule 1, 2, 3. before sending it to server side.

### Summary and Tips

1. Get to know where is the boundary, the characters your typing in between the characters sent to Internet.
2. Be clear about the characters you deal with, do they require encoding?
3. Don't mess up JSON encoding, OData Encoding or other web related encoding rules.