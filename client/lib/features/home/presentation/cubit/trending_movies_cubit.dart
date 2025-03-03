import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_movies_state.dart';
import 'package:movie_app/features/movie/domain/usecases/get_trending_movies_usecase.dart';

class TrendingMoviesCubit extends Cubit<TrendingMoviesState> {
  TrendingMoviesCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var data = await serviceLocator<GetTrendingMoviesUseCase>().call();
    data.fold(
      (error) {
        emit(FailureLoadingTrendingMovies(message: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
