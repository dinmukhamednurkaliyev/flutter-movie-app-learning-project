import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/television/domain/entities/television_entity.dart';

abstract class SearchMovieState {}

class SearchInitial extends SearchMovieState {}

class SearchLoading extends SearchMovieState {}

class SearchMoviesLoaded extends SearchMovieState {
  final List<MovieEntity> movies;

  SearchMoviesLoaded({required this.movies});
}

class SearchTelevisionMoviesLoaded extends SearchMovieState {
  final List<TelevisionEntity> televisionMovies;

  SearchTelevisionMoviesLoaded({required this.televisionMovies});
}

class SearchFailure extends SearchMovieState {
  final String message;

  SearchFailure({required this.message});
}
