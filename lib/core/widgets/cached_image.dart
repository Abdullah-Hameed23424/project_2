import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feature_based_with_mvvm/core/config/app_config.dart';
import 'package:feature_based_with_mvvm/core/constants/app_colors.dart';
import 'package:feature_based_with_mvvm/core/widgets/app_shimmer.dart';

class CachedImage extends StatelessWidget {
  const CachedImage(
    this.image, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.withHero = false,
    this.radius,
    this.errorWidget,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool withHero;
  final BorderRadiusGeometry? radius;
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    if (image.trim().isEmpty ||
        image == '/' ||
        image == 'storage/' ||
        image == '/storage/') {
      return SizedBox(
        width: width,
        height: height,
        child:
            errorWidget ??
            Icon(Icons.error_outline, color: AppColors.primaryBase),
      );
    }

    final String imageUrl;
    if (image.startsWith('http')) {
      imageUrl = image;
    } else if (image.startsWith('assets/') || image.startsWith('/assets/')) {
      imageUrl = image;
    } else {
      // Prevent double /storage/
      String path = image;
      if (path.contains('storage/')) {
        // If it already contains storage, just ensure we prepend the domain
        imageUrl = path.startsWith('/')
            ? '${AppConfig.domain}$path'
            : '${AppConfig.domain}/$path';
      } else {
        imageUrl = '${AppConfig.storageUrl}$path';
      }
    }

    final Widget innerImage;

    if (imageUrl.startsWith('assets/') || imageUrl.startsWith('/assets/')) {
      innerImage = ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(5),
        child: Image.asset(
          imageUrl.startsWith('/') ? imageUrl.substring(1) : imageUrl,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) =>
              errorWidget ??
              Icon(Icons.error_outline, color: AppColors.primaryBase),
        ),
      );
    } else if (imageUrl.toLowerCase().endsWith('.svg')) {
      innerImage = ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(5),
        child: SvgPicture.network(
          imageUrl,
          fit: fit ?? BoxFit.contain,
          placeholderBuilder: (BuildContext context) => AppShimmer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: radius,
              ),
            ),
          ),
        ),
      );
    } else {
      innerImage = CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        filterQuality: FilterQuality.high,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: radius ?? BorderRadius.circular(5),
            image: DecorationImage(
              image: imageProvider,
              fit: fit,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, progress) => AppShimmer(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: radius,
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
            errorWidget ??
            Icon(Icons.error_outline, color: AppColors.primaryBase),
      );
    }

    final Widget imageWidget = SizedBox(
      width: width,
      height: height,
      child: innerImage,
    );
    if (withHero) return Hero(tag: image, child: imageWidget);
    return imageWidget;
  }
}
