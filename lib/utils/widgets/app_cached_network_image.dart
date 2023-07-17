import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Widget? placeholder;
  final BoxFit? boxFit;
  const AppCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.placeholder,
    this.width,
    this.height,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: boxFit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) =>
          placeholder ?? const Icon(Icons.error),
    );
  }
}

/// make image as background if itt require a provider not a widget
class AppCachedNetworkImageProvider extends CachedNetworkImageProvider {
  final String imageUrl;
  const AppCachedNetworkImageProvider({
    required this.imageUrl,
    int? maxHeight,
    int? maxWidth,
  }) : super(
          imageUrl,
          maxHeight: maxHeight,
          maxWidth: maxWidth,
        );
}
