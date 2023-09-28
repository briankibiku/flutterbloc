// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:learnbloc/business_logic/cubit/counter_cubit.dart';

// void main() {
//   group('CounterCubit', () {
//     CounterCubit counterCubit;
//     setUp(() {
//       counterCubit = CounterCubit();
//     });

//     tearDown(() {
//       counterCubit = CounterCubit();
//       counterCubit.close();
//     });

//     test('test initial state for CounterCubit is CounterState(counterValue: 0)',
//         () {
//       counterCubit = CounterCubit();
//       expect(counterCubit.state,
//           CounterState(counterValue: 0, wasIncreamented: false));
//     });

//     blocTest('test increament function',
//         build: () => CounterCubit(),
//         act: (cubit) => cubit.increament(),
//         expect: () => [CounterState(counterValue: 1, wasIncreamented: true)]);
//     blocTest('test decreament function',
//         build: () => CounterCubit(),
//         act: (cubit) => cubit.decreament(),
//         expect: () => [CounterState(counterValue: -1, wasIncreamented: false)]);
//   });
// }
