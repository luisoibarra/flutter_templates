import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import '../../injection.dart';
import '../counter/counter_page.dart';
import 'home_page_store.dart';

part 'home_page.g.dart';

@TypedGoRoute<HomeRoute>(path: "/", routes: [
  TypedGoRoute<CounterRoute>(
    path: "counter/:initialCounter",
  )
])
class HomeRoute extends GoRouteData {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageStore state = locator<HomePageStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MobX Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: state.initialCount.toString(),
                onChanged: (value) => state.changeInitialValue(context, value),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
                onPressed: () => state.navigateToCounter(context),
                tooltip: 'Navigate',
                child: const Icon(Icons.navigate_next)),
          ],
        ),
      ),
    );
  }
}
