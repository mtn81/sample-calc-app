import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:optional/optional.dart';
import 'package:sample/redux/app_state.dart';
import 'package:sample/redux/calc/state.dart';

class CalcResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CalcState>(
        converter: (store) => store.state.calcState,
        builder: (context, state) {
          return ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: Card(
                color: Colors.yellow,
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: _resultText(state, context)),
              ));
        });
  }

  Text _resultText(CalcState state, BuildContext context) {
    Optional<int> result =
        state.result.isPresent ? state.result : state.current;

    return result
        .map((r) => Text(
              FlutterMoneyFormatter(amount: r.toDouble())
                  .output
                  .withoutFractionDigits,
              style: Theme.of(context).textTheme.display3,
            ))
        .orElse(Text(""));
  }
}
