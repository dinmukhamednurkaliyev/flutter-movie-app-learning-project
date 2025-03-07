import 'package:dartz/dartz.dart';
import 'package:movie_app/core/data/models/mapper/movie_trailer_model_mapper.dart';
import 'package:movie_app/core/data/models/movie_trailer_model.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/movie/data/models/mapper/movie_model_mapper.dart';
import 'package:movie_app/features/movie/data/models/movie_model.dart';
import 'package:movie_app/features/movie/data/sources/movie_remote_source.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var response =
        await serviceLocator<MovieRemoteSource>().getTrendingMovies();
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) =>
                      MovieModelMapper.toEntity(MovieModel.fromJson(item)),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var response =
        await serviceLocator<MovieRemoteSource>().getNowPlayingMovies();
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) =>
                      MovieModelMapper.toEntity(MovieModel.fromJson(item)),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    var response = await serviceLocator<MovieRemoteSource>().getMovieTrailer(
      movieId,
    );
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = MovieTrailerModelMapper.toEntity(
          MovieTrailerModel.fromJson(data['trailer']),
        );
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    var response = await serviceLocator<MovieRemoteSource>()
        .getRecommendationMovies(movieId);
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) =>
                      MovieModelMapper.toEntity(MovieModel.fromJson(item)),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    var response = await serviceLocator<MovieRemoteSource>().getSimilarMovies(
      movieId,
    );
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) =>
                      MovieModelMapper.toEntity(MovieModel.fromJson(item)),
                )
                .toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchMovie(String query) async {
    var response = await serviceLocator<MovieRemoteSource>().searchMovie(query);
    return response.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data["content"])
                .map(
                  (item) =>
                      MovieModelMapper.toEntity(MovieModel.fromJson(item)),
                )
                .toList();
        return Right(movies);
      },
    );
  }
}
