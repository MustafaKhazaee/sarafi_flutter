
import 'package:flutter/material.dart';
import 'package:sarafi/register_dependency.dart';
import 'features/home/widgets/material_app.dart';

void main () {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => getMaterialApp();
}
