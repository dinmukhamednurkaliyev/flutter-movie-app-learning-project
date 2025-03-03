import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/app/app_bar_widget.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/watch/presenation/widgets/video_player.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(hideBack: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [VideoPlayer(id: movieEntity.id!)]),
      ),
    );
  }
}
