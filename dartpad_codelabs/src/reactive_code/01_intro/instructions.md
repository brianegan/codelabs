# Introduction

Welcome to the world of reactive programming! 👋

This workshop is authored by [Pooja Bhaumik](https://poojabhaumik.com/), Google Developer Expert for
Flutter, senior engineer at Uni Cards (Bangalore, India), and the co-founder of WomenDroid community. She
enjoys mentoring folks and helping them grow in their development careers via MentorCruise and
contributing to the tech community through blog posts, public speaking, Youtube videos, and open
source contributions. Find her on [Twitter](https://twitter.com/pooja_bhaumik) or [Linkedin](https://linkedin.com/in/poojab26). 

# So what is reactive programming?

Imagine a variable called ``appThemeColor`` that holds the theme color of the application.

In Reactive Programming, if this data changes in one location, all the other places in the app that
depend on this value should react to the change as well. For example, by updating the UI or performing actions with the new data.

In this workshop, you will extend our default counter app and add reactivity with the help of:

➡️ Streams

➡️ ValueNotifiers

➡️ Riverpod (an extension of Provider)

The current code is a simple Counter app. However, the difference is that the Text part of the
Counter is extracted out as a separate widget called `CounterText()`. The parent widget is the
`CounterPage()`, which holds the floating actions buttons where the increment and decrement calls
take place.

Data updates happen in one widget, and the UI is supposed to rebuild from another widget.

In this particular example, you are calling `setState()` on each count update and passing the current
count value down via the `CounterText()` constructor.

However, you must be aware that `setState()` rebuilds the entire widget tree from where the call
happens. So setState() called from `CounterPage()` will not only rebuild itself but also
the `CounterText()` widget. 

To visually demonstrate this, let's check out the [TODO] comments and add a random generating
background color to both the widgets. Whenever a widget rebuilds, the color will be randomly assigned, and this way we can visually
observe the widget rebuilds.

```dart
Colors.primaries[math.Random().nextInt(Colors.primaries.length)]
```

To call the `Random()` method, you need to import tha `math` package.

```dart
import 'dart:math' as math;
```

On running the project, you can observe how both the widgets are rebuilding on each data update.

This is one con of using setState(): it rebuilds a widget even when there is no state update in
that widget. When we use other techniques of state management, we can optimize these rebuilds and
only update the CounterText() widget when data change occurs.

Let's move into the workshop now!
