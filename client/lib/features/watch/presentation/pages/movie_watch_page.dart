import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/app/app_bar_widget.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/watch/presentation/widgets/recommendation_movies_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/similar_movies_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_overview_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_player_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_release_date_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_title_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_vote_average_widget.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(id: movieEntity.id!),
            const SizedBox(height: 16),
            VideoTitleWidget(title: movieEntity.title!),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDateWidget(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverageWidget(
                  videoVoteAverage: movieEntity.voteAverage!,
                ),
              ],
            ),
            const SizedBox(height: 16),
            VideoOverviewWidget(overview: movieEntity.overview!),
            const SizedBox(height: 16),
            RecommendationMoviesWidget(movieId: movieEntity.id!),
            const SizedBox(height: 16),
            SimilarMoviesWidget(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
