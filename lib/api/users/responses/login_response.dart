class LoginResponse {
  String? response;
  String? refreshToken;
  String? accessToken;

  LoginResponse.fromJson (Map<String, dynamic> map) {
    response = map['response'];
    refreshToken = map['refreshToken'];
    accessToken = map['accessToken'];
  }

  String toString () => "Response: $response\nAccess Token: $accessToken\nRefresh Token: $refreshToken";
}