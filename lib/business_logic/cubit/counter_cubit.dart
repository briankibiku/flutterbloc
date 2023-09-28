import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncreamented: false));

  void increament() => emit(CounterState(
      counterValue: state.counterValue + 1, wasIncreamented: true));

  void decreament() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncreamented: false));
}
