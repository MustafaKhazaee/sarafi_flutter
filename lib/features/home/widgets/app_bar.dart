import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar getAppBar(BuildContext context) => AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        systemNavigationBarColor: Theme.of(context).primaryColor,
      ),
    );
