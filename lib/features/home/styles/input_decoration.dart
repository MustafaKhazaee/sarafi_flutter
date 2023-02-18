
import 'package:flutter/material.dart';

InputDecoration getInputDecoration (BuildContext context, String labelText) => InputDecoration(
  label: Text(labelText),
  contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 8),
  // hintText: labelText,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8)
    ),
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
        Radius.circular(8)
    ),
    borderSide: BorderSide(
      color: Colors.white
    )
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(8)
      ),
      borderSide: BorderSide(
          color: Colors.white
      )
  ),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
          Radius.circular(8)
      ),
      borderSide: BorderSide(
          color: Colors.white
      )
  ),
  labelStyle: TextStyle(
    color: Colors.white70
  ),
);