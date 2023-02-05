import 'package:flutter/material.dart';

import '../home/themes/dark_theme.dart';
import '../home/themes/normal_theme.dart';

StatefulWidget getLogin (BuildContext context) => MaterialApp(
  // Global Application Properties
  themeMode: ThemeMode.system,
  theme: normalTheme,
  darkTheme: darkTheme,
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    backgroundColor: Theme.of(context).primaryColor,
    body: Center(
      child: Text("Login Page",
      style: TextStyle(
        color: Colors.white,
        fontSize: 40
      )),
    ),
  )
);
