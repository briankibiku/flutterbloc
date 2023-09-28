part of 'counter_cubit.dart';

class CounterState extends Equatable {
  int counterValue;
  bool wasIncreamented;

  CounterState({required this.counterValue, required this.wasIncreamented});

  @override
  List<Object?> get props => [counterValue, wasIncreamented];
}
