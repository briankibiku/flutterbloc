import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/business_logic/cubit/internet_cubit.dart';

import '../../business_logic/cubit/counter_cubit.dart';
import '../../constants/enums.dart';

class HomeScreen extends StatefulWidget {
  final String? title;
  final Color? color;
  const HomeScreen({super.key, this.title, this.color});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<CounterCubit>(context).increament();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<CounterCubit>(context).decreament();
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  const Text('Connected to wifi ');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  const Text('Connected to mobile data ');
                } else if (state is InternetDisconnected) {
                  return const Text('Disconnected ');
                } else if (state is InternetLoading) {
                  return const CircularProgressIndicator();
                }
                return Text(state.toString());
              }),
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
              const Text('First Page'),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     FloatingActionButton(
              //       onPressed: () {
              //         // BlocProvider.of<CounterCubit>(context).decreament();
              //         counterCubit.decreament();
              //       },
              //       tooltip: 'Decreament',
              //       child: const Icon(Icons.remove),
              //     ),
              //     const SizedBox(
              //       width: 20,
              //     ),
              //     FloatingActionButton(
              //       onPressed: () {
              //         // BlocProvider.of<CounterCubit>(context).increament();
              //         counterCubit.increament();
              //       },
              //       tooltip: 'Increament',
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
                child: const Text('Go to Second page'),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                color: widget.color,
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                child: const Text('Go to third page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
