---
layout: post
title: Let's build a simple grid system like Bootstrap
---

### 1. What is a Grid System?
A grid system, in the scope of css, is a structure to build stacked content vertically and horizontally.

### 2. Two basic components
Grid system, at lease, has two basic components: row and column, but some grid systems have a wrapper above basic components, __container__ from Bootstrap, for example.

Additionally, the two components don't include the padding and border within the declared width and height. To make it ready for responsiveness, we can set [box-sizing](https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing) property to ```border-box``` for both rows and columns:

```
.row, .column {
    box-sizing: border-box;
}
```

Now we can leverage percentages for the widths of the columns. This allows the columns to scale upwards and downwards within different viewports while maintaining the structure.

### 3. Make row clearfixed
One line one row, so the row component must clear all the floating elements on both sides of it.

```
.row:before, .row:after {
    content: " ";
    display: table;
}
```

```
.row:after {
    clear: both;
}
```

### 4. Make column floated and aesthetic
Since column is accommodated inside of row, it is floated horizontal alignment, and the position should be relative to allow any absolutely position content within the column to be positioned relative to that column

```
.column {
    position: relative;
    float: left;
}
```

To make columns aesthetic, a simple gutter is needed:

```
.column + .column {
    margin-left: 1.6%;
}
```

### 5. Calculating column width
Now we need to determine the maximum amount of columns per row, before calculating the width of column. Let take Bootstrap's choice: 12 columns per row.

The calculation will be based on formula:

> __scw = (100 – (m * (mc – 1))) / mc__

> scw = single column width <br />
> m = margin (1.6%) <br />
> mc = maximum columns (12) <br />

So the single column's width is 6.86666666667%

```
.column-1 {
    width: 6.86666666667%;
}
```

```
.column-2 {
    width: 15.3333333333%;
}
```

```
.column-3 {
    width: 23.8%;
}
```

```
.column-4 {
    width: 32.2666666667%;
}
```

```
.column-5 {
    width: 40.7333333333%;
}
/* omitted */
```

### 6. Optimizing for mobile devices
To adapt to various devices with smaller viewports, we need [Media Queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries) to set the rule:

```
@media only screen and (max-width: 550px) {
  .column-1,
  .column-12 {
    width: auto,
    float: none
  }
  .column + .column {
    margin-left: 0;
  }
}
```

### 7. Finally, put everything together.

Here is a demo:

<p data-height="265" data-theme-id="0" data-slug-hash="QEwMyP" data-default-tab="html,result" data-user="nevermoi" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/nevermoi/pen/QEwMyP/">Understanding CSS Grid Systems</a> by nevermoi (<a href="http://codepen.io/nevermoi">@nevermoi</a>) on <a href="http://codepen.io">CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>