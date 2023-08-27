import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/dependency_injection/injection.dart';
import '../blocs/counter_bloc.dart';

class CounterRoute extends GoRouteData {
  final int initialCounter;
  CounterRoute({required this.initialCounter});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CounterPage(initialCounter: initialCounter);
  }
}

class CounterPage extends StatelessWidget {
  final int initialCounter;

  const CounterPage({super.key, required this.initialCounter});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<CounterBloc>(
          param1: initialCounter), //CounterBloc(counter: initialCounter),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Counter value:',
              ),
              BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
                return Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(CounterEvent.increment()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
