import 'package:sample/redux/calc/state.dart';

class AppendNumber {
  final int number;
  AppendNumber(this.number);
}

class AppendOperator {
  final CalcOperator op;
  AppendOperator(this.op);
}

class Clear {}

class Calculate {}
