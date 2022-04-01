import 'package:flutter/material.dart';

class NewsCardImage extends StatelessWidget {
  final Radius radius;
  final double height;
  final String? imageUrl;

  const NewsCardImage(
      {Key? key,
      this.radius = const Radius.circular(12),
      required this.height,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        image: DecorationImage(
            image: NetworkImage(imageUrl ??
                "https://cdn.pixabay.com/photo/2020/07/21/16/24/landscape-5426755_960_720.jpg"),
            fit: BoxFit.cover),
      ),
      height: height / 4,
      width: double.infinity,
    );
  }
}
