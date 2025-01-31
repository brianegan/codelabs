# Introduction

Flutter is a toolkit for building User Interfaces, known as UIs. UIs are a
composition of boxes and text laid out on screen. One box may display an image
with a drop shadow, while another box may have rounded corners with some text
sitting on top of a background gradient.

Therefore, the first stop on your Flutter journey is to learn how to style
boxes and text! In the land of Flutter, this is known as Box Decoration and Text
Styling.

# Decorating Boxes

In order style or decorate a portion of the screen with a background color or 
gradient, create a `DecoratedBox` widget and provide `BoxDecoration` 
information via the `decoration` parameter.

```dart
DecoratedBox(
  decoration: BoxDecoration(
    // Define box "styles" or decorations here
  ),
);
```

## Background Colors

To define a background color, pass a `color` parameter to the `BoxDecoration`
constructor. 

```dart
DecoratedBox(
  decoration: BoxDecoration(
    color: Colors.red,
  ),
);
```

Now it's your turn: First, apply a background to the `DecoratedBox` using a few
`Colors` provided by Flutter. Then, create your own `Color`!

## Background Gradients

To define a background gradient, pass a `gradient` parameter to the
`BoxDecoration` constructor. Flutter includes two types of gradients:
`LinearGradient` and `RadialGradient`. Each type of gradient can be configured
in different ways: you can change the colors, stops, and direction.

```dart
DecoratedBox(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.red, Colors.blue],
    ),
  ),
);
```

Your turn: Apply a gradient background to the `BoxDecoration`. Play with a few 
combinations to get a feel for how gradients work!
