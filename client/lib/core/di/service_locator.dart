import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/api_client.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_up_usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator (){
  serviceLocator.registerSingleton<ApiClient>(ApiClient());

  // Services
  serviceLocator.registerSingleton<AuthRemoteSource>(AuthRemoteSourceImpl());

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  serviceLocator.registerSingleton<SignUpUseCase>(SignUpUseCase());
  serviceLocator.registerSingleton<SignInUseCase>(SignInUseCase());
}