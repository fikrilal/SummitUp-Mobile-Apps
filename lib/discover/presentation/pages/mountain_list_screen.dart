import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/fields/searchfields/searchfield_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/mountain_details_screen.dart';
import '../components/explore_card.dart';
import '../components/mountain_card.dart';
import '../providers/mountain_providers.dart';
import 'package:summitup_mobile_apps/discover/data/constants/island_list_cons.dart';

class MountainListScreen extends ConsumerWidget {
  const MountainListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mountainListAsyncValue = ref.watch(mountainsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),
                const SearchField(
                  hintText: "Cari gunung..",
                ),
                SizedBox(height: 24.h),
                TextComponent.headlineSmall("Berdasarkan pulau"),
                SizedBox(height: 2.h),
                TextComponent.bodySmall(
                    "Yuk coba jelajahi gunung disetiap pulau"),
                SizedBox(height: 16.h),
                SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exploreCardsData.length,
                    itemBuilder: (context, index) {
                      final cardData = exploreCardsData[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: ExploreCard(
                          title: cardData['title']!,
                          imagePath: cardData['imagePath']!,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
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
          ),
        ),
      ),
    );
  }
}
