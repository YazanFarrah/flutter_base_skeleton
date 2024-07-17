
import 'package:anime_app/core/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit,
  });

  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, progress) =>
          const LoadingWidget(),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error_outline,
          color: Colors.red,
        ),
      ),
      imageBuilder: (context, imageProvider) => Image(
        image: imageProvider,
        height: height,
        width: width,
        fit: fit ?? BoxFit.fill,
      ),
      memCacheHeight: height?.toInt(),
      memCacheWidth: width?.toInt(),
      imageUrl: imageUrl,
    );
  }
}