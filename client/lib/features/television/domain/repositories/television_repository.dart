import 'package:dartz/dartz.dart';

abstract class TelevisionRepository {
  Future<Either> getPopularTelevisionMovies();
  Future<Either> getRecommendationTelevisionMovies(int televisionMovieId);
  Future<Either> getSimilarTelevisionMovies(int televisionMovieId);
  Future<Either> getKeywordMovies(int televisionMovieId);
}
