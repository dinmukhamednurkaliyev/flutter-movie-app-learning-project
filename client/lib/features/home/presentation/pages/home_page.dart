import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_vectors.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';
import 'package:movie_app/core/presentation/widgets/app/app_bar_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/features/home/presentation/widgets/category_text_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/now_playing_movies_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/popular_television_movies_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/trending_movies_widget.dart';
import 'package:movie_app/features/search/presentation/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        hideBack: true,
        action: IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
        ),
        title: SvgPicture.asset(AppVectorsAssets.logo),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryTextWidget(title: 'Trending 🔥'),
            TrendingMoviesWidget(),
            SizedBox(height: 16),
            CategoryTextWidget(title: 'Now Playing Movies'),
            SizedBox(height: 16),
            NowPlayingMoviesWidget(),
            SizedBox(height: 16),
            CategoryTextWidget(title: 'Popular TV Movies'),
            SizedBox(height: 16),
            PopularTelevisionMoviesWidget(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
