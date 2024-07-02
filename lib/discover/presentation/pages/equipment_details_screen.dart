import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/image/cached_image_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/texts/component_text.dart';
import 'package:intl/intl.dart';

import '../../../_core/presentation/constants/colors.dart';
import '../providers/equipment_details_providers.dart';

class EquipmentDetailsScreen extends ConsumerWidget {
  final int equipmentId;

  const EquipmentDetailsScreen({super.key, required this.equipmentId});

  String formatRupiah(int value) {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipmentDetailAsyncValue = ref.watch(equipmentDetailProvider(equipmentId));

    return Scaffold(
      appBar: const CustomAppBar(title: "Detail Peralatan"),
      body: SafeArea(
        child: equipmentDetailAsyncValue.when(
          data: (equipmentDetail) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedImageComponent(
                    imageUrl: equipmentDetail.imageUrl,
                    borderRadius: 0,
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextComponent.titleLarge(equipmentDetail.equipmentName, fontWeight: FontWeight.w600),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: BrandColors.brandPrimary100,
                              borderRadius: BorderRadius.circular(100.w)),
                          child: TextComponent.bodySmall(
                            equipmentDetail.categoryName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                            color: BrandColors.brandPrimary500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextComponent.titleMedium(formatRupiah(equipmentDetail.pricePerDay), color: BrandColors.brandPrimary500),
                            TextComponent.bodySmall("/hari")
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Divider(
                          thickness: 1.h,
                          color: TextColors.grey200,
                        ),
                        SizedBox(height: 16.h),
                        TextComponent.titleMedium("Tentang Alat", fontWeight: FontWeight.w600),
                        SizedBox(height: 8.h),
                        TextComponent.bodyMedium(
                          equipmentDetail.description,
                          softWrap: true,
                          overflow: TextOverflow.clip,
                          height: 1.5,
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => Center(child: Text('Failed to load equipment details: $error')),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: ButtonComponent(
          text: "Pilih Tanggal Sewa",
          onPressed: () {},
        ),
      ),
    );
  }
}
