import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

abstract class TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoaded extends TrendingMoviesState {
  final List<MovieEntity> movies;

  TrendingMoviesLoaded({required this.movies});
}

class FailureLoadingTrendingMovies extends TrendingMoviesState {
  final String message;

  FailureLoadingTrendingMovies({required this.message});
}