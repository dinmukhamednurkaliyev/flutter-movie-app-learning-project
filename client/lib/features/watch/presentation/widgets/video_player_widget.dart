import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/watch/presentation/cubit/movies_trailer_cubit.dart';
import 'package:movie_app/features/watch/presentation/cubit/movies_trailer_state.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final int id;
  const VideoPlayerWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesTrailerCubit()..getMoviesTrailer(id),
      child: BlocBuilder<MoviesTrailerCubit, MoviesTrailerState>(
        builder: (context, state) {
          if (state is MoviesTrailerLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MoviesTrailerLoaded) {
            return YoutubePlayer(
              controller: state.youtubePlayerController,
              showVideoProgressIndicator: true,
            );
          }
          if (state is FailureLoadMoviesTrailer) {
            return Center(child: Text(state.message));
          }
          return Container();
        },
      ),
    );
  }
}
