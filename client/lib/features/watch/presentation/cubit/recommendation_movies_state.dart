import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;

  RecommendationMoviesLoaded({required this.movies});
}

class FailureLoadingRecommendationMovies extends RecommendationMoviesState {
  final String message;

  FailureLoadingRecommendationMovies({required this.message});
}
