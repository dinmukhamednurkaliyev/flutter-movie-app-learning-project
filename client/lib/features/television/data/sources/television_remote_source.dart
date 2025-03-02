import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/configs/api_configs.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/network/api_client.dart';

abstract class TelevisionRemoteSource {
  Future<Either> getPopularTelevision();
}

class TelevisionRemoteSourceImpl implements TelevisionRemoteSource {
  @override
  Future<Either> getPopularTelevision() async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        ApiConfig.popularTV,
      );  
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}