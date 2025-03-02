import 'package:movie_app/features/television/domain/entities/television_entity.dart';

abstract class PopularTelevisionMoviesState {}

class PopularTelevisionMoviesLoading extends PopularTelevisionMoviesState {}

class PopularTelevisionMoviesLoaded extends PopularTelevisionMoviesState {
  final List<TelevisionEntity> televisionMovies;

  PopularTelevisionMoviesLoaded({required this.televisionMovies});
}

class FailureLoadingPopularTelevisionMovies extends PopularTelevisionMoviesState {
  final String message;

  FailureLoadingPopularTelevisionMovies({required this.message});
}