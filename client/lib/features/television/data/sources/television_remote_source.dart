import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/configs/api_configs.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/network/api_client.dart';

abstract class TelevisionRemoteSource {
  Future<Either> getPopularTelevisionMovies();
  Future<Either> getRecommendationTelevisionMovies(int televisionMovieId);
  Future<Either> getSimilarTelevisionMovies(int televisionMovieId);
}

class TelevisionRemoteSourceImpl implements TelevisionRemoteSource {
  @override
  Future<Either> getPopularTelevisionMovies() async {
    try {
      var response = await serviceLocator<ApiClient>().get(ApiConfig.popularTV);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTelevisionMovies(
    int televisionMovieId,
  ) async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        '${ApiConfig.tv}$televisionMovieId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTelevisionMovies(int televisionMovieId) async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        '${ApiConfig.tv}$televisionMovieId/similar',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
