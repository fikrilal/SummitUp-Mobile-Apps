import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import 'package:summitup_mobile_apps/discover/presentation/components/trip_card.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/trip_details_screen.dart';
import 'package:summitup_mobile_apps/discover/presentation/providers/mountain_detail_providers.dart';

import '../components/equipment_rental_card.dart';
import '../providers/equipment_by_mountain_providers.dart';
import '../providers/trip_by_mountain_providers.dart';
import 'equipment_details_screen.dart';

class MountainDetailsScreen extends ConsumerWidget {
  final int mountainId;

  const MountainDetailsScreen({super.key, required this.mountainId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mountainDetailAsyncValue =
        ref.watch(mountainDetailProvider(mountainId));
    final tripsAsyncValue = ref.watch(tripsProvider(mountainId));
    final equipmentsAsyncValue = ref.watch(equipmentsProvider(mountainId));

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Detail Gunung",
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w, bottom: 16.h),
          child: mountainDetailAsyncValue.when(
            data: (mountainDetail) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: CachedNetworkImage(
                          imageUrl: mountainDetail.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: double.infinity,
                            color: TextColors.grey200,
                          ),
                          errorWidget: (context, url, error) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/icon_danger.svg',
                                  height: 24.h,
                                  width: 24.w,
                                  color: TextColors.grey500),
                              SizedBox(height: 4.h),
                              TextComponent.bodySmall("Gagal memuat gambar")
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent.titleLarge(mountainDetail.name),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                                color: AppColors.warningColor.withOpacity(0.16),
                                borderRadius: BorderRadius.circular(100.w)),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/icon_star.svg',
                                ),
                                SizedBox(width: 4.w),
                                TextComponent.labelSmall(
                                  "3.5 (120)",
                                  fontSize: 13.sp,
                                  color: AppColors.warningColor,
                                )
                              ],
                            ))
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/location_icon.svg',
                            width: 16.w,
                            height: 16.h,
                            color: TextColors.grey500),
                        SizedBox(width: 8.w),
                        TextComponent.bodyMedium(
                          mountainDetail.location,
                          fontSize: 13.sp,
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/icon_flag.svg',
                            width: 16.w,
                            height: 16.h,
                            color: TextColors.grey500),
                        SizedBox(width: 8.w),
                        TextComponent.bodyMedium(
                          mountainDetail.elevation.toString(),
                          fontSize: 13.sp,
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Divider(
                      thickness: 1.h,
                      color: TextColors.grey200,
                    ),
                    SizedBox(height: 16.h),
                    TextComponent.titleMedium("Tentang Gunung"),
                    SizedBox(height: 8.h),
                    TextComponent.bodyMedium(
                      mountainDetail.description,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                      height: 1.5,
                    ),
                    SizedBox(height: 16.h),
                    Divider(
                      thickness: 1.h,
                      color: TextColors.grey200,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent.titleMedium("Paket Trip Tersedia"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextComponent.labelSmall("Semua",
                                color: AppColors.linkColor),
                            SizedBox(width: 2.w),
                            SvgPicture.asset(
                                'assets/icons/arrow_right_icon.svg',
                                color: AppColors.linkColor)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    tripsAsyncValue.when(
                      data: (trips) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: trips
                                .map((trip) => GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TripDetailsScreen(
                                                    tripId: trip.tripId),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 12.w),
                                        child: TripCard(
                                          title: trip.tripName,
                                          imageUrl: trip.imageUrl,
                                          duration: "${trip.duration} Hari",
                                          rating: trip.averageRating
                                              .toStringAsFixed(1),
                                          price: "Rp ${trip.price}",
                                          tripId: trip.tripId,
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        );
                      },
                      loading: () => CircularProgressIndicator(),
                      error: (error, _) => Text('Failed to load trips: $error'),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent.titleMedium("Sewa Alat"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextComponent.labelSmall("Semua",
                                color: AppColors.linkColor),
                            SizedBox(width: 2.w),
                            SvgPicture.asset(
                                'assets/icons/arrow_right_icon.svg',
                                color: AppColors.linkColor)
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
                    equipmentsAsyncValue.when(
                      data: (equipments) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: equipments.map((equipment) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EquipmentDetailsScreen(equipmentId: equipment.equipmentId),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: EquipmentRentalCard(
                                  title: equipment.equipmentName,
                                  imageUrl: equipment.imageUrl,
                                  price: "Rp ${equipment.pricePerDay}",
                                  rating: "4.5", // Dummy rating
                                  equipmentId: equipment.equipmentId,
                                ),
                              ),
                            )).toList(),
                          ),
                        );
                      },
                      loading: () => CircularProgressIndicator(),
                      error: (error, _) => Text('Failed to load equipments: $error'),
                    ),
                  ],
                ),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, _) => Text('Failed to load details: $error'),
          ),
        ),
      ),
    );
  }
}