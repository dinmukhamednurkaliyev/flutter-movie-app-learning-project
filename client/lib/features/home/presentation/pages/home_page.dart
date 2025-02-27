import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
      ),
    );
  }
}