class RefreshTokenRequest {
  String? UserId;
  String? RefreshToken;
  RefreshTokenRequest(String userId, String refreshToken) {
    UserId = userId;
    RefreshToken = refreshToken;
  }
  Map<String, dynamic> toJson () => {
    "UserId": UserId,
    "RefreshToken": RefreshToken
  };
}
