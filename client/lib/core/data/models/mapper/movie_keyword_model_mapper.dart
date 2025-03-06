import 'package:movie_app/core/data/models/movie_keyword_model.dart';
import 'package:movie_app/core/domain/entities/movie_keyword_entity.dart';

class MovieKeywordModelMapper {
  static MovieKeywordEntity toEntity(MovieKeywordModel movieKeywordModel) {
    return MovieKeywordEntity(
      name: movieKeywordModel.name,
      id: movieKeywordModel.id,
    );
  }
}
