import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/domain/usecase/usecase.dart';
import 'package:movie_app/features/auth/domain/repositories/auth_repository.dart';

class IsLoggedInUsecase implements UseCase<bool,dynamic> {
  
  @override
  Future<bool> call({params}) async {
    return await serviceLocator<AuthRepository>().isLoggedIn();
  }

}