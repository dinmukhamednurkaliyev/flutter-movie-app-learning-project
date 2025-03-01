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
import 'package:movie_app/features/movie/domain/usecases/get_trending_movie_usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator (){
  serviceLocator.registerSingleton<ApiClient>(ApiClient());

  // Sources
  serviceLocator.registerSingleton<AuthRemoteSource>(AuthRemoteSourceImpl());
  serviceLocator.registerSingleton<MovieRemoteSource>(MovieRemoteSourceImpl());

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Usecases
  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());
  serviceLocator.registerSingleton<SignInUseCase>(SignInUseCase());
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  serviceLocator.registerSingleton<GetTrendingMovieUsecase>(GetTrendingMovieUsecase());
}