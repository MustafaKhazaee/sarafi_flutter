import 'package:flutter/material.dart';
import 'package:sarafi/features/home/widgets/main_material_app.dart';
import '../../login/login.dart';
import '../themes/dark_theme.dart';
import '../themes/normal_theme.dart';
class HomeMaterialApp extends StatefulWidget {
  const HomeMaterialApp({Key? key}) : super(key: key);
  @override
  State<HomeMaterialApp> createState() => _HomeMaterialAppState();
}

class _HomeMaterialAppState extends State<HomeMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Global Application Properties
      themeMode: ThemeMode.system,
      theme: normalTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => getMainMaterialApp(context),
        "/Login": (context) => getLogin(context)
      }
    );
  }
}

