import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/configs/api_configs.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/network/api_client.dart';

abstract class MovieRemoteSource {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationsMovies(int movieId);
}

class MovieRemoteSourceImpl implements MovieRemoteSource {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        ApiConfig.trendingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        ApiConfig.nowPlayingMovies,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        '${ApiConfig.movie}$movieId/trailer',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationsMovies(int movieId) async {
    try {
      var response = await serviceLocator<ApiClient>().get(
        '${ApiConfig.movie}$movieId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
