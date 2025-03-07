import 'package:dartz/dartz.dart';

abstract class TelevisionMovieRepository {
  Future<Either> getPopularTelevisionMovies();
  Future<Either> getRecommendationTelevisionMovies(int televisionMovieId);
  Future<Either> getSimilarTelevisionMovies(int televisionMovieId);
  Future<Either> getKeywordMovies(int televisionMovieId);
  Future<Either> searchTelevisionMovie(String query);
}
