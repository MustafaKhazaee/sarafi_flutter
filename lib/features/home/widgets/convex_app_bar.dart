import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../../routes/routes.dart';

final _routes = [AccountsRoute, TransactionsRoute, DashboardRoute, FriendsRoute, ProfileRoute];

ConvexAppBar getConvexAppBar (BuildContext context) => ConvexAppBar(
  items: const [
    TabItem(icon: Icons.account_balance_wallet_outlined, title: 'Accounts'),
    TabItem(icon: Icons.transform_outlined, title: 'Transaction'),
    TabItem(icon: Icons.dashboard_outlined, title: 'Dashboard'),
    TabItem(icon: Icons.people_alt_outlined, title: 'Friends'),
    TabItem(icon: Icons.account_circle_outlined, title: 'Profile'),
  ],
  onTap: (index) {
    final route = _routes[index]!;
    routerKey.currentState?.pushNamed(route);
  },
  backgroundColor: Theme.of(context).bottomAppBarColor,
  activeColor: Theme.of(context).primaryColorLight,
  color: Colors.white,
  height: 60,
  initialActiveIndex: 2,
);
