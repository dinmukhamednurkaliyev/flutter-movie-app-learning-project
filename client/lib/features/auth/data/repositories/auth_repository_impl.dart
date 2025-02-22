import 'package:dartz/dartz.dart';

import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthRemoteSource authRemoteSource;
  AuthRepositoryImpl({
    required this.authRemoteSource,
  });

  @override
  Future<Either> signUpWithEmailAndPassword(SignUpRequestParamsModel params) async {
    return await authRemoteSource.signUpWithEmailAndPassword(params);
  } 

}
