import 'package:flutter/material.dart';

class CustomBookImageLoading extends StatelessWidget {
  const CustomBookImageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.grey[50],
        ),
      ),
    );
  }
}
