import 'package:dartz/dartz.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signUpWithEmailAndPassword(SignUpRequestParamsModel params) {
    throw UnimplementedError();
  } 

}