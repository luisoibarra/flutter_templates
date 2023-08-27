import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/startup/routes/routes.dart';
import 'shared/lang/messages.dart';
import 'shared/routes/pages.dart';
import 'shared/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App',
      // Theme Info
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: ThemeMode.light,
      // Translation Info
      translations: Messages(),
      locale: const Locale('en', 'UK'),
      fallbackLocale: const Locale('en', 'US'),
      // Routing Info
      initialRoute: StartupRoutes.startup,
      getPages: Pages.pages,
    );
  }
}
