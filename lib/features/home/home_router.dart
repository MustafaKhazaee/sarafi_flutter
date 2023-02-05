import 'package:flutter/material.dart';
import 'package:sarafi/features/home/widgets/convex_app_bar.dart';


class HomeRouter extends ChangeNotifier {

  // default is Dashboard :
  StatefulWidget currentRoute = routes[2]!;

  void changeRoute (StatefulWidget newRoute) {
    currentRoute = newRoute;
    notifyListeners();
  }

}