import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/movie/domain/usecases/search_movie_usecase.dart';
import 'package:movie_app/features/search/presentation/cubit/search_state.dart';
import 'package:movie_app/features/search/presentation/cubit/selectable_option_cubit.dart';
import 'package:movie_app/features/television/domain/usecases/search_television_movie_usecase.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void search(String query, SearchType searchType) {
    emit(SearchLoading());
    switch (searchType) {
      case SearchType.movie:
        searchMovie(query);
        break;
      case SearchType.televisionMovie:
        searchTelevisionMovie(query);
        break;
    }
  }

  void searchMovie(String query) async {
    var data = await serviceLocator<SearchMovieUseCase>().call(params: query);
    data.fold(
      (error) {
        emit(SearchFailure(message: error));
      },
      (data) {
        emit(SearchMoviesLoaded(movies: data));
      },
    );
  }

  void searchTelevisionMovie(String query) async {
    var data = await serviceLocator<SearchTelevisionMovieUseCase>().call(
      params: query,
    );
    data.fold(
      (error) {
        emit(SearchFailure(message: error));
      },
      (data) {
        emit(SearchTelevisionMoviesLoaded(televisionMovies: data));
      },
    );
  }
}
