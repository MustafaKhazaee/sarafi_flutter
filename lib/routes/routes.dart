import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:sarafi/features/dashboard/dashboard.dart';
import 'package:sarafi/features/login/login.dart';
import '../features/accounts/accounts.dart';
import '../features/friends/Friends.dart';
import '../features/home/widgets/main_scaffold.dart';
import '../features/profile/profile.dart';
import '../features/transactions/transactions.dart';

GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>(debugLabel: "LKJL");
final navigator = Navigator(
  onGenerateRoute: (settings) {
    var route = settings.name;
    Widget page = homeRoutes[route] == null ? homeRoutes[DashboardRoute]! : homeRoutes[route]!;
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings
    );
  },
  key: routerKey,
  initialRoute: DashboardRoute,
);

const DashboardRoute = '/Dashboard';
const AccountsRoute = '/Accounts';
const ProfileRoute = '/Profile';
const TransactionsRoute = '/Transactions';
const FriendsRoute = '/Friends';

Map<String, Widget> homeRoutes = {
  DashboardRoute: Dashboard(),
  AccountsRoute: Accounts(),
  ProfileRoute: Profile(),
  TransactionsRoute: Transactions(),
  FriendsRoute: Friends()
};
