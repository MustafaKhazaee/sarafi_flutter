
import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'convex_app_bar.dart';

Scaffold getHomeScaffold(BuildContext context) => Scaffold(
  appBar: getAppBar(context),
  bottomNavigationBar: getConvexAppBar(context),
  backgroundColor: Theme.of(context).backgroundColor,
);
