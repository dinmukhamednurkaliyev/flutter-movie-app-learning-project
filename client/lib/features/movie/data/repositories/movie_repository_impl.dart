import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/movie/data/models/mapper/movie_model_mapper.dart';
import 'package:movie_app/features/movie/data/models/movie_model.dart';
import 'package:movie_app/features/movie/data/sources/movie_remote_source.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either> getTrangingMovies() async {
    var response = await serviceLocator<MovieRemoteSource>().getTrangingMovies();
    return response.fold(
      (error){
        return Left(error);
      },
      (data){
        var movies = List.from(data["content"]).map((item) => MovieModelMapper.toEntity(MovieModel.fromJson(item))).toList(); 
        return Right(movies);
      }
    );
  }
  
  @override 
  Future<Either> getNowPlayingMovies() async {
    var response = await serviceLocator<MovieRemoteSource>().getNowPlayingMovies();
    return response.fold(
      (error){
        return Left(error);
      },
      (data){
        var movies = List.from(data["content"]).map((item) => MovieModelMapper.toEntity(MovieModel.fromJson(item))).toList(); 
        return Right(movies);
      }
    );
  }

}