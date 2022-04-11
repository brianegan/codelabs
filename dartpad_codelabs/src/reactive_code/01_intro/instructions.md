# Introduction

Welcome to the world of reactive programming!

## So what is reactive programming?

Imagine a variable called ``appThemeColor`` that decides the theme, background colors of the
application.

In Reactive Programming, if this data changes in one location, all the other places in the app that
are depending on this value react to this data update and these registered listeners automatically
update the UI or perform actions depending on the new data.

In this workshop, we will extend our default counter app, and add reactivity with the help of

* Streams
* ValueNotifiers
* Riverpod (an extension of Provider)

The current code is a simple Counter app, however the difference is that the Text part of the
Counter is extracted out as a separate widget called `CounterText()`, and the parent widget is the
`CounterPage()` which holds the floating actions buttons where the increment and decrement calls
take place.

So data update happens in one widget, and the UI is supposed to rebuild from another widget.

In this particular example, we are calling `setState()` on each count update and passing the current
count value down via the `CounterText()` constructor.

However, you must be aware that `setState()` rebuilds the entire widget tree from where the call
happens. So setState() called from `CounterPage()` will not only rebuild itself but also
the `CounterText()` widget.

To visually demonstrate this, let's check out the [TODO] comments and add a random generating
background color to both the widgets.

So whenever a widget rebuilds, the color will be randomly assigned, and this way we can visually
observe the widget rebuilds.

```dart
Colors.primaries[math.Random().nextInt(Colors.primaries.length)]
```

To call the `Random()` method, you need to import tha `math` package.

```dart
import 'dart:math' as math;
```

On running the project, you can observe how both the widgets are rebuilding on each data update.

This is one con of using setState() that it rebuilds a widget even when there is no state update in
that widget. When we use other techniques of state management, we can optimize these rebuilds and
only update the CounterText() widget when data change occurs.

Let's move into the workshop now!