import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/discount/presentation/components/trip_discount_card.dart';
import '../providers/trip_discount_list_providers.dart';

class DiscountScreen extends ConsumerWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final discountTripsAsyncValue = ref.watch(discountTripsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: "Promo Trip Tersedia",
        showBottomBorder: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: discountTripsAsyncValue.when(
            data: (discountTrips) {
              return ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 16.h),
                  ...discountTrips
                      .map((trip) => Column(
                            children: [
                              TripDiscountCard(
                                title: trip.tripName,
                                imageUrl: trip.imageUrl,
                                duration: "${trip.duration} Hari",
                                rating: trip.averageRating.toStringAsFixed(1),
                                quota: "10 Orang",
                                // This is a placeholder
                                price: trip.price.toStringAsFixed(0),
                                discountPrice:
                                    trip.discountPrice.toStringAsFixed(0),
                                tripId: trip.id,
                                isLoading: false,
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ))
                      .toList(),
                ],
              );
            },
            loading: () => ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                // Tambahkan komponen lain di sini
                Container(
                  padding: EdgeInsets.all(16.w),
                  color: Colors.blue,
                  child: Text(
                    'Komponen Tambahan',
                    style: TextStyle(color: Colors.white, fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 16.h),
                ...List.generate(
                  2,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: TripDiscountCard.loading(),
                  ),
                ),
              ],
            ),
            error: (error, stack) => Center(
              child: Text('Error: $error'),
            ),
          ),
        ),
      ),
    );
  }
}
