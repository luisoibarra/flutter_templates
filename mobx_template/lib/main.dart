import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'injection.dart';
import 'pages/home/home_page.dart';

void main() {
  // Get_it / Injector call
  configureDependencies();
  runApp(const MyApp());
}

final _router = GoRouter(routes: $appRoutes);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
