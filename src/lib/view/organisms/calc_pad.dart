import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sample/redux/app_state.dart';
import 'package:sample/redux/calc/action.dart';
import 'package:sample/redux/calc/state.dart';
import 'package:sample/view/atoms/number_button.dart';
import 'package:sample/view/atoms/operator_button.dart';

class CalcPad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, CalcPadViewModel>(
        converter: (store) => CalcPadViewModel(store),
        builder: (_, vm) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 7,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 8,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 9,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: OperatorButton(
                        op: CalcOp.plus,
                        onPressed: vm.onOpPressed,
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 4,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 5,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 6,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: OperatorButton(
                        op: CalcOp.minus,
                        onPressed: vm.onOpPressed,
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 1,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 2,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: NumberButton(
                        number: 3,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: OperatorButton(
                        op: CalcOp.multiply,
                        onPressed: vm.onOpPressed,
                      )),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: NumberButton(
                        number: 0,
                        onPressed: vm.onNumberPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: OperatorButton(
                        op: CalcOp.clear,
                        onPressed: vm.onOpPressed,
                      )),
                  Expanded(
                      flex: 1,
                      child: OperatorButton(
                        op: CalcOp.divide,
                        onPressed: vm.onOpPressed,
                      )),
                ],
              ),
              OperatorButton(
                op: CalcOp.equal,
                onPressed: vm.onOpPressed,
              )
            ],
          );
        });
  }
}

class CalcPadViewModel extends Equatable {
  final Store<AppState> store;

  CalcPadViewModel(this.store);

  @override
  List<Object> get props => [];

  void onNumberPressed(int number) {
    store.dispatch(AppendNumber(number));
  }

  void onOpPressed(CalcOp op) {
    switch (op) {
      case CalcOp.plus:
        store.dispatch(AppendOperator(CalcOperator.add));
        break;
      case CalcOp.minus:
        store.dispatch(AppendOperator(CalcOperator.subtract));
        break;
      case CalcOp.multiply:
        store.dispatch(AppendOperator(CalcOperator.multiply));
        break;
      case CalcOp.divide:
        store.dispatch(AppendOperator(CalcOperator.divide));
        break;
      case CalcOp.clear:
        store.dispatch(Clear());
        break;
      case CalcOp.equal:
        store.dispatch(Calculate());
        break;
    }
  }
}
