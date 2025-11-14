class SignupRequest {
  final String phoneNumber;
  final String password;
  final String name;

  SignupRequest({
    required this.phoneNumber,
    required this.password,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
      'name': name,
    };
  }
}
