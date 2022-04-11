# Reactive code with Riverpod - Step 1

Riverpod is developed by [Remi Rousselet](https://github.com/rrousselGit), and is considered as a
2.0 upgrade of the officially recommended Provider package. Riverpod has tons of improvements over
Provider. It is compile time safe, doesn't directly depend on the Flutter SDK or the widget tree so
you can use it for pure Dart specific logic as well. In this 3rd and last part, we will rewrite our
counter app with Riverpod solution.

Riverpod exposes multiple types of Providers for different types of use-cases, but in this workshop,
we will only work with `StateNotifierProvider`.

With Riverpod, we can subclass StateNotifier<T> for immutable data or state that can change over
time after reacting to different actions or user interactions. This class will also help us hold the
business logic for that particular state. For e.g our increment logic can be abstracted out in this
class itself instead of exposing it in the widget code.

Let's check our first TODO, and extend the `CounterNotifier` class with `StateNotifier<int>`.

```dart
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
}
```

Don't forget to import the riverpod package

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
```

The StateNotifier class exposes a `state` object that holds the current value of the state, in our
case, the `count` value. And to update the state, we can directly reassign the exposed state
variable with the new updated data.

Let's add the counter specific business logic inside the StateNotifier class itself.

```dart
void increment() {
  state++;
}

void decrement() {
  state--;
}
```

Now to access this provider class from our widget classes, we need to declare a global constant that
returns a singleton instance of the StateNotifier provider class. Let's declare this just above
the `main()` method.

```dart

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
      (_) => CounterNotifier(),
);
```

In the next step, we will show how to actually access the state from the StateNotifier class and how
to to call the notifier methods to trigger a data change.