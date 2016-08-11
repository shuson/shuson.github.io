---
layout: post
title: Some tips about Strict Mode of JavaScript
tags:
    - javascript
---

# What does Strict Mode bring to us

1. strict mode eliminates some JavaScript silent errors by changing them to throw errors.
2. strict mode fixes mistakes that make it difficult for JavaScript engines to perform optimizations: strict mode code can sometimes be made to run faster than identical code that's not strict mode
3. strict mode prohibits some syntax likely to be defined in future versions of ECMAScript.

# Invoking Strict Mode

1. Strict mode applies to entire __scripts__ or to individual __functions__. It doesn't apply to block statements enclosed in {} braces;
2. It is recommended that you enable strict mode on a function-by-function basis, because concatenating strict and non-strict scripts is problematic.

# Changes in strict mode

1. Converting mistakes into errors
2. Simplifying variable uses
3. Making eval and arguments simpler
4. "Securing" JavaScript
5. Paving the way for future ECMAScript versions
