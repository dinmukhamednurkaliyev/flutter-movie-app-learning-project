import 'package:flutter/material.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/features/auth/data/models/sign_up_request_params_model.dart';
import 'package:movie_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:movie_app/features/auth/data/sources/auth_remote_source.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:movie_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:movie_app/features/auth/presentation/widgets/email_textfield.dart';
import 'package:movie_app/features/auth/presentation/widgets/password_textfield.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_text.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_link_text.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            authText('Sign In'),
            const SizedBox(height: 30),
            emailTextField(controller: _emailController),
            const SizedBox(height: 20),
            passwordTextField(controller: _passwordController),
            const SizedBox(height: 60),
            authButton(
              title: 'Sign Up',
              onPressed: () async {
                await serviceLocator<SignUpUsecase>().call(
                  params: SignUpRequestParamsModel(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            authLinkText(
              context,
              'Don\'t have an account? ',
              'Sign Up',
              SignUpPage(),
            ),
          ],
        ),
      ),
    );
  }
}
