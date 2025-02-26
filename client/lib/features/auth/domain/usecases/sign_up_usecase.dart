import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase implements Usecase<Either, SignUpRequestParamsModel> {
  
  @override
  Future<Either> call({SignUpRequestParamsModel? params}) async {
    return await serviceLocator<AuthRepository>().signUpWithEmailAndPassword(params!);
  }

}