import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/home/presentation/cubit/popular_television_movies_state.dart';
import 'package:movie_app/features/television/domain/usecases/get_popular_television_movies_usecase.dart';

class PopularTelevisionMoviesCubit extends Cubit<PopularTelevisionMoviesState> {
  PopularTelevisionMoviesCubit() : super(PopularTelevisionMoviesLoading());

  void getPopularTelevisionMovies() async {
    var data = await serviceLocator<GetPopularTelevisionMoviesUsecase>().call();
    data.fold(
      (error){
        emit(FailureLoadingPopularTelevisionMovies(message: error));
      },
      (data){
        emit(PopularTelevisionMoviesLoaded(televisionMovies: data));
      }
    );
  }
}
