---
layout: post
title: Understanding the Event Model
tags:
    - web
---

# What is an Event?

An event is a notification that occurs in response to an action, such as clicking, key pressing, or state changes in document.

## The Life Cycle of an Event

1. The user action or condition associated with the event occurs.
2. The event object is instantly updated.
3. The event fires.
4. The event handler associated with the source element is called, carries out its actions, and returns.
5. The event bubbles up to the next element in the hierarchy, and the event handler for that element is called. This step repeats until the event bubbles up to the window object or a handler cancels bubbling.
6. The final default action, if any, is taken, but only if this action has not been canceled by a handler.

Here is an example to explain event bubbling.

~~~html
<html>
<body onclick="wasClicked()">
    <h1>Welcome!</h1>
    <p>This is a very short document.</p>
</body>
<script>
    function wasClicked() {
        alert("I was clicked " + window.event.srcElement.tagName);
    }
</script>
</html>

~~~

## Event Bubbling

Event bubbling ensures that the event handlers for all elements in which an event occurs have an opportunity to respond to the event. Bubbling events will then trigger any additional event listeners found by following the Node's parent chain upward, checking for any event listeners registered on each successive Node. This upward propagation will continue up to and including the Document.

Event handler may choose to prevent continuation of the bubbling process by calling the *preventBubble* method of the Event interface.

## Canceling Default Actions

Cancelation is accomplished by calling the Event's *preventDefault* method. If one or more EventListeners call *preventDefault* during any phase of event flow the default action will be canceled.

Canceling a default action is not the same as canceling event bubbling. You can cancel the default action and still allow the event to bubble up through the hierarchy.

## Event object

The web browser defines many events of different kinds. Each definition includes, as the data structure passed to the handler function, an object which inherits from the *EventPrototype* object.

> references: [w3 event specs](https://www.w3.org/TR/DOM-Level-2-Events/events.html)