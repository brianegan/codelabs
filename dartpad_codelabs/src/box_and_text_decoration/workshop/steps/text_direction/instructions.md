# Inherited `TextDirection`

By default, Flutter does not know which direction to display text: left-to-right
(LTR) or right-to-left (RTL). In the previous step, you configured each `Text`
widget with a specific `TextDirection`. While this solves a problem for Flutter,
it introduces a problem for you: How can you configure all of your Text widgets
to use the same `TextDirection`? 

To solve this challenge, `Text` widgets may inherit the appropriate
`TextDirection` from a parent `Directionality` widget. You can either explicitly
create a `Directionality` widget or implicitly create a `Directionality` widget
using a `WidgetsApp`, `MaterialApp` or `CupertinoApp`.

## Explicit `Directionality`

First, create a `Directionality` Widget by hand and define the `textDirection`.
Any `Text` Widget that sits inside the `Directionality` Widget can look up
the Widget tree to "find" or "inherit" the correct `TextDirection`. Therefore,
we can remove the `textDecoration` argument from the `Text` widget!

```dart
Directionality(
  textDirection: TextDirection.ltr,
  child: Text(
    'This is a bit of text!',
  ),
);
```

## Implicit `Directionality`

Instead of defining the `TextDirection` explicitly with a `Directionality`
widget, it often makes sense to determine the `TextDirection` based on the
language being displayed. This is exactly what the `WidgetsApp`, `MaterialApp`,
and `CupertinoApp` do.

You define which locale the app should be displayed in and it will implicitly 
create the appropriate `Directionality` widget. Voila, all of your `Text` 
widgets inherit the same `TextDirection`!

```dart


```
