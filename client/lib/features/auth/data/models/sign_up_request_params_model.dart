class SignUpRequestParamsModel {
  final String email;
  final String password;

  SignUpRequestParamsModel({required this.email, required this.password});

  SignUpRequestParamsModel copyWith({String? email, String? password}) {
    return SignUpRequestParamsModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
