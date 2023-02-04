import 'dart:developer';

import 'package:flutter/material.dart';

Container getLoginContainer (BuildContext context) => Container(
  child: ButtonBar(
    children: [
      IconButton(onPressed: () {
          log("Button Pressed");
        },
        icon: const Icon(Icons.add)
      )
    ],
  ),
);