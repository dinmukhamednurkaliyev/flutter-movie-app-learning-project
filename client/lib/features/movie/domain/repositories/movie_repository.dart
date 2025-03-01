import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either> getTrangingMovies();
  Future<Either> getNowPlayingMovies();
}