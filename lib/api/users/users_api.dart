
import 'dart:developer';
import 'package:sarafi/api/http_client/http_base.dart';
import 'package:sarafi/api/users/requests/login_request.dart';
import 'package:sarafi/api/users/requests/refresh_token_request.dart';
import 'package:sarafi/api/users/responses/login_response.dart';
import 'package:sarafi/api/users/responses/refresh_token_response.dart';

class UsersApi extends HttpBase {
  UsersApi () : super ("User");

  Future<LoginResponse> loginUser (LoginRequest request) async {
    final response = await post("AuthenticateAsync", data: request.toJson());
    return LoginResponse.fromJson(response);
  }

  Future<RefreshTokenResponse> refreshToken (RefreshTokenRequest request) async {
    final response = await post("RefreshTokenAsync", data: request.toJson());
    return RefreshTokenResponse.fromJson(response);
  }
}