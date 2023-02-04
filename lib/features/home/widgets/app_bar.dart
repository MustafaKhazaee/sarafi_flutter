import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar getAppBar(BuildContext context) => AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Theme.of(context).primaryColor,
    systemNavigationBarColor: Theme.of(context).primaryColor,
  ),
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {

        },
        icon: Icon(Icons.more_horiz_outlined)
      ),
      Text("Sarafi App"),
      IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.notifications_outlined)
      )
    ],
  )
);
