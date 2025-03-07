import 'package:flutter/material.dart';
import 'package:movie_app/core/presentation/widgets/app/app_bar_widget.dart';
import 'package:movie_app/features/television/domain/entities/television_entity.dart';
import 'package:movie_app/features/watch/presentation/widgets/movie_keywords_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/recommendation_television_movies_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/similar_television_movies_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_overview_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_player_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_title_widget.dart';
import 'package:movie_app/features/watch/presentation/widgets/video_vote_average_widget.dart';

class TelevisionMoviePage extends StatelessWidget {
  final TelevisionEntity televisionEntity;
  const TelevisionMoviePage({required this.televisionEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(id: televisionEntity.id!),
            const SizedBox(height: 16),
            VideoTitleWidget(title: televisionEntity.name!),
            const SizedBox(height: 16),
            MovieKeywordsWidget(televisionMovieId: televisionEntity.id!),
            const SizedBox(height: 16),
            VideoVoteAverageWidget(
              videoVoteAverage: televisionEntity.voteAverage!,
            ),
            const SizedBox(height: 16),
            VideoOverviewWidget(overview: televisionEntity.overview!),
            const SizedBox(height: 16),
            RecommendationTelevisionMoviesWidget(
              televisionMovieId: televisionEntity.id!,
            ),
            const SizedBox(height: 16),
            SimilarTelevisionMoviesWidget(
              televisionMoviesId: televisionEntity.id!,
            ),
          ],
        ),
      ),
    );
  }
}
