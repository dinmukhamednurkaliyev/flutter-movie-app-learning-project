import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/api_client.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_app/features/auth/domain/usecases/is_logged_in_usecase.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:movie_app/features/movie/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/features/movie/data/sources/movie_remote_source.dart';
import 'package:movie_app/features/movie/domain/repositories/movie_repository.dart';
import 'package:movie_app/features/movie/domain/usecases/get_movies_trailer_usecase.dart';
import 'package:movie_app/features/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie_app/features/movie/domain/usecases/get_recommendation_movies_usecase.dart';
import 'package:movie_app/features/movie/domain/usecases/get_similar_movies_usecase.dart';
import 'package:movie_app/features/movie/domain/usecases/get_trending_movies_usecase.dart';
import 'package:movie_app/features/television/data/repositories/television_repository_impl.dart';
import 'package:movie_app/features/television/data/sources/television_remote_source.dart';
import 'package:movie_app/features/television/domain/repositories/television_repository.dart';
import 'package:movie_app/features/television/domain/usecases/get_movie_keywords.dart';
import 'package:movie_app/features/television/domain/usecases/get_popular_television_movies_usecase.dart';
import 'package:movie_app/features/television/domain/usecases/get_recommendation_television_movies_usecase.dart';
import 'package:movie_app/features/television/domain/usecases/get_similar_television_movies_usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<ApiClient>(ApiClient());

  // Sources
  serviceLocator.registerSingleton<AuthRemoteSource>(AuthRemoteSourceImpl());
  serviceLocator.registerSingleton<MovieRemoteSource>(MovieRemoteSourceImpl());
  serviceLocator.registerSingleton<TelevisionRemoteSource>(
    TelevisionRemoteSourceImpl(),
  );

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  serviceLocator.registerSingleton<TelevisionRepository>(
    TelevisionRepositoryImpl(),
  );

  // UseCases
  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());
  serviceLocator.registerSingleton<SignInUseCase>(SignInUseCase());
  serviceLocator.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  serviceLocator.registerSingleton<GetTrendingMoviesUseCase>(
    GetTrendingMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetNowPlayingMoviesUseCase>(
    GetNowPlayingMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetPopularTelevisionMoviesUseCase>(
    GetPopularTelevisionMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetMoviesTrailerUseCase>(
    GetMoviesTrailerUseCase(),
  );
  serviceLocator.registerSingleton<GetRecommendationMoviesUseCase>(
    GetRecommendationMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetSimilarMoviesUseCase>(
    GetSimilarMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetRecommendationTelevisionMoviesUseCase>(
    GetRecommendationTelevisionMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetSimilarTelevisionMoviesUseCase>(
    GetSimilarTelevisionMoviesUseCase(),
  );
  serviceLocator.registerSingleton<GetMovieKeywordsUseCase>(
    GetMovieKeywordsUseCase(),
  );
}
