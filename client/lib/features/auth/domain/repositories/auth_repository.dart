import 'package:dartz/dartz.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/data/models/sign_in_request_params_model.dart';

abstract class AuthRepository {

  Future<Either> signUpWithEmailAndPassword(SignUpRequestParamsModel params);

  Future<Either> signInWithEmailAndPassword(SignInRequestParamsModel params);
}
