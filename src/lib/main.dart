import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sample/redux/app_state.dart';
import 'package:sample/view/pages/calc_page.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  final store = Store<AppState>(appReduder, initialState: AppState.initial());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          title: "サンプルアプリ",
          routes: {
            '/': (context) => CalcPage(),
            CalcPage.route: (context) => CalcPage(),
          },
        ));
  }
}
