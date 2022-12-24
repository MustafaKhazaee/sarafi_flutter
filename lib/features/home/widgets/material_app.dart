import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';
import '../themes/normal_theme.dart';
import 'main_page.dart';

MaterialApp getMaterialApp() => MaterialApp(
      // Global Application Properties
      themeMode: ThemeMode.system,
      theme: normalTheme,
      darkTheme: darkTheme,
      // home: const MainPage(),
      debugShowCheckedModeBanner: false,
      routes: {
            "/": (context) => MainPage(),
            "/right": (context) => const Center(child: Text("Right")),
            "/left": (context) => const Center(child: Text("Left")),
      },
    );

