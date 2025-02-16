import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
    this.height = 128,
    this.borderRadius = 24,
    this.clipAll = false,
    required this.width,
    required this.imageUrl,
    this.margin,
    this.child,
  }) : super(key: key);

  final double width;
  final double height;
  final String imageUrl;
  final bool clipAll;
  final EdgeInsets? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: clipAll ? BorderRadius.zero : BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
