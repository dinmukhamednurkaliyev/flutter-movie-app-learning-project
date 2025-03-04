import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_movies_cubit.dart';
import 'package:movie_app/features/home/presentation/cubit/trending_movies_state.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingMoviesCubit()..getTrendingMovies(),
      child: BlocBuilder<TrendingMoviesCubit, TrendingMoviesState>(
        builder: (context, state) {
          if (state is TrendingMoviesLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is TrendingMoviesLoaded) {
            return FanCarouselImageSlider.sliderType1(
              imagesLink:
                  state.movies
                      .map(
                        (item) =>
                            AppImagesAssets.movieImageBasePath +
                            item.posterPath.toString(),
                      )
                      .toList(),
              isAssets: false,
              autoPlay: false,
              sliderHeight: 400,
              showIndicator: true,
            );
          }
          if (state is FailureLoadingTrendingMovies) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
