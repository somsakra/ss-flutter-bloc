import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_a_event.dart';

part 'counter_a_state.dart';

class CounterABloc extends Bloc<CounterAEvent, CounterAState> {
  CounterABloc() : super(const CounterAState(count: 0)) {
    // Add Event
    on<CounterAEventAdd>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    // Reset Event
    on<CounterAEventReset>((event, emit) {
      emit(state.copyWith(count: 0));
    });
  }
}
