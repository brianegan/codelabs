# Reactive code with ValueNotifier - Step 2

Like we had the StreamBuilder for streams, we will also need another widget that can listen to
ValueNotifiers easily. And that is resolved with `ValueListenableBuilder()`. In this case,
the `builder()` takes a BuildContext, an optional widget that is independent of the value notifier's
data and doesn't need any rebuilds, and exposes the value of the notifier.

The builder returns a Widget that should be rebuilt on every value update of the notifier.

We can pass the notifier object to the `valueListenable` property of the `ValueListenableBuilder()`
and this way the builder and the notifier is associated with each other.

```dart
ValueListenableBuilder
  (builder: (context, value, child) {
    return Text(
      value.toString(),
    );
  },
valueListenable: notifier,);
```

Like the Stream & StreamBuilder example, we can directly pass the `notifier` to the `CounterText`
widget constructor instead of the count variable.

```dart
final ValueNotifier notifier;
CounterBody({ Key? key , required this.notifier }):super(key: key);
```

Note again: Only the `CounterText()` is rebuilding on data update.

The `StatefulWidget` is also not really required for the `CounterPage()`, because there is no
initialization or disposal logic here. So we can reduce the `StatefulWidget` to a Stateless one. 

And that's it for the ValueNotifier method. To learn more about this technique, go to: 