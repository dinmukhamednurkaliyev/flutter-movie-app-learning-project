import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class MoviesTrailerState {}

class MoviesTrailerLoading extends MoviesTrailerState {}

class MoviesTrailerLoaded extends MoviesTrailerState {
  final YoutubePlayerController youtubePlayerController;
  MoviesTrailerLoaded({required this.youtubePlayerController});
}

class FailureLoadMoviesTrailer extends MoviesTrailerState {
  final String message;
  FailureLoadMoviesTrailer({required this.message});
}
