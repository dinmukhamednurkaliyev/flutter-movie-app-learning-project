import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/widgets/movie/movies_card_widget.dart';
import 'package:movie_app/core/presentation/widgets/television/television_movies_card_widget.dart';
import 'package:movie_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:movie_app/features/search/presentation/cubit/search_state.dart';

class SearchContentWidget extends StatelessWidget {
  const SearchContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchMoviesLoaded) {
          return GridView.builder(
            itemCount: state.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return MovieCardWidget(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is SearchTelevisionMoviesLoaded) {
          return GridView.builder(
            itemCount: state.televisionMovies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return TelevisionMoviesCardWidget(
                televisionMoviesEntity: state.televisionMovies[index],
              );
            },
          );
        }
        if (state is SearchFailure) {
          return Center(child: Text(state.message));
        }
        return Container();
      },
    );
  }
}
