---
layout: post
title: 8012 React Recap
tags:
    - ReactJS
---
## 2018, ReactJS Recap

Since last time I opened reactjs.org, it has been a long time.


1. Context

For example, 

```
const ThemeContext = React.createContext('light');

```

Then the ThemeContext will have Provider and Consumer ready to use.

refs: ()[https://reactjs.org/docs/context.html]

Personally thought, not good to use.

2. componentDidCatch

This is a good thing, and easily integrated with redux saga

3. Fragments

This is a good thing, something I need to return a list of dom elements, but I dont want to wrap it into a div.

Can do it using ```return <> <div>I am A</div> <div> I am B </div> <>```

4. HOC, Higher-Order Component

Similar to Proxy Pattern, I dont use at least

5. Refs and DOM

Since 16.3, ```refs``` API is changed to ```React.createRef()```. Now define refs in constructor and then use it using ```this```

Another way to use it is called ```callback refs```, I personally use this pattern more.


