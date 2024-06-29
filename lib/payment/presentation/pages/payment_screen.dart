import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/image/cached_image_component.dart';

import '../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';
import '../components/dotted_divider.dart';
import '../components/payment_overview_card.dart';
import '../components/trip_overview_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBack: () => Navigator.of(context).pop(),
        title: "Detail Pembayaran",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 86.w,
                      child: CachedImageComponent(
                        imageUrl: 'https://picsum.photos/200',
                        aspectRatio: 1,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        children: [
                          TextComponent.titleLarge(
                            "Trip Bromo Platinum Class Lorem Ipsum",
                            maxLines: 2,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/location_icon.svg',
                                  width: 16.w,
                                  height: 16.h,
                                  color: AppColors.linkColor),
                              SizedBox(width: 8.w),
                              TextComponent.bodyMedium("10 Orang")
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24.h),
                TextComponent.titleMedium("Ringkasan Trip"),
                SizedBox(height: 10.h),
                TripOverviewCard(
                  tanggal: "Senin, 20 Mei • 14:00 - 14:30 WIB",
                  lokasiTitikKumpul: "Basecamp Bromo Malang",
                ),
                SizedBox(height: 24.h),
                TextComponent.titleMedium("Ringkasan Pembayaran"),
                SizedBox(height: 10.h),
                PaymentOverviewCard(
                  biayaTrip: "Rp450.000",
                  diskon: "Rp50.000",
                  ppn: "Rp10.000",
                  totalPembayaran: "Rp410.000",
                ),
                SizedBox(height: 24.h),
                ButtonComponent(
                  text: "Bayar Sekarang",
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
