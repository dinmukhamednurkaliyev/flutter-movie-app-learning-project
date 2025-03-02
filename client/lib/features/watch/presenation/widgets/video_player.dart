import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/watch/presenation/cubit/movies_trailer_cubit.dart';
import 'package:movie_app/features/watch/presenation/cubit/movies_trailer_state.dart';

class VideoPlayer extends StatelessWidget {
  final int id;
  const VideoPlayer({required this.id, super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesTrailerCubit()..getMoviesTrailer(id),
      child: BlocBuilder<MoviesTrailerCubit, MoviesTrailerState>(
        builder: (context, state){
          if(state is MoviesTrailerLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is MoviesTrailerLoaded){
            return Chewie(controller: state.chewieController);
          }
          if(state is FailureLoadMoviesTrailer){
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        }
      ),
    );
  }
}