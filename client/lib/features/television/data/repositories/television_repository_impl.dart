import 'package:dartz/dartz.dart';
import 'package:movie_app/core/data/models/mapper/movie_keyword_model_mapper.dart';
import 'package:movie_app/core/data/models/movie_keyword_model.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/television/data/models/mapper/television_model_mapper.dart';
import 'package:movie_app/features/television/data/models/television_model.dart';
import 'package:movie_app/features/television/data/sources/television_remote_source.dart';
import 'package:movie_app/features/television/domain/repositories/television_repository.dart';

class TelevisionMovieRepositoryImpl implements TelevisionMovieRepository {
  @override
  Future<Either> getPopularTelevisionMovies() async {
    var response =
        await serviceLocator<TelevisionMovieRemoteSource>()
            .getPopularTelevisionMovies();
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) => TelevisionModelMapper.toEntity(
                    TelevisionModel.fromJson(item),
                  ),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationTelevisionMovies(
    int televisionMovieId,
  ) async {
    var response = await serviceLocator<TelevisionMovieRemoteSource>()
        .getRecommendationTelevisionMovies(televisionMovieId);
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) => TelevisionModelMapper.toEntity(
                    TelevisionModel.fromJson(item),
                  ),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarTelevisionMovies(int televisionMovieId) async {
    var response = await serviceLocator<TelevisionMovieRemoteSource>()
        .getSimilarTelevisionMovies(televisionMovieId);
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) => TelevisionModelMapper.toEntity(
                    TelevisionModel.fromJson(item),
                  ),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getKeywordMovies(int televisionMovieId) async {
    var response = await serviceLocator<TelevisionMovieRemoteSource>()
        .getKeywordMovies(televisionMovieId);
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) => MovieKeywordModelMapper.toEntity(
                    MovieKeywordModel.fromJson(item),
                  ),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchTelevisionMovie(String query) async {
    var response = await serviceLocator<TelevisionMovieRemoteSource>()
        .searchTelevisionMovie(query);
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) => TelevisionModelMapper.toEntity(
                    TelevisionModel.fromJson(item),
                  ),
                )
                .toList();
        return Right(movies);
      },
    );
  }
}
