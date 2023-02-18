
import 'package:flutter/material.dart';

ButtonStyle getWhiteButtonStyle (BuildContext context) => ButtonStyle(
  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white),
  textStyle: MaterialStateProperty.resolveWith((states) =>
    TextStyle(
      backgroundColor: Colors.white,
      color: Colors.black,
      fontSize: 20,
    )
  ),
  padding: MaterialStateProperty.resolveWith(
    (states) => EdgeInsets.fromLTRB(20, 10, 20, 10)
  ),

);