import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sarafi/features/dashboard/dashboard.dart';
import 'package:sarafi/features/login/login.dart';
import '../features/accounts/accounts.dart';
import '../features/friends/Friends.dart';
import '../features/home/widgets/main_scaffold.dart';
import '../features/profile/profile.dart';
import '../features/transactions/transactions.dart';

GlobalKey<NavigatorState> mainRouterKey = GlobalKey<NavigatorState>(debugLabel: "LKJLdd");
final navigatorMain = Navigator(
  onGenerateRoute: (settings) {
    var route = settings.name;
    Widget page = mainRoutes[route] == null ? mainRoutes[HomeRoute]! : mainRoutes[route]!;
    return MaterialPageRoute(
        builder: (context) {
          return page;
        },
        settings: settings
    );
  },
  key: mainRouterKey,
  initialRoute: HomeRoute,
);


const HomeRoute = "/";
const LoginRoute = "/Login";

Map<String, Widget> mainRoutes = {
  HomeRoute: MainScaffold(),
  LoginRoute: Login()
};
