import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movie_app/features/watch/presentation/cubit/recommendation_movies_state.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var data = await serviceLocator<GetRecommendationMoviesUseCase>().call(
      params: movieId,
    );
    data.fold(
      (error) {
        emit(FailureLoadingRecommendationMovies(message: error));
      },
      (data) {
        emit(RecommendationMoviesLoaded(movies: data));
      },
    );
  }
}
