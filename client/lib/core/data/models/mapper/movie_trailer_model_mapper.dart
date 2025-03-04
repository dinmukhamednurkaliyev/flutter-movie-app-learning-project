import 'package:movie_app/core/data/models/movie_trailer_model.dart';
import 'package:movie_app/core/domain/entities/movie_trailer_entity.dart';

class MovieTrailerModelMapper {
  static MovieTrailerEntity toEntity(MovieTrailerModel movieTrailerModel) {
    return MovieTrailerEntity(
      iso6391: movieTrailerModel.iso6391,
      iso31661: movieTrailerModel.iso31661,
      name: movieTrailerModel.name,
      key: movieTrailerModel.key,
      site: movieTrailerModel.site,
      size: movieTrailerModel.size,
      type: movieTrailerModel.type,
      official: movieTrailerModel.official,
      publishedAt: movieTrailerModel.publishedAt,
      id: movieTrailerModel.id,
    );
  }
}
