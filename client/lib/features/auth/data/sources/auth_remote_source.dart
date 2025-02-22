import 'package:dartz/dartz.dart';

abstract class AuthRemoteSource {
  Future<Either> signUpWithEmailAndPassword();
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<Either> signUpWithEmailAndPassword() {
    throw UnimplementedError();
  }
}