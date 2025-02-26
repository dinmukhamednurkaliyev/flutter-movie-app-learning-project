import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/configs/api_configs.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/network/api_client.dart';
import 'package:movie_app/features/auth/data/models/sign_in_request_params_model.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';

abstract class AuthRemoteSource {
  Future<Either> signUpWithEmailAndPassword(SignUpRequestParamsModel params);
  Future<Either> signInWithEmailAndPassword(SignInRequestParamsModel params);
}

class AuthRemoteSourceImpl implements AuthRemoteSource {
  @override
  Future<Either> signUpWithEmailAndPassword(SignUpRequestParamsModel params) async {
    try {
      var response = await serviceLocator<ApiClient>().post(
        ApiConfig.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> signInWithEmailAndPassword(SignInRequestParamsModel params) async {
    try {
      var response = await serviceLocator<ApiClient>().post(
        ApiConfig.signin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  
}