import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/core/presentation/cubit/generic_data_state.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(GenericDataLoading());

  void getGenericData<T>(UseCase useCase, {dynamic params}) async {
    var data = await useCase.call(params: params);
    data.fold(
      (error) {
        emit(FailureLoadingGenericData(message: error));
      },
      (data) {
        emit(GenericDataLoaded<T>(data: data));
      },
    );
  }
}
