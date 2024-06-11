import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';

class ExploreCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ExploreCard({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9 * MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.w),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextComponent.headlineSmall(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.w),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextComponent.labelSmall("Keep Exploring"),
                  SizedBox(width: 4.w),
                  SvgPicture.asset(
                    'assets/icons/arrow_next.svg',
                    width: 20.w,
                    height: 20.h,
                    color: TextColors.grey700,
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
