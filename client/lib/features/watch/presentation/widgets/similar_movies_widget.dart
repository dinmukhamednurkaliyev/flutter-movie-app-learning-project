import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/presentation/widgets/movie/movies_card_widget.dart';
import 'package:movie_app/features/watch/presentation/cubit/similar_movies_cubit.dart';
import 'package:movie_app/features/watch/presentation/cubit/similar_movies_state.dart';

class SimilarMoviesWidget extends StatelessWidget {
  final int movieId;
  const SimilarMoviesWidget({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(movieId),
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is SimilarMoviesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCardWidget(movieEntity: state.movies[index]);
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          }
          if (state is FailureLoadingSimilarMovies) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
