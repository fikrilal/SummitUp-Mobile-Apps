import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';

class MountainListScreen extends StatefulWidget {
  const MountainListScreen({super.key});

  @override
  State<MountainListScreen> createState() => _MountainListScreenState();
}

class _MountainListScreenState extends State<MountainListScreen> {
  @override
  Widget build(BuildContext context) {
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
                TextComponent.bodySmall("List gunung s buat kamu"),
                Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9, // Atur rasio aspek sesuai kebutuhan Anda
                        child: CachedNetworkImage(
                          imageUrl: 'https://picsum.photos/2000',
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover, // Atur pemadanan objek ke area yang diberikan
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
