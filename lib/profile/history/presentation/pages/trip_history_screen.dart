import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import '../components/trip_history_card.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart'; // Import colors

class TripHistoryScreen extends StatefulWidget {
  const TripHistoryScreen({super.key});

  @override
  State<TripHistoryScreen> createState() => _TripHistoryScreenState();
}

class _TripHistoryScreenState extends State<TripHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TextColors.grey50,
      appBar: const CustomAppBar(
        title: "Riwayat Trip",
        showBottomBorder: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TripHistoryCard(
                imageUrl: 'https://picsum.photos/200',
                title: "Trip Bromo Platinum Class",
                date: "24 Maret 2024",
                group: "10 Orang",
                price: "Rp249.000",
                onTap: () {
                  // Handle button tap
                },
              ),
              SizedBox(height: 8.h),
              TripHistoryCard(
                imageUrl: 'https://picsum.photos/200',
                title: "Trip Bromo Platinum Class",
                date: "24 Maret 2024",
                group: "10 Orang",
                price: "Rp249.000",
                onTap: () {
                  // Handle button tap
                },
              ),
              SizedBox(height: 8.h),
              TripHistoryCard(
                imageUrl: 'https://picsum.photos/200',
                title: "Trip Bromo Platinum Class",
                date: "24 Maret 2024",
                group: "10 Orang",
                price: "Rp249.000",
                onTap: () {
                  // Handle button tap
                },
              ),
              SizedBox(height: 8.h),
              TripHistoryCard(
                imageUrl: 'https://picsum.photos/200',
                title: "Trip Bromo Platinum Class",
                date: "24 Maret 2024",
                group: "10 Orang",
                price: "Rp249.000",
                onTap: () {
                  // Handle button tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
