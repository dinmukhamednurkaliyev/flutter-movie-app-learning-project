import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/features/auth/data/models/sign_in_request_params_model.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<Either, SignInRequestParamsModel> {
  
  @override
  Future<Either> call({SignInRequestParamsModel? params}) async {
    return await serviceLocator<AuthRepository>().signInWithEmailAndPassword(params!);
  }

}