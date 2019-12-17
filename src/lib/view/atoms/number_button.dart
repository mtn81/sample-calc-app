import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnPressFn = void Function(int);

class NumberButton extends StatelessWidget {
  final int number;
  final double height;
  final EdgeInsetsGeometry padding;
  final OnPressFn onPressed;

  const NumberButton({
    @required this.number,
    @required this.onPressed,
    this.height = 50,
    this.padding = const EdgeInsets.all(5),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: this.padding,
        child: MaterialButton(
          child: Text(
            number.toString(),
            style: Theme.of(context).textTheme.display3,
          ),
          height: height,
          color: Colors.blue,
          onPressed: () {
            onPressed(number);
          },
        ));
  }
}
