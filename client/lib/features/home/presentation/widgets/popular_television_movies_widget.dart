import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/widgets/television/television_movies_card_widget.dart';
import 'package:movie_app/features/home/presentation/cubit/popular_television_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/popular_television_movies_state.dart';

class PopularTelevisionMoviesWidget extends StatelessWidget {
  const PopularTelevisionMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTelevisionMoviesCubit()..getPopularTelevisionMovies(),
      child: BlocBuilder<PopularTelevisionMoviesCubit, PopularTelevisionMoviesState>(
        builder: (context, state) {
          if(state is PopularTelevisionMoviesLoading){
            return Center(child: const CircularProgressIndicator());
          } 
          if(state is PopularTelevisionMoviesLoaded){
              return SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return TelevisionMoviesCardWidget(televisionMoviesEntity: state.televisionMovies[index]);
                  },
                  separatorBuilder: (context, index) => const SizedBox(width: 10,),
                  itemCount: state.televisionMovies.length,
                ),
              );
          }
          if(state is FailureLoadingPopularTelevisionMovies){
            return Text(state.message);
          }
          return Container();
        }
      ),
    );
  }
}