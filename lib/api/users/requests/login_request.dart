class LoginRequest {
  final String userName;
  final String password;

  LoginRequest(this.userName, this.password);

  Map<String, dynamic> toJson () => {
    "userName": userName,
    "password": password
  };

  static LoginRequest fromMap(Map<String, dynamic>? map) =>
    LoginRequest(
      map!['username'].toString().trim(),
      map!['password'].toString().trim()
    );
}