import 'package:flutter/material.dart';
import '../../../routes/routes.dart';
import '../themes/dark_theme.dart';
import '../themes/normal_theme.dart';
import 'app_bar.dart';
import 'convex_app_bar.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({Key? key}) : super(key: key);
  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Global Application Properties
      themeMode: ThemeMode.system,
      theme: normalTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: getAppBar(context),
        bottomSheet: getConvexAppBar(context),
        backgroundColor: Theme.of(context).backgroundColor,
        body: navigator,
      )
    );
  }
}
