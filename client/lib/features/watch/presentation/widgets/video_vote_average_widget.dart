import 'package:flutter/material.dart';

class VideoVoteAverageWidget extends StatelessWidget {
  final double videoVoteAverage;
  const VideoVoteAverageWidget({required this.videoVoteAverage, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        Text(' ${videoVoteAverage.toStringAsFixed(1)}'),
      ],
    );
  }
}
