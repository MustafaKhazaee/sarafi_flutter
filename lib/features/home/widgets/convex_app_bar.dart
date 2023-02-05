import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../accounts/accounts.dart';
import '../../dashboard/dashboard.dart';
import '../../friends/Friends.dart';
import '../../profile/profile.dart';
import '../../transactions/transactions.dart';
import '../home_router.dart';

final routes = { 0: Accounts(), 1: Transactions(), 2: Dashboard(), 3: Friends(), 4: Profile() };

ConvexAppBar getConvexAppBar (BuildContext context) => ConvexAppBar(
  items: const [
    TabItem(icon: Icons.account_balance_wallet_outlined, title: 'Accounts'),
    TabItem(icon: Icons.transform_outlined, title: 'Transaction'),
    TabItem(icon: Icons.dashboard_outlined, title: 'Dashboard'),
    TabItem(icon: Icons.people_alt_outlined, title: 'Friends'),
    TabItem(icon: Icons.account_circle_outlined, title: 'Profile'),
  ],
  onTap: (index) => context.read<HomeRouter>().changeRoute(routes[index]!),
  backgroundColor: Theme.of(context).bottomAppBarColor,
  activeColor: Theme.of(context).primaryColorLight,
  color: Colors.white,
  height: 60,
  initialActiveIndex: 2,
);