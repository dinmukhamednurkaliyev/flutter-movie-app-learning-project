import 'package:movie_app/features/television/data/models/television_model.dart';
import 'package:movie_app/features/television/domain/entities/television_entity.dart';

class TelevisionModelMapper {
  static TelevisionEntity toEntity(TelevisionModel televisionModel) {
    return TelevisionEntity(
      adult: televisionModel.adult,
      backdropPath: televisionModel.backdropPath,
      genreIds: televisionModel.genreIds,
      id: televisionModel.id,
      originCountry: televisionModel.originCountry,
      originalLanguage: televisionModel.originalLanguage,
      originalName: televisionModel.originalName,
      overview: televisionModel.overview,
      popularity: televisionModel.popularity,
      posterPath: televisionModel.posterPath,
      firstAirDate: televisionModel.firstAirDate,
      name: televisionModel.name,
      voteAverage: televisionModel.voteAverage,
      voteCount: televisionModel.voteCount,
    );
  }
}
