---
layout: post
title: The minimum things about Unicode and Charsets
tags:
    - foundation
---

### Happy birthday to my baby girl, Guoguo.

## Let's get into these things chronologically.

### Before Unicode age
Long long ago, the first batch of users of [Computer](https://en.wikipedia.org/wiki/Computer) were English speakers.

As we know, Computer only knows Binary numbers, typically 0 and 1. But Computer cannot recognize English letters directly. So they created [ASCII](http://www.robelle.com/library/smugbook/ascii.html) which was able to represent every English letter and character using a number between 32 and 127 to convert as binary number for computers. And the good thing is that it could conveniently be stored in 7 bits. Most computers are using 8-bit bytes, so there is still 1 whole bit spared.

It was just because of this spared 1 bit, there were messy conflicts of using the last bit in different organizations, countries and localtions. Everybody agreed on what to do below 128, which was pretty much the same as ASCII, but there were lots of different ways to handle the characters from 128 and on up. So Unicode was invented.

### Unicode Time

Unicode simply assigns integers, known as code points, to characters. It has 1.1M seats totally, till now, only 0.11M are already assigned.

Let's take "A" as example:

"A" is stored in Memory as "0100 0001", no matter it is in whatever fonts in your Office Suit. In Unicode way, "A" is U+0041, and the U+ means “Unicode” and the numbers are hexadecimal, we call it code points.

But problem comes again for English letters. Let's take "Hello" as example:

In Unicode, "Hello" corresponds to these five code points: U+0048 U+0065 U+006C U+006C U+006F. 

Problem 1: For these "Hello" English characters, when saving them to Computer as bytes: 00 48 00 65 00 6C 00 6C 00 6F. There are redandent ZEROS stored in expensive memory.

Problem 2: For Chinese character "严", its unicode is U+4E25, to binary number 100111000100101, totally 15 bits. So Unicode will take 2 bytes to store it. Also for some characters, they take more bytes. Then how does computer knows 2 bytes or 1 byte as a character?

To solve these problems, another term "Encoding" comes. Next topic "UTF-8", a popular one.

### UTF-8: an implementation of Unicode
UTF-8 is another system for storing your string of Unicode code points, those magic U+ numbers, in memory using 8 bit bytes. In UTF-8, every code point from 0-127 is stored in a single byte. Only code points 128 and above are stored using 2, 3, in fact, up to 6 bytes.

![](http://www.ciaoshen.com/uploads/tij4-18/utf8.png)

More about UTF-8, refer to [ruanyf blog](http://www.ruanyifeng.com/blog/2007/10/ascii_unicode_and_utf-8.html)

The siblings of UTF-8 are ISO-8859-1, Windows-1252, UCS-2 and so on.

### Summary

Short one: 100111000100101 -> UCS-2/UTF-8(or others) finally we can read it.