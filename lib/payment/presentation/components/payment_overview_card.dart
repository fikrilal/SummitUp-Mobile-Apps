import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';
import 'dotted_divider.dart';

class PaymentOverviewCard extends StatelessWidget {
  final String biayaTrip;
  final String diskon;
  final String ppn;
  final String totalPembayaran;

  const PaymentOverviewCard({
    Key? key,
    required this.biayaTrip,
    required this.diskon,
    required this.ppn,
    required this.totalPembayaran,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: TextColors.grey300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent.bodyMedium("Biaya Trip"),
              TextComponent.bodyMedium(
                biayaTrip,
                fontWeight: FontWeight.w600,
                color: TextColors.grey700,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              thickness: 1.h,
              color: TextColors.grey200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent.bodyMedium("Diskon"),
              TextComponent.bodyMedium(
                diskon,
                fontWeight: FontWeight.w600,
                color: TextColors.grey700,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Divider(
              thickness: 1.h,
              color: TextColors.grey200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent.bodyMedium("PPN"),
              TextComponent.bodyMedium(
                ppn,
                fontWeight: FontWeight.w600,
                color: TextColors.grey700,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: DottedDivider(
              thickness: 1.h,
              color: TextColors.grey200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent.bodyMedium(
                "Total Pembayaran",
                fontWeight: FontWeight.w500,
                color: TextColors.grey600,
              ),
              TextComponent.bodyMedium(
                totalPembayaran,
                fontWeight: FontWeight.w600,
                color: TextColors.grey700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}