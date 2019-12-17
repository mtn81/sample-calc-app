import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef OnPressFn = void Function(CalcOp);

class OperatorButton extends StatelessWidget {
  static final Map<CalcOp, String> _calcOpLabels = const {
    CalcOp.plus: "+",
    CalcOp.minus: "-",
    CalcOp.multiply: "*",
    CalcOp.divide: "/",
    CalcOp.clear: "C",
    CalcOp.equal: "=",
  };

  final CalcOp op;
  final double height;
  final EdgeInsetsGeometry padding;
  final OnPressFn onPressed;

  OperatorButton({
    @required this.op,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(5),
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: MaterialButton(
          child: Text(
            _calcOpLabels[op],
            style: Theme.of(context).textTheme.display3,
          ),
          height: this.height,
          color: Colors.green,
          onPressed: () {
            onPressed(op);
          },
        ));
  }
}

enum CalcOp {
  plus,
  minus,
  multiply,
  divide,
  clear,
  equal,
}
