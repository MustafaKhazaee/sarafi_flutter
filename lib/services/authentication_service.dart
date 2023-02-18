import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:sarafi/api/users/requests/refresh_token_request.dart';
import 'package:sarafi/api/users/responses/refresh_token_response.dart';
import 'package:sarafi/services/storage_service.dart';
import '../api/api.dart';
import '../api/users/login_response.dart';
import '../api/users/requests/login_request.dart';
import '../api/users/responses/login_response.dart';
import '../routes/main_routes.dart';

class AuthenticationService with ChangeNotifier {

  bool _isAuthenticated = false;
  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated (bool value) {
    _isAuthenticated = value;
    notifyListeners();
  }

  void Authenticate (GlobalKey<FormBuilderState> formKey1, context) async {
    final isValid = formKey1.currentState?.saveAndValidate();
    if (isValid!) {
      final LoginRequest request = LoginRequest.fromMap(formKey1.currentState?.value);
      LoginResponse loginResponse = await usersApi.loginUser(request);
      if (loginResponse.response == LoginResponseMessages.success) {
        isAuthenticated = true;
        await SecureStorage.putString("access_token", loginResponse.accessToken.toString());
        await SecureStorage.putString("refresh_token", loginResponse.refreshToken.toString());
        mainRouterKey.currentState?.popAndPushNamed(HomeRoute);
      } else {
        isAuthenticated = false;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loginResponse.response.toString()),
          backgroundColor: Colors.deepPurple.shade700,
        )
      );
    }
  }

  Future<RefreshTokenResponse> refreshToken () async {
    final String refreshToken = await SecureStorage.getString("refresh_token");
    Map<String, dynamic> payload = Jwt.parseJwt(refreshToken);
    final id = payload['Id'];
    final request = RefreshTokenRequest(id, refreshToken);
    final response = await usersApi.refreshToken(request);
    if (response.IsRefreshed!) {
      log("Token has been refreshed");
      await SecureStorage.putString("access_token", response.AccessToken.toString());
    }
    return response;
  }
}
