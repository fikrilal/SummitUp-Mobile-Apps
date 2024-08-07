import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:summitup_mobile_apps/profile/favorite/presentation/components/trip_favourite_card.dart';

import '../../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../../_core/providers/user_providers.dart';
import '../../../../discover/presentation/pages/trip_details_screen.dart';
import '../providers/favourite_trips_provider.dart';


class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return userAsyncValue.when(
      data: (user) {
        final favouriteTripsAsyncValue = ref.watch(favouriteTripsProvider(user.id));

        return Scaffold(
          appBar: const CustomAppBar(
            title: "Promo Trip Tersedia",
            showBottomBorder: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: favouriteTripsAsyncValue.when(
                data: (favouriteTrips) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 16.h),
                      ...favouriteTrips.map((trip) {
                        final isFavourite = favouriteTrips.any((favTrip) => favTrip.tripId == trip.tripId);
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TripDetailsScreen(tripId: trip.tripId),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              TripFavouriteCard(
                                title: trip.tripName,
                                imageUrl: trip.imageUrl,
                                duration: "${trip.duration} Hari",
                                rating: "${trip.averageRating.toStringAsFixed(1)}",
                                quota: "10 Orang",
                                price: trip.price.toStringAsFixed(0),
                                tripId: trip.tripId,
                                isFavourite: isFavourite,
                                onTapBookmark: () async {
                                  if (isFavourite) {
                                    final favouriteTrip = favouriteTrips.firstWhere((favTrip) => favTrip.tripId == trip.tripId);
                                    await ref.read(deleteFavouriteTripProvider).call(favouriteTrip.favouriteId);
                                  } else {
                                    await ref.read(addFavouriteTripProvider).call(user.id, trip.tripId);
                                  }
                                  ref.refresh(favouriteTripsProvider(user.id)); // Refresh the list
                                },
                                isLoading: false,
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        );
                      }),
                    ],
                  );
                },
                loading: () => ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 16.h),
                    ...List.generate(
                      2,
                          (index) => Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: TripFavouriteCard.loading(),
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
      },
      loading: () => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}