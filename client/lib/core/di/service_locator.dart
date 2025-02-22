import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/api_client.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator (){
  serviceLocator.registerSingleton<ApiClient>(ApiClient()); 
}