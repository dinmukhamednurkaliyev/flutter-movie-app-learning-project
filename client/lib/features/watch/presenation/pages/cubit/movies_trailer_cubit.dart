import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/configs/api_configs.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/entities/movie_trailer_entity.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies_trailer_usecase.dart';
import 'package:movie_app/features/watch/presenation/pages/cubit/movies_trailer_state.dart';
import 'package:video_player/video_player.dart';

class MoviesTrailerCubit extends Cubit<MoviesTrailerState>{
  MoviesTrailerCubit() : super(MoviesTrailerLoading());

  void getMoviesTrailer(int movieId) async {
    var data = await serviceLocator<GetMoviesTrailerUsecase>().call(
      params: movieId
    );

    return data.fold(
    (error){
      emit(FailureLoadMoviesTrailer(message: error));
    }, 
    (data) async{
      MovieTrailerEntity movieTrailerEntity = data;
      VideoPlayerController videoPlayerController = VideoPlayerController.contentUri(
        Uri.tryParse(ApiConfig.trailerBase + movieTrailerEntity.key!)!
      );
      await videoPlayerController.initialize();

      final chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: false,
        );

      emit(MoviesTrailerLoaded(chewieController: chewieController));
    }
    );
  }
}