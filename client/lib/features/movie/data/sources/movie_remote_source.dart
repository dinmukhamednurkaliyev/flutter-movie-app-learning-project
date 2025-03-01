import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/configs/api_configs.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/network/api_client.dart';

abstract class MovieRemoteSource {
  Future<Either> getTrangingMovies();
}

class MovieRemoteSourceImpl implements MovieRemoteSource {
  @override
  Future<Either> getTrangingMovies() async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        ApiConfig.trendingMovies,
      ); 
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
