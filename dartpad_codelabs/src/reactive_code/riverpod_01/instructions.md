# Reactive code with Riverpod

This is the last part of our workshop, where you learn to write reactive code with Riverpod.
Riverpod is not part of the core Flutter SDK. Rather, it is a community built solution that is widely popular
among Flutter developers.

<!-- Maybe talk about how Riverpod extends the concepts of ValueNotifier to make it easy to read ValueNotifiers throughout your app without needing to pass variable? Then, in the next step you could say "See, riverpod allows you to remove the constructor variable here! :)" -->

Riverpod is developed by [Remi Rousselet](https://github.com/rrousselGit), and is considered as a
2.0 upgrade of the officially recommended [Provider](https://pub.dev/packages/provider) package. In
fact, it has tons of improvements over Provider. It is compile time safe and doesn't directly depend
on the Flutter SDK or the widget tree so you can use it for pure Dart specific logic as well. Learn
more about Riverpod [here](https://riverpod.dev/)

In Riverpod, a provider is a very important part of an application using Riverpod. By the docs, the
definition of a provider is:

``A provider is an object that encapsulates a piece of state and allows listening to that state.``

Riverpod exposes multiple types of Providers for different types of use-cases, but in this workshop,
you will work only with `StateNotifierProvider`.

With Riverpod, you can subclass `StateNotifier<T>` for immutable data or state that can change over
time after reacting to different actions or user interactions. This class will teach us how to hold
the business logic for that particular state. For example, the increment logic can be abstracted out in
this class itself instead of exposing it in the widget code.

<!-- Maybe talk about how StateNotifier works almost exactly like ValueNotifier, but with a state variable? Changing the state variable will notify listeners a change has occurred... etc, feel like that context is missing here a bit.-->

## TODO: Extend the class with a StateNotifier<int> and provide an initial count value of 0.

Let's check the first TODO, and extend the `CounterNotifier` class with `StateNotifier<int>`.

```dart
class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);
}
```

Don't forget to import the riverpod package:

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
```

## TODO: Increment/Decrement the state

The StateNotifier class exposes a `state` object that holds the current value of the state, in this
case, the `count` value. And to update the state, you can directly reassign the exposed state
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

So now the business logic has been moved out of the widget code into the StateNotifier class.

## TODO: Create a global provider to access CounterNotifier and its state

Now to access this provider class from our widget classes, you need to declare a global constant
that returns a singleton instance of the CounterNotifier class. Let's declare this just above
the `main()` method.

```dart

final counterProvider = StateNotifierProvider<CounterNotifier, int>(
      (ref) => CounterNotifier(),
);
```

Here, ``counterProvider`` is the name of the provider constant. And in `StateNotifierProvider<T, K>`
, `T` takes in a StateNotifier class type, and `K` takes in the type for the State you are holding
in your associated StateNotifier class. 

On running this code, there won't be any visual change, but internally it is creating the
counterProvider variable that returns the CounterNotifier and its state.

In the next step, you will learn how to actually access the state from the StateNotifier class and
call the notifier methods to trigger a data change that eventually update the UI.
