import 'package:chewie/chewie.dart';

abstract class MoviesTrailerState{}

class MoviesTrailerLoading extends MoviesTrailerState{}

class MoviesTrailerLoaded extends MoviesTrailerState{
  final ChewieController chewieController;
  MoviesTrailerLoaded({required this.chewieController}); 
}

class FailureLoadMoviesTrailer extends MoviesTrailerState{
  final String message;
  FailureLoadMoviesTrailer({required this.message});
}