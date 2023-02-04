import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';
import '../themes/normal_theme.dart';
import 'main_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

MaterialApp getMaterialApp() => MaterialApp(
  // Global Application Properties
  themeMode: ThemeMode.system,
  theme: normalTheme,
  darkTheme: darkTheme,
  debugShowCheckedModeBanner: false,
  navigatorKey: navigatorKey,
  onGenerateRoute: (settings) {
    return null;
  },
  routes: {
    "/": (context) => const MainPage(),
    "/right": (context) => const Center(child: Text("Right")),
    "/left": (context) => const Center(child: Text("Left")),
  },
);

