import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

abstract class NowPlayingMoviesState {}

class NowPlayingMoviesLoading extends NowPlayingMoviesState {}

class NowPlayingMoviesLoaded extends NowPlayingMoviesState {
  final List<MovieEntity> movies;

  NowPlayingMoviesLoaded({required this.movies});
}

class FailureLoadingNowPlayingMovies extends NowPlayingMoviesState {
  final String message;

  FailureLoadingNowPlayingMovies({required this.message});
}