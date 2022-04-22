# Reactive Programming with Streams

This is Part one of our reactive programming series. In this part, you learn to write reactive code
with Streams & StreamBuilder which are part of the core Flutter SDK.

To understand Streams, imagine a kitchen sink in your house that is connected with a pipe. Anything
that you throw in the sink, flows via the pipe and comes out from the other end. 

Here, you can say that the pipe is carrying a `Stream` of things. The `sink` is allowing you to add
things into the pipe. And to control the stream, you can use the ``StreamController``.

In our example, you need a Stream that carries only `int` objects, so it can hold only the count value.

So let's work on your first <b>TODO</b> of this part.

## TODO[1]: Initialize StreamController and Stream

Let's create two objects, one of `Stream<int>` and another of `StreamController<int>`. This needs to be initialized in the overridden `initState()`
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

``_streamController.stream`` is the stream that this controller is controlling, so you can extract it
out to a variable that can be easily passed around.

On adding the above lines, you will get a compile-time error that says:

```
Undefined class `StreamController`
```

This is because you haven't imported the `async` package that let's you use `Stream`
and `StreamController` classes.

Add this import to the top of your class file:

```dart
import 'dart:async';
```

A sequence of events can now added onto this Stream.

## TODO[2]: Dispose the StreamController on onDispose()

When the widget is destroyed, the StreamControllers needs to be disposed as well. This is also the reason why you need to use a StatefulWidget here.

To resolve this, override the `dispose()` method of your State class, and call the `.close()` method on your `_streamController`.
```dart
 @override
void dispose() {
  _streamController.close();
  super.dispose();
}
```

Once you close the stream controller, no further events can be added to this stream. 

On running this code, no visual change will be seen on the app, but internally, it's creating a `Stream` that can hold your count values and an associating `StreamController` for `CounterPage()` widget. 

PS: Remove the *TODO* comments as you proceed. Let's move to the next step. 

