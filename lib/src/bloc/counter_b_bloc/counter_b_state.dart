part of 'counter_b_bloc.dart';

class CounterBState extends Equatable {

  final int count;
  const CounterBState({required this.count});

  CounterBState copyWith({int? count}){
    return CounterBState(count: count ?? this.count);
  }
  @override
  String toString() {
    // TODO: implement toString
    return "count: $count";
  }
  @override
  List<Object> get props => [count];

}


