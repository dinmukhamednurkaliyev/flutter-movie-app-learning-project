import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_vectors.dart';
import 'package:movie_app/core/widgets/app/app_bar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/features/home/presentation/widgets/category_text_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_movies_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/trending_movies_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        hideBack: true,
        title: SvgPicture.asset(AppVectorsAssets.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryTextWidget(title: 'Trendings 🔥'),
            TrendingMoviesWidget(),
            SizedBox(height: 16),
            CategoryTextWidget(title: 'Now Playing Movie ▶️'),
            SizedBox(height: 16),
            NowPlayingMoviesWidget(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}