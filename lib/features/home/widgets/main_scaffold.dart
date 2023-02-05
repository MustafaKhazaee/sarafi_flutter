import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarafi/features/home/home_router.dart';
import 'app_bar.dart';
import 'convex_app_bar.dart';

StatefulWidget getMainScaffold (BuildContext context) => Scaffold(
  appBar: getAppBar(context),
  body: context.watch<HomeRouter>().currentRoute,
  bottomSheet: getConvexAppBar(context),
  backgroundColor: Theme.of(context).backgroundColor,
);

