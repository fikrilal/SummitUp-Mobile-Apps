import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/dashboard/presentation/components/quick_access_card.dart';
import 'package:summitup_mobile_apps/discover/presentation/components/mountain_card.dart';
import 'package:summitup_mobile_apps/discover/presentation/components/trip_card.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/mountain_details_screen.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/trip_details_screen.dart';
import 'package:summitup_mobile_apps/discover/presentation/providers/mountain_list_providers.dart';
import 'package:summitup_mobile_apps/discover/presentation/providers/trip_by_mountain_providers.dart';

import '../../../_core/providers/user_providers.dart';

class HomepageScreen extends ConsumerWidget {
  HomepageScreen({super.key});

  final List<String> imgList = [
    'https://picsum.photos/2000',
    'https://picsum.photos/2001',
    'https://picsum.photos/2002',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int mountainId;
    final mountainListAsyncValue = ref.watch(mountainsProvider);
    final tripsAsyncValue = ref.watch(tripsProvider(mountainId = 1));
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userAsyncValue.when(
                data: (user) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24.w,
                          backgroundImage: NetworkImage(user.profileImageUrl),
                          backgroundColor: Colors.transparent,
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextComponent.titleMedium(user.fullname),
                            TextComponent.bodySmall(
                                "Mau pergi kemana hari ini?")
                          ],
                        ),
                      ],
                    ),
                  );
                },
                loading: () => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24.w,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100.w,
                            height: 20.h,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 200.w,
                            height: 20.h,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                error: (error, stack) => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 24.w,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextComponent.titleMedium("Error"),
                          TextComponent.bodySmall("Failed to load user data")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 21 / 9,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  initialPage: 2,
                  autoPlayInterval: const Duration(seconds: 4),
                ),
                items: imgList
                    .map((item) => ClipRRect(
                          borderRadius: BorderRadius.circular(8.w),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ))
                    .toList(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 4.h, left: 16.w, right: 16.w),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: QuickAccessCard(
                      iconPath:
                          'assets/icons/access_icons/q_open_trip_icon.svg',
                      label: 'Open Trip',
                      onTap: () {
                        // Handle Open Trip Tap
                      },
                    )),
                    SizedBox(width: 6.w),
                    Expanded(
                        child: QuickAccessCard(
                      iconPath: 'assets/icons/access_icons/q_event_icon.svg',
                      label: 'Event',
                      onTap: () {
                        // Handle Event Tap
                      },
                    )),
                    SizedBox(width: 6.w),
                    Expanded(
                        child: QuickAccessCard(
                      iconPath: 'assets/icons/access_icons/q_porter_icon.svg',
                      label: 'Porter',
                      onTap: () {
                        // Handle Porter Tap
                      },
                    )),
                    SizedBox(width: 6.w),
                    Expanded(
                        child: QuickAccessCard(
                      iconPath:
                          'assets/icons/access_icons/q_sewa_alat_icon.svg',
                      label: 'Sewa Alat',
                      onTap: () {
                        // Handle Sewa Alat Tap
                      },
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 4.h, bottom: 16.h, left: 16.w, right: 16.w),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: QuickAccessCard(
                      iconPath: 'assets/icons/access_icons/q_tiket_icon.svg',
                      label: 'Tiket',
                      onTap: () {
                        // Handle Open Trip Tap
                      },
                    )),
                    SizedBox(width: 6.w),
                    Expanded(
                        child: QuickAccessCard(
                      iconPath: 'assets/icons/access_icons/q_homestay_icon.svg',
                      label: 'Homestay',
                      onTap: () {
                        // Handle Event Tap
                      },
                    )),
                    SizedBox(width: 6.w),
                    Expanded(
                        child: QuickAccessCard(
                      iconPath: 'assets/icons/access_icons/q_ojek_icon.svg',
                      label: 'Ojek',
                      onTap: () {
                        // Handle Porter Tap
                      },
                    )),
                    SizedBox(width: 6.w),
                    Expanded(
                        child: QuickAccessCard(
                      iconPath:
                          'assets/icons/access_icons/q_camp_ground_icon.svg',
                      label: 'Camp Ground',
                      onTap: () {
                        // Handle Sewa Alat Tap
                      },
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent.titleLarge("Rekomendasi Trip"),
                    SizedBox(height: 2.h),
                    TextComponent.bodySmall(
                        "Trip asik yang paling sering dibooking"),
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent.titleLarge("Semua List Gunung"),
                    SizedBox(height: 2.h),
                    TextComponent.bodySmall("List gunung terlengkap buat kamu"),
                    SizedBox(height: 16.h),
                    mountainListAsyncValue.when(
                      data: (mountains) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: mountains.length,
                          itemBuilder: (context, index) {
                            final mountain = mountains[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => MountainDetailsScreen(
                                        mountainId: mountain.id),
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  MountainCard(
                                    title: mountain.name,
                                    imageUrl: mountain.imageUrl,
                                    location: mountain.location,
                                    elevation: "${mountain.elevation} mdpl",
                                    rating:
                                        "4.6 (120)", // Assume rating, modify as needed
                                  ),
                                  SizedBox(height: 10.h),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stack) => Text('Error: $error'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
