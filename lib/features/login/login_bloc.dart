
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import '../../services/authentication_service.dart';

void submitLogin (GlobalKey<FormBuilderState> formKey33, context) async {
  final isValid = formKey33.currentState?.saveAndValidate();
  if (isValid!) {
    final authService = Provider.of<AuthenticationService>(context, listen: false);
    authService.Authenticate(formKey33, context);
  }
}