abstract class GenericDataState {}

class GenericDataLoading extends GenericDataState {}

class GenericDataLoaded<T> extends GenericDataState {
  final List<T> data;

  GenericDataLoaded({required this.data});
}

class FailureLoadingGenericData extends GenericDataState {
  final String message;

  FailureLoadingGenericData({required this.message});
}
