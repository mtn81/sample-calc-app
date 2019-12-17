import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiver/iterables.dart';
import 'package:sample/view/atoms/number_button.dart';
import 'package:sample/view/organisms/calc_pad.dart';
import 'package:sample/view/organisms/calc_result.dart';
import 'package:sample/view/templates/calc_page_tpl.dart';

class CalcPage extends StatelessWidget {
  static const route = '/calc';

  @override
  Widget build(BuildContext context) {
    return CalcPageTpl(
      calcResult: CalcResult(),
      calcPad: CalcPad(),
    );
  }
}
