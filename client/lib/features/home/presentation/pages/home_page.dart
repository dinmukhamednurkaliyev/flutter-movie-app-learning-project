import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_vectors.dart';
import 'package:movie_app/core/widgets/app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/features/home/presentation/widgets/trending_movies_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/trending_text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(AppVectorsAssets.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingTextWidget(),
            TrendingMoviesWidget()
          ],
        ),
      ),
    );
  }
}