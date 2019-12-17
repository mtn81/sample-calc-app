import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:optional/optional.dart';

@immutable
class CalcState extends Equatable {
  final Optional<CalcOperator> op;
  final Optional<int> arg1;
  final Optional<int> arg2;
  final Optional<int> result;

  CalcState({this.op, this.arg1, this.arg2, this.result});

  factory CalcState.initial() {
    return CalcState(
      arg1: Optional.empty(),
      arg2: Optional.empty(),
      op: Optional.empty(),
      result: Optional.empty(),
    );
  }

  CalcState fixed() {
    if (arg1.isPresent && arg2.isPresent && op.isPresent)
      return _copyWith(
        arg1: Optional.empty(),
        arg2: Optional.empty(),
        op: Optional.empty(),
        result: Optional.of(_calc(arg1.value, arg2.value, op.value)),
      );
    else
      return this;
  }

  CalcState appendOperator(CalcOperator op) {
    if (result.isPresent && !arg1.isPresent && !arg2.isPresent) {
      return _copyWith(
          arg1: result, op: Optional.of(op), result: Optional.empty());
    } else if (arg1.isPresent && !arg2.isPresent) {
      return _copyWith(op: Optional.of(op));
    } else {
      throw new Exception("invalid state");
    }
  }

  CalcState appendNumber(int number) {
    if (arg1.isPresent && op.isPresent) {
      int newArg2 = arg2
          .map((arg) => int.parse((arg.toString() + number.toString())))
          .orElse(number);
      return _copyWith(arg2: Optional.of(newArg2), result: Optional.empty());
    } else if (!arg2.isPresent && !op.isPresent) {
      int newArg1 = arg1
          .map((arg) => int.parse((arg.toString() + number.toString())))
          .orElse(number);
      return _copyWith(arg1: Optional.of(newArg1), result: Optional.empty());
    } else {
      throw new Exception("invalid state");
    }
  }

  Optional<int> get current {
    if (!op.isPresent && !arg2.isPresent) {
      return arg1;
    } else if (arg1.isPresent && op.isPresent) {
      return arg2;
    } else {
      return Optional.empty();
    }
  }

  CalcState _copyWith({
    Optional<int> arg1,
    Optional<int> arg2,
    Optional<CalcOperator> op,
    Optional<int> result,
  }) {
    return CalcState(
      arg1: arg1 == null ? this.arg1 : arg1,
      arg2: arg2 == null ? this.arg2 : arg2,
      op: op == null ? this.op : op,
      result: result == null ? this.result : result,
    );
  }

  int _calc(int arg1, int arg2, CalcOperator op) {
    switch (op) {
      case CalcOperator.add:
        return arg1 + arg2;
      case CalcOperator.subtract:
        return arg1 - arg2;
      case CalcOperator.multiply:
        return arg1 * arg2;
      case CalcOperator.divide:
        return arg1 ~/ arg2; //TODO divide by 0
      default:
        throw Exception("");
    }
  }

  @override
  List<Object> get props => [arg1, arg2, op];
}

enum CalcOperator {
  add,
  subtract,
  multiply,
  divide,
}
