import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:movie_app/features/auth/presentation/widgets/email_textfield.dart';
import 'package:movie_app/features/auth/presentation/widgets/password_textfield.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_text.dart';
import 'package:movie_app/features/auth/presentation/widgets/auth_link_text.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            authText('Sign Up'),
            const SizedBox(height: 30),
            emailTextField(),
            const SizedBox(height: 20),
            passwordTextField(),
            const SizedBox(height: 60),
            authButton('Sign Up'),
            const SizedBox(height: 20),
            authLinkText(context, 'Already have an account? ', 'Sign In', SignInPage()),
          ]
          )
        )
      );
  }
}
