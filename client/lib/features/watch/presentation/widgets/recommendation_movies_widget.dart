import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/movie/movies_card_widget.dart';
import 'package:movie_app/features/watch/presentation/cubit/recommendation_movies_cubit.dart';
import 'package:movie_app/features/watch/presentation/cubit/recommendation_movies_state.dart';

class RecommendationMoviesWidget extends StatelessWidget {
  final int movieId;
  const RecommendationMoviesWidget({required this.movieId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is RecommendationMoviesLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCardWidget(movieEntity: state.movies[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.movies.length,
              ),
            );
          }
          if (state is FailureLoadingRecommendationMovies) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
