# Reactive Programming with ValueNotifier

`ValueNotifiers` are also available in the core SDK, and it is basically like a ChangeNotifier but
holds only a single value. In a ChangeNotifier, we have to explicitly trigger `notifyListeners()`
after making a data change so the listeners can update itself. But ValueNotifiers will automatically
notify its listeners when the new value is != old value.

Let's create a ValueNotifier object with an initial value of 0 and the type should be strictly
an `int`.

```dart

final ValueNotifier<int> valueNotifier = ValueNotifier(0);
```

Now this ValueNotifier object exposes a ``value`` property that is the current snapshot of the data
stored in this notifier. To increment the count value, we need to access this `value` property and
update the count. This is how we would increment the count in the notifier:

```dart
void increment() {
  valueNotifier.value++;
}
```

Now try the same for the decrement method.

On running this code, the UI will still not update because we have not registered any listeners for
this ValueNotifier. Let's add that in the next step. 
