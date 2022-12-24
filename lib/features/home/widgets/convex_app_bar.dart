import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

ConvexAppBar getConvexAppBar (BuildContext context, Navigator navigator) => ConvexAppBar(
  items: const [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.map, title: 'Discovery'),
    TabItem(icon: Icons.add, title: 'Add'),
    TabItem(icon: Icons.message, title: 'Message'),
    TabItem(icon: Icons.people, title: 'Profile'),
  ],
  onTap: (index) {
    Navigator.pushNamed(context,"/left");
    // Do routing here
    // navigator.
  },
  backgroundColor: Theme.of(context).bottomAppBarColor,
  activeColor: Theme.of(context).backgroundColor,
  height: 55,
  initialActiveIndex: 2,
);