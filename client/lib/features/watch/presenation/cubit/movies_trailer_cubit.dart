import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/entities/movie_trailer_entity.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies_trailer_usecase.dart';
import 'package:movie_app/features/watch/presenation/cubit/movies_trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MoviesTrailerCubit extends Cubit<MoviesTrailerState> {
  MoviesTrailerCubit() : super(MoviesTrailerLoading());

  void getMoviesTrailer(int movieId) async {
    var data = await serviceLocator<GetMoviesTrailerUsecase>().call(
      params: movieId,
    );

    return data.fold(
      (error) {
        emit(FailureLoadMoviesTrailer(message: error));
      },
      (data) async {
        MovieTrailerEntity movieTrailerEntity = data;
        YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: movieTrailerEntity.key!,
          flags: const YoutubePlayerFlags(autoPlay: false),
        );

        emit(MoviesTrailerLoaded(youtubePlayerController: controller));
      },
    );
  }
}
