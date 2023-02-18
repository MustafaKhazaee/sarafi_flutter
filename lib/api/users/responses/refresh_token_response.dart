class RefreshTokenResponse {
  bool? IsRefreshed;
  String? AccessToken;

  RefreshTokenResponse.fromJson (Map<String, dynamic> map) {
    IsRefreshed = map['isRefreshed'];
    AccessToken = '${map["accessToken"]}';
  }

}
