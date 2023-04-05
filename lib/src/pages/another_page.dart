import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ss_flutter_state/src/bloc/counter_a_bloc/counter_a_bloc.dart';
import 'package:ss_flutter_state/src/bloc/counter_a_bloc/counter_a_bloc.dart';

import '../bloc/counter_b_bloc/counter_b_bloc.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key, required this.title});

  final String title;

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<CounterABloc, CounterAState>(
        builder: (context, counterAState) {
          return BlocBuilder<CounterBBloc, CounterBState>(
            builder: (context, counterBState) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Counter:A',
                        ),
                        Text(
                          '${counterAState.count}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Counter:B',
                        ),
                        Text(
                          '${counterBState.count}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterABloc>().add(CounterAEventReset()),
                tooltip: 'Reset',
                child: const Icon(Icons.restore),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterABloc>().add(CounterAEventAdd()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterBBloc>().add(CounterBEventReset()),
                tooltip: 'Reset',
                child: const Icon(Icons.restore),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterBBloc>().add(CounterBEventAdd()),
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
