import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../texts/component_text.dart';

class CachedImageComponent extends StatelessWidget {
  final String imageUrl;
  final double? aspectRatio;
  final double? width;
  final double? height;
  final double? borderRadius;

  const CachedImageComponent({
    super.key,
    required this.imageUrl,
    this.aspectRatio = 16 / 10,
    this.width,
    this.height,
    this.borderRadius = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: AspectRatio(
        aspectRatio: aspectRatio!,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width ?? double.infinity,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            width: width ?? double.infinity,
            height: height,
            color: TextColors.grey200,
          ),
          errorWidget: (context, url, error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 24, color: Colors.grey[500]),
              SizedBox(height: 4.h),
              TextComponent.bodySmall("Gagal memuat gambar")
            ],
          ),
        ),
      ),
    );
  }
}
