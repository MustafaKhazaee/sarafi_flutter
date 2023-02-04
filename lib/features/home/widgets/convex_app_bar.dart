import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

ConvexAppBar getConvexAppBar (BuildContext context) => ConvexAppBar(
  items: const [
    TabItem(icon: Icons.account_balance_wallet_outlined, title: 'Accounts'),
    TabItem(icon: Icons.transform_outlined, title: 'Transactions'),
    TabItem(icon: Icons.dashboard_outlined, title: 'Dashboard'),
    TabItem(icon: Icons.people_alt_outlined, title: 'Friends'),
    TabItem(icon: Icons.account_circle_outlined, title: 'Profile'),
  ],
  onTap: (index) {
    // Navigator.pushNamed(context,"/left");
    // Do routing here
    // navigator.
  },
  backgroundColor: Theme.of(context).bottomAppBarColor,
  activeColor: Theme.of(context).backgroundColor,
  color: Colors.white,
  height: 55,
  initialActiveIndex: 2,
);