# Reactive code with ValueNotifier - Step 2

Just as you have a `StreamBuilder` that can listen to a `Stream`, you will also need a widget that can
listen to a `ValueNotifier` easily. And that is resolved with `ValueListenableBuilder()`.

## TODO: Wrap the Container by ValueListenableBuilder that can listen to a ValueNotifier

A `ValueListenableBuilder` has two required parameters, `valueListenable` and `builder`. To associate
a `ValueNotifier` with a `ValueListenableBuilder`, you can assign the notifier to the `valueListenable`
property, just like the `stream` property of a `StreamBuilder`. The `builder` function exposes a `BuildContext`, the current snapshot or value of the notifier, and an optional child
widget that is independent of the value notifier's data so won't need any rebuilds.

The builder must return a Widget that needs to rebuild on every value update of the notifier.

```dart
ValueListenableBuilder(
    valueListenable: _someNotifier,
    child: WidgetThatNeedsNoRebuilds(),
    builder: (BuildContext context, T value, Widget? child) {
       return Column(
         children: [ 
           Text(value.toString()),
           child, // this child wont rebuild
          ]
       )
    },
);
```

## TODO: Pass the notifier down to CounterText instead of count

Like the Stream & StreamBuilder example, you can directly pass the `notifier` to the `CounterText`
widget constructor instead of the count variable.

The following code is the change you have to apply for the `CounterText` constructor.

```dart
final ValueNotifier notifier;
CounterBody({ Key? key , required this.notifier }):super(key: key);
```

Then in your CounterText widget, simply assign the notifier object to the `valueListenable` property
of the `ValueListenableBuilder()` and this way the builder and the notifier is associated with each other.

Note again: Run the final code and you can observe that only the `CounterText()` is rebuilding on
data update.

The `StatefulWidget` is also not really required for `CounterPage`, because there is no
initialization or disposal logic here. So we can reduce the `StatefulWidget` to a Stateless one.

And that's it. You successfully built a simple counter app with ValueNotifiers.

To learn more:

* [Read about ValueNotifier class](https://api.flutter.dev/flutter/foundation/ValueNotifier-class.html)
* [Watch the Flutter Widget of the Week video that explains ValueListenableBuilder](https://api.flutter.dev/flutter/widgets/ValueListenableBuilder-class.html)
