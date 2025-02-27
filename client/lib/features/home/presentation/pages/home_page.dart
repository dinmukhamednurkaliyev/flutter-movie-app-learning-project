import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_vectors.dart';
import 'package:movie_app/core/widgets/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SvgPicture.asset(AppVectorsAssets.logo),
        ),
      ),
    );
  }
}