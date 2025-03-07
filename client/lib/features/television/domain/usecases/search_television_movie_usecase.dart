import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/features/television/domain/repositories/television_repository.dart';

class SearchTelevisionMovieUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await serviceLocator<TelevisionMovieRepository>().searchTelevisionMovie(
      params!,
    );
  }
}
