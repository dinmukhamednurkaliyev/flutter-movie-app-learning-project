import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/television/data/models/mapper/television_model_mapper.dart';
import 'package:movie_app/features/television/data/models/television_model.dart';
import 'package:movie_app/features/television/data/sources/television_remote_source.dart';
import 'package:movie_app/features/television/domain/repositories/television_repository.dart';

class TelevisionRepositoryImpl implements TelevisionRepository{
  @override
  Future<Either> getPopularTelevision() async {
    var response = await serviceLocator<TelevisionRemoteSource>().getPopularTelevision();
    return response.fold(
      (error){
        return Left(error);
      },
      (data){
        var movies = List.from(data["content"]).map((item) => TelevsionModelMapper.toEntity(TelevisionModel.fromJson(item))).toList(); 
        return Right(movies);
      }
    );
  }
  
}