import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/entities/movie_keyword_entity.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_cubit.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_state.dart';
import 'package:movie_app/features/television/domain/usecases/get_movie_keywords.dart';

class MovieKeywordsWidget extends StatelessWidget {
  final int televisionMovieId;
  const MovieKeywordsWidget({required this.televisionMovieId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getGenericData<List<MovieKeywordEntity>>(
                serviceLocator<GetMovieKeywordsUseCase>(),
                params: televisionMovieId,
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is GenericDataLoaded) {
            List<MovieKeywordEntity> movieKeyword = state.data;
            return Wrap(
              children:
                  movieKeyword
                      .map((item) => Chip(label: Text(item.name!)))
                      .toList(),
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
