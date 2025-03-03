import 'package:flutter/material.dart';

class VideoTitleWidget extends StatelessWidget {
  final String title;

  const VideoTitleWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
