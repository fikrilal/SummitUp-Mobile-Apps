import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../../_core/presentation/components/image/cached_image_component.dart';
import '../../../../_core/presentation/components/texts/component_text.dart';
import '../../../../_core/presentation/constants/colors.dart';
import '../../../../payment/presentation/components/payment_overview_card.dart';
import '../../../../payment/presentation/components/trip_overview_card.dart';
import '../providers/transaction_history_providers.dart';

class TransactionDetails extends ConsumerWidget {
  final int transactionId;

  const TransactionDetails({super.key, required this.transactionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionDetailsAsyncValue = ref.watch(transactionDetailsProvider(transactionId));

    return Scaffold(
      appBar: CustomAppBar(
        onBack: () => Navigator.of(context).pop(),
        title: "Detail Transaksi",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: transactionDetailsAsyncValue.when(
            data: (transaction) {
              String formattedStartDate =
                  DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(transaction.startDate);
              String formattedEndDate = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(transaction.endDate);

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 86.w,
                          child: CachedImageComponent(
                            imageUrl: transaction.imageUrl,
                            aspectRatio: 1,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextComponent.titleLarge(
                                transaction.tripName,
                                maxLines: 2,
                                height: 1.2,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/group_bold_icon.svg',
                                    width: 16.w,
                                    height: 16.h,
                                    color: AppColors.linkColor,
                                  ),
                                  SizedBox(width: 8.w),
                                  TextComponent.bodySmall("${transaction.totalReviews} Orang"),
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
                      tanggal: "$formattedStartDate sampai $formattedEndDate",
                      lokasiTitikKumpul: transaction.gatheringPoint,
                    ),
                    SizedBox(height: 24.h),
                    TextComponent.titleMedium("Ringkasan Pembayaran"),
                    SizedBox(height: 10.h),
                    PaymentOverviewCard(
                      biayaTrip: "Rp${transaction.price.toStringAsFixed(0)}",
                      diskon: "Rp${transaction.discountPrice.toStringAsFixed(0)}",
                      ppn: "Rp 0",
                      totalPembayaran: "Rp${transaction.amount.toStringAsFixed(0)}",
                    ),
                  ],
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        ),
      ),
    );
  }
}
