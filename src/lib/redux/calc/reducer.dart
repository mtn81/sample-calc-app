import 'package:optional/optional.dart';
import 'package:redux/redux.dart';
import 'package:sample/redux/calc/state.dart';
import 'action.dart';

final calcReducer = combineReducers<CalcState>([
  TypedReducer<CalcState, AppendNumber>((s, a) => s.appendNumber(a.number)),
  TypedReducer<CalcState, AppendOperator>((s, a) => s.appendOperator(a.op)),
  TypedReducer<CalcState, Clear>((s, a) => CalcState.initial()),
  TypedReducer<CalcState, Calculate>((s, a) => s.fixed()),
]);
