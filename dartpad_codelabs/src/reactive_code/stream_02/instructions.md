# Reactive Programming with Streams

There are two aspects of Reactive Programming.

1️⃣ where the data/state change occurs or gets triggered from.

<!-- I kinda felt like all of this should be grouped under the "Listeners" bullet point since it all relates to listening to changes, but please feel free to ignore! -->
2️⃣ listeners (one or more) who react to the data change. Listeners may be pure Dart code that performs an action in response to a data change or a widget that rebuilds its UI. In our case, we have the `CounterText` widget that should listen to new events added to the `Sink` and update the UI to display the current count.


## Trigger a Data/State Change

To add an event to the stream that will eventually trigger a data update, you can insert the new version of the data to the `Stream`'s sink by the following
manner:

```dart
_streamController.sink.add(updatedData);
```

<!-- I added headings to emphasize what each section was explaining -->
## Listen to Data/State Changes

The UI component that needs to rebuild as a reaction to this updated data, needs
to wrap a `StreamBuilder()` widget around it. The `StreamBuilder` listens to a
`stream` of data and rebuilds the UI whenever new data is added.

```dart
StreamBuilder(
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Text(snapshot.data != null ? snapshot.data.toString() : "0",
    ),
  },
stream: stream,);
```

The `stream` property takes in the `Stream` object that holds your data and should be associated with
this `StreamBuilder` widget. And the ``builder`` returns the Widget that you want to render when
a new event (or in your case, new count value) is added onto the given `Stream` object. To get the latest snapshot of the Stream, in our case the updated
count value, we use `snapshot.data`.

Now let's resolve our *TODOs*.

## TODO: Increment/Decrement `_count` and add event to the Stream
Here, is where you can add the logic for incrementing and decrementing the count value using `StreamController`.

```dart
_streamController.sink.add(_count++);
```
Here, the count value is incremented and added to the `Stream`'s sink. (Remember our kitchen sink example?) Now the listeners of
this Stream will automatically reflect when the latest data hits the Stream. Next, try to apply the same logic
for the decrement method where `_count` will be reduced by 1.

## TODO: Wrap the Container with a StreamBuilder
We still do not have any listeners yet. In this example, since the data change needs to be listened to by a UI component, the listener should be a StreamBuilder. 

So let's wrap the entire `Container` code in the `CounterText` widget with a `StreamBuilder<int>`
so it can reflect on the data change and update the UI when count is incremented or decremented. The
example code for StreamBuilder is right above, so you can use that as a reference.

## TODO: Pass `_stream` to CounterText instead of `_count`
The `CounterText` widget does not have direct access to the Stream object created in its parent
widget, so you can pass the Stream object via the `CounterText` constructor and remove the `_count` property from its constructor.

```dart
class CounterText extends StatelessWidget {
  final Stream stream;

  const CounterText({Key? key, required this.stream}) : super(key: key);

//...
}
```

Make sure to update the `CounterText()` object in `CounterPage` as well. Try to attempt the StreamBuilder portion on your own, and
run the code. The counter page will finally work again and on tapping the floating actions buttons, the count value will change accordingly.

Also note: Only the `CounterText()` widget is rebuilding here (notice the background color change?),
and not the entire `CounterPage()` widget.

And that's it, you successfully replaced `setState()` with Streams from the default counter app. 

To learn more, 
* [Read the Dart docs on Streams](https://dart.dev/tutorials/language/streams)
* [More about StreamBuilder](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html)

