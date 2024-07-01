import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/discount/presentation/components/trip_discount_card.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';
import '../../../_core/presentation/constants/dimensions.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({super.key});

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Promo Trip Tersedia",
        showBottomBorder: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16.h),
                TripDiscountCard(
                  title: "Trip Gunung Semeru - Gold Class",
                  imageUrl: 'https://picsum.photos/1800',
                  duration: "3 Hari",
                  rating: "4.6 (120)",
                  quota: "10 Orang",
                  price: "Rp 450.000",
                  discountPrice: "Rp 539.0000",
                  tripId: 1,
                  isLoading: false,
                ),
                SizedBox(height: 10.h),
                TripDiscountCard(
                  title: "Trip Gunung Semeru - Gold Class",
                  imageUrl: 'https://picsum.photos/1800',
                  duration: "3 Hari",
                  rating: "4.6 (120)",
                  quota: "10 Orang",
                  price: "Rp 450.000",
                  discountPrice: "Rp 539.0000",
                  tripId: 1,
                  isLoading: false,
                ),
                SizedBox(height: 10.h),
                TripDiscountCard(
                  title: "Trip Gunung Semeru - Gold Class",
                  imageUrl: 'https://picsum.photos/1800',
                  duration: "3 Hari",
                  rating: "4.6 (120)",
                  quota: "10 Orang",
                  price: "Rp 450.000",
                  discountPrice: "Rp 539.0000",
                  tripId: 1,
                  isLoading: false,
                ),
                SizedBox(height: 10.h),
                TripDiscountCard(
                  title: "Trip Gunung Semeru - Gold Class",
                  imageUrl: 'https://picsum.photos/1800',
                  duration: "3 Hari",
                  rating: "4.6 (120)",
                  quota: "10 Orang",
                  price: "Rp 450.000",
                  discountPrice: "Rp 539.0000",
                  tripId: 1,
                  isLoading: false,
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
