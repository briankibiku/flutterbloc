import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  final String? title;
  final Color? color;
  const ThirdScreen({super.key, this.title, this.color});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncreamented == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Value was increamented'),
                    duration: Duration(milliseconds: 50),
                  ),
                );
              }
              if (state.wasIncreamented == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Value was NOT increamented'),
                    duration: Duration(milliseconds: 50),
                  ),
                );
              }
            },
            builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: const TextStyle(fontSize: 80),
              );
            },
          ),
          const Text('Third Page'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterCubit>(context).decreament();
                  counterCubit.decreament();
                },
                tooltip: 'Decreament',
                child: const Icon(Icons.remove),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {
                  // BlocProvider.of<CounterCubit>(context).increament();
                  // context.bloc<CounterCubit>().decreament();
                  counterCubit.increament();
                },
                tooltip: 'Increament',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            color: widget.color,
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: const Text('Go to home page'),
          )
        ],
      ),
    );
  }
}
