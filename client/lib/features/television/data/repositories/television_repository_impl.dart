import 'package:dartz/dartz.dart';
import 'package:movie_app/core/data/models/mapper/movie_keyword_model_mapper.dart';
import 'package:movie_app/core/data/models/movie_keyword_model.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/television/data/models/mapper/television_model_mapper.dart';
import 'package:movie_app/features/television/data/models/television_model.dart';
import 'package:movie_app/features/television/data/sources/television_remote_source.dart';
import 'package:movie_app/features/television/domain/repositories/television_repository.dart';

class TelevisionRepositoryImpl implements TelevisionRepository {
  @override
  Future<Either> getPopularTelevisionMovies() async {
    var response =
        await serviceLocator<TelevisionRemoteSource>()
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
    var response = await serviceLocator<TelevisionRemoteSource>()
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
    var response = await serviceLocator<TelevisionRemoteSource>()
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
    var response = await serviceLocator<TelevisionRemoteSource>()
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
}
