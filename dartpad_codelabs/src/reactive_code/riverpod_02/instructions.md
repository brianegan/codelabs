# Reactive code with Riverpod - Step 2

## Reading Providers

To access any provider, we need an instance of the `Ref` object. We can also use `Ref` to interact
with other providers. And then we also have the `WidgetRef` which allows widgets to interact with
providers and that is what we will be using in our example.

Riverpod allows us to read or listen to the states associated with the provider. We can
do ``ref.watch(provider)`` to listen to a provider and reactively rebuild UI on state updates. In
other cases when we do not want to rebuild UI but just access the state of the provider, or rather
the current value associated with the state, in those scenarios, we can simply
do ``ref.read(provider)``

So in our case, our `CounterText` widget should definitely watch for the provider changes and
rebuild itself on a state change. So we can use the `ref.watch()` method there.

However, the floating action buttons do not need to listen or watch for the state change, they only
have to call the `increment()` or `decrement()` method without having to rebuild itself. So, in this
case, we can use ``ref.read()``

## But how to get this [WidgetRef] object?

A `WidgetRef` object needs to be associated with a widget and there are two ways we can do that.

`Consumer()` widget that can be wrapped around any widget that needs to rebuild. This is very
similar to the `StreamBuilder` & `ValueListenableBuilder` concepts.

```dart
Consumer(
  builder: (BuildContext context, WidgetRef ref, Widget? child) {
    final value = ref.watch(valueProvider);
    return Text(value); // Hello world
    },
  );
```

And then we have the ConsumerWidget or ConsumerStatefulWidget which is basically a StatelessWidget
or StatefulWidget respectively and can implicitly listen to or read providers.

For e.g, here we are creating a class that subclasses `ConsumerWidget` and provides access to
a `WidgetRef` object which eventually allows the widget tree to listen to one or more providers.

```dart
class SomeWidget extends ConsumerWidget {
  const SomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    return Text(value);
  }
}
```

The `CounterText` widget in our example needs to constantly listen to the state changes of the
counterProvider, so it probably makes sense to change the StatelessWidget to a ConsumerWidget here
and update the build method signature.

```dart
class CounterText extends ConsumerWidget {
  //...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //...
  }
}
```

Now let's remove the ``final`` count variable and replace it with a local variable inside build
method. Inside `build()`, we will watch for the `counterProvider` and fetch the current value and
provide it to the Text widget.

```dart

int count = ref.watch(counterProvider);

//
Text(count.toString(),);
```

But we still haven't added the increment and decrement logic in our floating action button'
s `onPressed`
blocks. We simple need to read the `counterProvider` and call the methods inside the class to
perform the corresponding actions.

So for increment, it would be like this:

```dart
ref.read(counterProvider.notifier).increment();
```

``counterProvider.notifier`` obtains the notifier associated with this provider, and then you can
get access to the methods that are part of this notifier class.

However, we need this `ref` object only in our floating action button, so it doesn't make sense to
completely convert our CounterPage widget to a ConsumerWidget. So in this case, we can use the
wrapper widget `Consumer` and wrap it around the `Column` that holds the two FloatingActionButtons.

```dart
Consumer(
     builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Column(
        //...
          children: [
            FloatingActionButton(
            //...
          ),
        ],
    );
})
```

And now you can directly call `ref.read(counterProvider.notifier).increment();` in the `onPressed`
blocks and trigger the data update.

However, for widgets to be able to read providers, the entire application needs to be wrapped
with ``ProviderScope()``. This is where the state of the providers will be stored. So in
your `main()` method, you can wrap the `MyApp()` widget with `ProviderScope()`

```dart
ProviderScope(
   child: MyApp(),
 ),
```

Now, run the code, and it will all work for you! Riverpod is vast and can do tons of things for
managing your state and enforcing reactive, clean and testable code. So definitely go ahead and
learn more about it in their documentation. https://riverpod.dev/docs

And that's a wrap for this workshop! Hopefully, you are less confused about writing reactive code in
Flutter and can explore more about Streams, ValueNotifiers & Riverpod/Providers and choose the
correct technique for your usecase. 


