import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:summitup_mobile_apps/discover/presentation/pages/mountain_details_screen.dart';
import '../components/mountain_card.dart';
import '../providers/mountain_providers.dart';

class MountainListScreen extends ConsumerWidget {
  const MountainListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mountainListAsyncValue = ref.watch(mountainsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent.titleLarge("Semua List Gunung"),
                SizedBox(height: 2.h),
                TextComponent.bodySmall("List gunung terlengkap buat kamu"),
                mountainListAsyncValue.when(
                  data: (mountains) {
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      // Disable scrolling of the ListView
                      shrinkWrap: true,
                      // Allow ListView to occupy only the space it needs
                      itemCount: mountains.length,
                      itemBuilder: (context, index) {
                        final mountain = mountains[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MountainDetailsScreen(mountainId: mountain.id),
                              ),
                            );
                          },
                          child: MountainCard(
                            title: mountain.name,
                            imageUrl: mountain.imageUrl,
                            location: mountain.location,
                            elevation: "${mountain.elevation} mdpl",
                            rating:
                                "4.6 (120)", // Assume rating, modify as needed
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
