class SignInRequestParamsModel {
  final String email;
  final String password;

  SignInRequestParamsModel({required this.email, required this.password});

  SignInRequestParamsModel copyWith({String? email, String? password}) {
    return SignInRequestParamsModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }
}
