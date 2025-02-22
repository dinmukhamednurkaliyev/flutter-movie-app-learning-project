import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';
import 'package:movie_app/features/auth/presentation/pages/signin_page.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/features/splash/presentation/cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            AppNavigator.pushReplacement(context, SignInPage());
          }  
          
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1a1b20).withValues(alpha: 0),
                    Color(0xff1a1b20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
