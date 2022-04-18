# Reactive code with Riverpod - Step 2

## Reading Providers

To read/access any provider, you need an instance of the `Ref` object. You can also use `Ref` to
interact with other providers. And then there is the the `WidgetRef` object which allows widgets to
interact with providers and that is what you will be using in the current example.

Riverpod allows us to read or listen to the states associated with the provider. You can
do ``ref.watch(provider)`` to listen to a provider and reactively rebuild UI on state updates. In
other cases when you do not want to rebuild UI but just access the state of the provider, or rather
the current value associated with the state, in those scenarios, simply do ``ref.read(provider)``

So in this case, the `CounterText` widget should definitely watch for the provider changes and
rebuild itself on a state change. So you can use the `ref.watch()` method there.

However, the floating action buttons do not need to listen or watch for the state change, they only
have to call the `increment()` or `decrement()` method without having to rebuild itself. So, in this
case, you can use ``ref.read(provider)``

## But how to get this [WidgetRef] object?

A `WidgetRef` object needs to be associated with a widget and there are two ways we can do that.

`Consumer()` widget that can be wrapped around any widget that needs to rebuild. This is very
similar to the `StreamBuilder` & `ValueListenableBuilder` concepts.

```dart
Consumer(
  child: SomeWidgetThatNeedsNoRebuilds(),
  builder: (BuildContext context, WidgetRef ref, Widget? child) {
    final value = ref.watch(valueProvider);
    return Column(
      children: [
        Text(value.toString()), 
        child, // this child wont rebuild
       ]
      )
    },
  );
```

Like the ValueListenableBuilder, the builder of a `Consumer` widget exposes a BuildContext, `WidgetRef` object, and also the optional child
widget that is independent of any widget rebuilds.

And then we have the ConsumerWidget or ConsumerStatefulWidget which is basically a StatelessWidget
or StatefulWidget respectively and can implicitly listen to or read providers.

For e.g, in the following snippet, you have a Stateless class that subclasses `ConsumerWidget` and
exposes the `WidgetRef` object through the `build(context, WidgetRef ref)` method and inside this build() method block, you can use
the `ref` object to listen to one or more providers.

```dart
class AmountWidget extends ConsumerWidget {
  const AmountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final price = ref.watch(priceProvider);
    final currency = ref.watch(currencyProvider);
    return Text(currency + price);
  }
}
```

## TODO: Convert CounterText to ConsumerWidget and watch the counterProvider inside build()

The `CounterText` widget in the counter example needs to constantly listen to the state changes of
the counterProvider, so it probably makes sense to change the StatelessWidget to a ConsumerWidget
here and update the build method signature.

```dart
class CounterText extends ConsumerWidget {
  //...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //...
  }
}
```

Now let's remove the constructor count variable and replace it with a local variable inside build
method. Inside `build()`, watch for the `counterProvider` and fetch the current value, store it in a local `count` variable and
provide it to the Text widget.

```dart
Widget build(BuildContext context, WidgetRef ref) {
  int count = ref.watch(counterProvider);

  //...
  Text(count.toString(),);
  //...
```

## TODO: Trigger the CounterNotifier methods from onPressed

But the increment and decrement methods that were created in the CounterNotifier class are still not called from the floating action button'
s `onPressed`
blocks. In order to do that, the global constant `counterProvider` needs to be read inside your onPressed block and then you can simply call the methods inside the notifier class to
perform the corresponding actions.

So for increment, it would be like this:

```dart
ref.read(counterProvider.notifier).increment();
```

``counterProvider.notifier`` obtains the notifier associated with this provider, and then you can
get access to the methods that are part of this notifier class.

However, the `ref` object is needed only in the floating action button blocks, so it doesn't make sense to
completely convert the CounterPage widget to a ConsumerWidget. So in this case, you can use the
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
         //...
        ],
    );
})
```

And now the `ref` object is exposed via the Consumer `builder()` method and you can directly call `ref.read(counterProvider.notifier).increment();` in the `onPressed`
blocks and trigger the data update.

## TODO: Wrap the root widget with ProviderScope
However, for the entire widget tree to be able to read providers, the entire application needs to be wrapped
with ``ProviderScope()``. This is where the state of the providers will be stored. So in
your `main()` method, you can wrap the `MyApp()` widget with `ProviderScope()`

```dart
ProviderScope(
   child: MyApp(),
 ),
```

Now, run the code, and it will all work for you! Riverpod is vast and can do tons of things for
managing your state and enforcing reactive, clean and testable code. So definitely go ahead and
learn more about it in their [documentation](https://riverpod.dev/docs)

Congratulations! 👍 You have reached the end of the workshop!

In this workshop, we explored reactive programming in Flutter in 3 different methods, which are Streams, ValueNotifiers & Riverpod. Each have their own pros and cons, but hopefully this gives you a basic clarity on the differences so you can choose the
best method for your particular usecase. 

This is [Pooja Bhaumik](https://twitter.com/pooja_bhaumik), signing off!


