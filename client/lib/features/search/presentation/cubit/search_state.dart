import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/television/domain/entities/television_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchMoviesLoaded extends SearchState {
  final List<MovieEntity> movies;

  SearchMoviesLoaded({required this.movies});
}

class SearchTelevisionMoviesLoaded extends SearchState {
  final List<TelevisionEntity> televisionMovies;

  SearchTelevisionMoviesLoaded({required this.televisionMovies});
}

class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}
