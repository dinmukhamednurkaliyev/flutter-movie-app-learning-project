
import 'package:flutter/material.dart';
import 'package:movie_app/core/assets/app_images.dart';
import 'package:movie_app/core/navigation/app_navigation.dart';
import 'package:movie_app/core/theme/app_colors.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/watch/presenation/pages/movie_watch_page.dart';


class MovieCardWidget extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieCardWidget({
    required this.movieEntity,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AppNavigator.push(context, MovieWatchPage(movieEntity: movieEntity,));
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                    AppImagesAssets.movieImageBasePath + movieEntity.posterPath!
                  )
                 ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                  )
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieEntity.title!,
                        style: const TextStyle(
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          Text(
                           ' ${movieEntity.voteAverage!.toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontSize: 10
                            ),
                          )
                        ],
                      )
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