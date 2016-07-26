---
layout: post
title: Why Junit Cases not run in order in JDK 7.
tags:
    - java
---

### Conclusion first: 
Junit uses reflection for getting and executing test methods. Junit get list of all tests using "Method[] getDeclaredMethods()" from java.lang.Class.

> __The elements in the array returned by getDeclaredMethods are not sorted and are not in any particular order.__

### How to make executions order fixed
Since JUnit 4.11, you can do:

```
 @FixMethodOrder(MethodSorters.NAME_ASCENDING)
 public class MyTest {
 }

```

Reference: 
[MethodSorters](http://junit.org/javadoc/latest/index.html?org/junit/FixMethodOrder.html) <br />
[Annotation Type FixMethodOrder](http://junit.org/javadoc/latest/index.html?org/junit/FixMethodOrder.html)
