import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/dependency_injection/injection.dart';
import '../../../counter/presentation/pages/counter_page.dart';
import '../../../navigation/bloc/navigation_bloc.dart';
import '../../../navigation/routes.dart';
import '../blocs/home_bloc.dart';

part 'home_page.g.dart';

@TypedGoRoute<HomeRoute>(path: AppRoutes.home, routes: [
  TypedGoRoute<CounterRoute>(
    path: AppRoutes.homeCounter,
  )
])
class HomeRoute extends GoRouteData {
  HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<HomeBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return TextFormField(
                      initialValue: state.initialInput,
                      onChanged: (value) => context
                          .read<HomeBloc>()
                          .add(HomeEvent.changeNumberInput(value)),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return FloatingActionButton(
                      onPressed: () => CounterRoute(
                              initialCounter: int.tryParse(context
                                      .read<HomeBloc>()
                                      .state
                                      .initialInput) ??
                                  0)
                          .push(context),
                      tooltip: 'Navigate',
                      child: const Icon(Icons.navigate_next));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
