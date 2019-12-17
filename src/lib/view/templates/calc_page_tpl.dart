import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalcPageTpl extends StatelessWidget{

  final Widget calcResult;
  final Widget calcPad;

  CalcPageTpl({this.calcResult, this.calcPad});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("計算機")),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: calcResult,
            ),
            SizedBox(height: 20,),
            Expanded(
              flex: 5,
              child: calcPad,
            )
          ],
        ),
      )

      ) ;
  }
}