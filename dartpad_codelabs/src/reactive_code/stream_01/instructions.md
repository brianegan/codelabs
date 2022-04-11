# Reactive Programming with Streams

This is Part one of our reactive programming series. In this part, we learn to write reactive code
with Streams & StreamBuilder which are part of the core Flutter SDK.

To understand Stream, imagine a kitchen sink in your house that is connected with a pipe. Anything
that you throw in the sink, flows via the pipe and comes out from the other end. 

Here, you can say that the pipe is carrying a `Stream` of things. The `sink` is allowing you to add
things into the pipe. And to control the stream, we can use the ``StreamController``.

In our example, we need a Stream that carries only `int` objects, so it can hold the count value.

So let's work on our first TODO of this part. Let's create two objects, one of `Stream<int>` and
another of `StreamController<int>`. This needs to be initialized in the overridden `initState()`
method of our `CounterPage()`

```dart
late final StreamController<int> _streamController;
late final Stream<int> _stream;

@override
void initState() {
  _streamController = StreamController();
  _stream = _streamController.stream;
  super.initState();
}
```

``_streamController.stream`` is the stream that this controller is controlling, so we can extract it
out to a variable so we can pass it around.

On adding the above lines, you will get a compile-time error that says

```
Undefined class `StreamController`
```

This is because we haven't import the `async` package that let's us use `Stream`
and `StreamControllers`.

Add this import to the top of your class file

```dart
import 'dart:async';
```

Before we proceed, we also need to dispose the StreamControllers as and when this widget is
destroyed. This is also the reason why we're bound to using a StatefulWidget here.
StreamControllers.

The next TODO can be resolved if you add this block after your `build()` method. (Location is just a
preference)
```dart
 @override
void dispose() {
  _streamController.close();
  super.dispose();
}
```

NOTE: Remove the TODO comments as you proceed. Let's move to the next step. 

