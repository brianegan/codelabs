# Reactive Programming with Streams

Now there are two aspects to reactive coding.

1️⃣ where the data/state change occurs or gets triggered from.

2️⃣ listeners who react to the data change.

It could either be a pure Dart code that performs an action reacting to the data change or a UI
component/widget that rebuilds its UI configuration reacting to the new state.

In our case, we have the `CounterText` widget that needs to react to the data change in the stream
and display the current count value.

To trigger a data update, we can insert the new version of the data to the Stream's sink in this
manner.

```dart
_streamController.sink.add(updatedData);
```

And the UI component that needs to rebuild as a reaction to this updated data, needs to wrap a
`StreamBuilder()` widget around it.

```dart
StreamBuilder(
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Text(snapshot.data != null ? snapshot.data.toString() : "0",
    ),
  },
stream: stream,);
```

The `stream` property takes in the `Stream` object that needs to be associated with
this `StreamBuilder` widget. And the ``builder`` returns the Widget that you want to render when
data changes in the given `Stream` object. To get the current value of the Stream, in our case the
count value, we use `snapshot.data`.

Now let's resolve our TODOs and add the logic for incrementing and decrementing the count value
via `StreamController`.

```dart
_streamController.sink.add(_count++);
```

Here, we are incrementing the count value and adding it to our Stream's sink. Now the listeners of
this Stream will automatically reflect when this data change occurs. Now try to apply the same logic
for the decrement method where `_count` will be reduced by 1.

We still do not have any listeners yet.

So let's wrap the entire `Container` code in the `CounterText` widget with the `StreamBuilder<int>`
so it can reflect on the data change and update the UI when count is incremented or decremented. The
example code for StreamBuilder is right above, so you can use that as a reference.

The `CounterText` widget does not have direct access to the Stream object created in its parent
widget, so you can pass the Stream object via the `CounterText` constructor.

```dart
class CounterText extends StatelessWidget {
  final Stream stream;

  const CounterText({Key? key, required this.stream}) : super(key: key);

//...
}
```

Resolve the errors on the CounterPage and try to attempt the StreamBuilder portion on your own, and
run the code. The counter page will finally work again with the proper trigger to incrementing and
decrementing of the count value.

Also note: Only the `CounterText()` widget is rebuilding here (notice the background color change?),
and not the entire `CounterPage()` widget.

And that's it, we built a simple counter app with Streams. To learn more about Streams, go to : 