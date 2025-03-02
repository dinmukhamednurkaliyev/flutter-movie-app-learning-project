import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/home/presentation/cubit/now_playing_movies_state.dart';
import 'package:movie_app/features/movie/domain/usecases/get_now_playing_movie_usecase.dart';

class NowPlayingMoviesCubit extends Cubit<NowPlayingMoviesState> {
  NowPlayingMoviesCubit() : super(NowPlayingMoviesLoading());

  void getNowPlayingMovies() async {
    var data = await serviceLocator<GetNowPlayingMoviesUsecase>().call();
    data.fold(
      (error){
        emit(FailureLoadingNowPlayingMovies(message: error));
      },
      (data){
        emit(NowPlayingMoviesLoaded(movies: data));
      }
    );
  }
}
