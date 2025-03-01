import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/movie/movie_card.dart';
import 'package:movie_app/features/home/presentation/cubit/now_playing_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/now_playing_movies_state.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingMoviesCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingMoviesCubit, NowPlayingMoviesState>(
        builder: (context, state) {
          if(state is NowPlayingMoviesLoading){
            return Center(child: const CircularProgressIndicator());
          } 
          if(state is NowPlayingMoviesLoaded){
              // return ListView.separated(
              //   itemBuilder: (context, index) {
              //     return MovieCardWidget(movieEntity: state.movies[index]);
              //   },
              //   separatorBuilder: (context, index) => const SizedBox(width: 10,),
              //   itemCount: state.movies.length,
              // );
          }
          if(state is FailureLoadingNowPlayingMovies){
            return Text(state.message);
          }
          return Container();
        }
      ),
    );
  }
}