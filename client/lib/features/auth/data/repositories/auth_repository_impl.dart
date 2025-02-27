import 'package:dartz/dartz.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/auth/data/models/sign_in_request_params_model.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {

  @override
  Future<Either> signUpWithEmailAndPassword(SignUpRequestParamsModel params) async {
    var result = await serviceLocator<AuthRemoteSource>().signUpWithEmailAndPassword(params);
     return result.fold( 
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      }
     );
  }
  
  @override
  Future<Either> signInWithEmailAndPassword(SignInRequestParamsModel params) async {
    var result = await serviceLocator<AuthRemoteSource>().signInWithEmailAndPassword(params);
    
    return result.fold( 
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('token', data['user']['token']);
        return Right(data);
      }
     );
  }
  
  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    return (token != null);
  } 

}