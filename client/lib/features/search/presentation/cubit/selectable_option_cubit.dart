import 'package:flutter_bloc/flutter_bloc.dart';

enum SearchType { movie, televisionMovie }

class SelectableOptionCubit extends Cubit<SearchType> {
  SelectableOptionCubit() : super(SearchType.movie);

  void selectMovie() => emit(SearchType.movie);
  void selectTelevisionMovie() => emit(SearchType.televisionMovie);
}
