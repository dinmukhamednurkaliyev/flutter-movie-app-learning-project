import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_cubit.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_state.dart';
import 'package:movie_app/core/presentation/widgets/television/television_movies_card_widget.dart';
import 'package:movie_app/features/television/domain/entities/television_entity.dart';
import 'package:movie_app/features/television/domain/usecases/get_similar_television_movies_usecase.dart';

class SimilarTelevisionMoviesWidget extends StatelessWidget {
  final int televisionMoviesId;
  const SimilarTelevisionMoviesWidget({
    required this.televisionMoviesId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GenericDataCubit()..getGenericData<List<TelevisionEntity>>(
                serviceLocator<GetSimilarTelevisionMoviesUseCase>(),
                params: televisionMoviesId,
              ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is GenericDataLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is GenericDataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Similar',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TelevisionMoviesCardWidget(
                        televisionMoviesEntity: state.data[index],
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 10),
                    itemCount: state.data.length,
                  ),
                ),
              ],
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
