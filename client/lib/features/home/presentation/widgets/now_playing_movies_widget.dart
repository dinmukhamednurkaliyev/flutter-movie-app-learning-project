import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_cubit.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_state.dart';
import 'package:movie_app/core/presentation/widgets/movie/movies_card_widget.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';

class NowPlayingMoviesWidget extends StatelessWidget {
  const NowPlayingMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getGenericData<List<MovieEntity>>(
                serviceLocator<GetNowPlayingMoviesUseCase>(),
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is GenericDataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return MovieCardWidget(movieEntity: state.data[index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemCount: state.data.length,
              ),
            );
          }
          if (state is FailureLoadingGenericData) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
