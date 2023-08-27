import 'package:flutter/material.dart';

import 'app.dart';
import 'features/authentication/setup.dart';
import 'features/home/setup.dart';
import 'features/startup/setup.dart';
import 'shared/di/dependency_injection.dart';
import 'shared/setup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize features
  setupShared();
  setupStartup();
  setupAuthentication();
  setupHome();
  // Wait for all initializations
  await locator.allReady();

  runApp(const MyApp());
}
