import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../injection.dart';
import 'counter_page_param.dart';
import 'counter_page_store.dart';

class CounterRoute extends GoRouteData {
  final int initialCounter;
  CounterRoute({required this.initialCounter});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CounterPage(param: CounterPageParam(initialCounter: initialCounter));
  }
}

class CounterPage extends StatelessWidget {
  final CounterPageParam param;
  final state = locator<CounterPageStore>();
  CounterPage({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    state.init(param);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            // Wrapping in the Observer will automatically re-render on changes to counter.value
            Observer(
              builder: (_) => Text(
                '${state.value}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: state.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
