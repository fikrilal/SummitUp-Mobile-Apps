import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';

class ProfileImageComponent extends StatelessWidget {
  final String imageUrl;

  const ProfileImageComponent({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 140.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.green, width: 3.w),
      ),
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 140.w,
          height: 140.w,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            width: 140.w,
            height: 140.w,
            color: TextColors.grey200,
          ),
          errorWidget: (context, url, error) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 24, color: Colors.grey[500]),
              SizedBox(height: 4.h),
              TextComponent.bodySmall("Gagal memuat gambar"),
            ],
          ),
        ),
      ),
    );
  }
}
