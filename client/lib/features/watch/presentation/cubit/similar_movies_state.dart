import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<MovieEntity> movies;

  SimilarMoviesLoaded({required this.movies});
}

class FailureLoadingSimilarMovies extends SimilarMoviesState {
  final String message;

  FailureLoadingSimilarMovies({required this.message});
}
