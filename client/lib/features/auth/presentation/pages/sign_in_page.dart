import 'package:flutter/material.dart';
import 'package:movie_app/core/di/service_locator.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';
import 'package:movie_app/core/widgets/display_message.dart';
import 'package:movie_app/features/auth/data/models/sign_in_request_params_model.dart';
import 'package:movie_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:movie_app/features/auth/presentation/pages/sign_up_page.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:movie_app/features/auth/presentation/widgets/email_textfield.dart';
import 'package:movie_app/features/auth/presentation/widgets/password_textfield.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_text.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_link_text.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
  
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
            AuthTitleText(text: 'Sign In'),
            const SizedBox(height: 30),
            EmailTextField(controller: _emailController),
            const SizedBox(height: 20),
            PasswordTextField(controller: _passwordController),
            const SizedBox(height: 60),
            AuthButton(
              title: 'Sign In',
              onPressed: () async =>
                serviceLocator<SignInUseCase>().call(
                  params: SignInRequestParamsModel(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                ),
              
              onSuccess: () {
                AppNavigator.pushAndRemove(context, HomePage());
              },
              onFailure: (error) {
                DisplayMessage.errorMessage(error, context);
              },
            ),
            const SizedBox(height: 20),
            AuthLinkText(
              context,
              prefixText: 'Don\'t have an account? ',
              linkText: 'Sign Up',
              pageRoute:  SignUpPage(),
            ),
          ],
        ),
      ),
    );
  }
}
