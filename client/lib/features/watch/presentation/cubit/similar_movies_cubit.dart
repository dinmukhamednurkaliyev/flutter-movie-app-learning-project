import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/movie/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movie_app/features/watch/presentation/cubit/similar_movies_state.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesLoading());

  void getSimilarMovies(int movieId) async {
    var data = await serviceLocator<GetSimilarMoviesUseCase>().call(
      params: movieId,
    );
    data.fold(
      (error) {
        emit(FailureLoadingSimilarMovies(message: error));
      },
      (data) {
        emit(SimilarMoviesLoaded(movies: data));
      },
    );
  }
}
