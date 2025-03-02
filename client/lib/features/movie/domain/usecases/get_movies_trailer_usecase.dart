import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repository.dart';


class GetMoviesTrailerUsecase implements UseCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await serviceLocator<MovieRepository>().getMovieTrailer(params!);
  }
}