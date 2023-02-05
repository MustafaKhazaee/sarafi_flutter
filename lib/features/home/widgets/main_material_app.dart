import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';
import '../themes/normal_theme.dart';
import 'main_scaffold.dart';

StatefulWidget getMainMaterialApp (BuildContext context) => MaterialApp(
  // Global Application Properties
  themeMode: ThemeMode.system,
  theme: normalTheme,
  darkTheme: darkTheme,
  debugShowCheckedModeBanner: false,
  home: getMainScaffold(context),
);