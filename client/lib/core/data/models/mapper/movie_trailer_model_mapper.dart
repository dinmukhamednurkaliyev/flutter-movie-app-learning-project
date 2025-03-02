import 'package:movie_app/core/data/models/movie_trailer_model.dart';
import 'package:movie_app/core/domain/entities/movie_trailer_entity.dart';

class MovieTrailerModelMapper {
  static MovieTrailerEntity toEntity(MovieTrailerModel movieTrainlerModel){
    return MovieTrailerEntity(
      iso6391: movieTrainlerModel.iso6391, 
      iso31661: movieTrainlerModel.iso31661, 
      name: movieTrainlerModel.name, 
      key: movieTrainlerModel.key, 
      site: movieTrainlerModel.site, 
      size: movieTrainlerModel.size, 
      type: movieTrainlerModel.type, 
      official: movieTrainlerModel.official, 
      publishedAt: movieTrainlerModel.publishedAt, 
      id: movieTrainlerModel.id
    );
  }
}