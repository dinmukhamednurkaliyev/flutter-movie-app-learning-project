import 'package:dartz/dartz.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase implements Usecase<Either, SignUpRequestParamsModel> {
  final AuthRepository repository;

  SignUpUsecase({required this.repository});
  @override
  Future<Either> call(SignUpRequestParamsModel? params) async {
    return repository.signUpWithEmailAndPassword(params!);
  }

}