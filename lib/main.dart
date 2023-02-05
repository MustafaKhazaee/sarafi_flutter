
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarafi/register_dependency.dart';
import 'application_providers.dart';
import 'features/home/widgets/home_material_app.dart';

void main () {
  setupLocator();
  runApp(
      MultiProvider(
        providers: applicationProviders(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => HomeMaterialApp();
}
