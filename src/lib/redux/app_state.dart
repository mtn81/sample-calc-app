import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';
import 'package:sample/redux/calc/reducer.dart';

import 'calc/state.dart';

@immutable
class AppState extends Equatable {
  final CalcState calcState;

  AppState({@required this.calcState});

  factory AppState.initial() {
    CalcState calcState = CalcState.initial();
    return AppState(calcState: calcState);
  }

  AppState copyWith({CalcState calcState}) {
    return AppState(calcState: calcState);
  }

  @override
  List<Object> get props => [calcState];
}

final Reducer<AppState> appReduder = (state, action) =>
    state.copyWith(calcState: calcReducer(state.calcState, action));
