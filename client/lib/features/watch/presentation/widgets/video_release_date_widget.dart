import 'package:flutter/material.dart';

class VideoReleaseDateWidget extends StatelessWidget {
  final DateTime releaseDate;

  const VideoReleaseDateWidget({required this.releaseDate, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month, size: 20, color: Colors.grey),
        const SizedBox(width: 5),
        Text(
          ' ${releaseDate.toString().split(' ')[0]}',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
