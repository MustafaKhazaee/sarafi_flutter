import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarafi/routes/main_routes.dart';
import 'package:sarafi/services/authentication_service.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LKJLJLKJLKJLkj"),
      ),
      floatingActionButton: IconButton(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
        icon: Icon(Icons.add),
        onPressed: () {
          mainRouterKey.currentState?.popAndPushNamed(LoginRoute);
          // final auth = AuthenticationService();
          // auth.refreshToken();
        },
      ),
    );
  }
}
