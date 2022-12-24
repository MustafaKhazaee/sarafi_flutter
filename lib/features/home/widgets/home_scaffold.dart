import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'convex_app_bar.dart';

const mainNavigator = Navigator ( );

Scaffold getHomeScaffold(BuildContext context) => Scaffold(
  appBar: getAppBar(context),
  bottomNavigationBar: getConvexAppBar(context, mainNavigator),
  body: mainNavigator,
);
