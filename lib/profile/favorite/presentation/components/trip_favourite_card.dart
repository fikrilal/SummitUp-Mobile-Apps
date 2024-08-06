import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import 'package:intl/intl.dart';

class TripFavouriteCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String duration;
  final String rating;
  final String quota;
  final String price;
  final int tripId;
  final bool isLoading;

  const TripFavouriteCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.rating,
    required this.quota,
    required this.price,
    required this.tripId,
    this.isLoading = false,
  });

  factory TripFavouriteCard.loading() {
    return TripFavouriteCard(
      title: '',
      imageUrl: '',
      duration: '',
      rating: '',
      quota: '',
      price: '',
      tripId: 0,
      isLoading: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildLoading();
    }

    final formattedPrice = NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0).format(double.parse(price));

    return Container(
      decoration: BoxDecoration(
        color: BrandColors.brandPrimary50.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: BrandColors.brandPrimary100,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w),
              topRight: Radius.circular(10.w),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent.titleMedium(
                  title,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/calendar_bold_icon.svg',
                      width: 16.w,
                      height: 16.h,
                      color: TextColors.grey500,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodySmall(duration),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/group_bold_icon.svg',
                      width: 16.w,
                      height: 16.h,
                      color: TextColors.grey500,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodySmall(quota),
                    SizedBox(width: 12.w),
                    Container(
                      height: 12.h,
                      width: 1.w,
                      color: TextColors.grey200,
                    ),
                    SizedBox(width: 12.w),
                    SvgPicture.asset(
                      'assets/icons/icon_star.svg',
                      width: 16.w,
                      height: 16.h,
                      color: TextColors.grey500,
                    ),
                    SizedBox(width: 8.w),
                    TextComponent.bodySmall(rating),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextComponent.titleMedium(formattedPrice,
                            fontWeight: FontWeight.w600,
                            color: BrandColors.brandPrimary500),
                        TextComponent.bodySmall("/orang"),
                      ],
                    ),
                    Icon(Icons.bookmark)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(
          color: BrandColors.brandPrimary100,
          width: 1,
        ),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.w),
                topRight: Radius.circular(10.w),
              ),
              child: Container(
                width: double.infinity,
                height: 180.w,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 150.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: double.infinity,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
