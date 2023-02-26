import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sarafi/register_dependency.dart';
import 'package:sarafi/routes/main_routes.dart';
import 'application_providers.dart';
import 'features/home/themes/dark_theme.dart';
import 'features/home/themes/normal_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  if (!kIsWeb && !Hive.isBoxOpen('encryptedBox'))
    Hive.init((await getApplicationDocumentsDirectory()).path);
  runApp(
    MultiProvider(
      providers: applicationProviders(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Global Application Properties
      themeMode: ThemeMode.system,
      theme: normalTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: navigatorMain,
    );
  }
}
