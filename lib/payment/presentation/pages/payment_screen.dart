import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/image/cached_image_component.dart';

import '../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';
import '../../../discover/domain/entities/trip_details_entity.dart';
import '../../../discover/presentation/providers/trip_detail_providers.dart';
import '../components/payment_overview_card.dart';
import '../components/trip_overview_card.dart';
import '../providers/token_providers.dart';
import '../../../main.dart'; // Import main.dart to access midtransProvider

class PaymentScreen extends ConsumerStatefulWidget {
  final int tripId;

  const PaymentScreen({super.key, required this.tripId});

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final tripDetailAsyncValue = ref.watch(tripDetailProvider(widget.tripId));

    return Scaffold(
      appBar: CustomAppBar(
        onBack: () => Navigator.of(context).pop(),
        title: "Detail Pembayaran",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: tripDetailAsyncValue.when(
            data: (tripDetails) => _buildContent(tripDetails),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(TripDetailsEntity tripDetails) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final biayaTrip = tripDetails.price;
    final diskon = tripDetails.discountPrice != null
        ? tripDetails.price - tripDetails.discountPrice!
        : 0;
    final totalPembayaran = tripDetails.discountPrice ?? tripDetails.price;

    final formattedBiayaTrip = currencyFormatter.format(biayaTrip);
    final formattedDiskon = currencyFormatter.format(diskon);
    final formattedTotalPembayaran = currencyFormatter.format(totalPembayaran);

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
                  imageUrl: tripDetails.imageUrl,
                  aspectRatio: 1,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent.titleLarge(
                      tripDetails.tripName,
                      maxLines: 2,
                      height: 1.2,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/group_bold_icon.svg',
                            width: 16.w,
                            height: 16.h,
                            color: AppColors.linkColor),
                        SizedBox(width: 8.w),
                        TextComponent.bodySmall(
                            "${tripDetails.totalReviews} Orang")
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
            tanggal: "${tripDetails.startDate} sampai ${tripDetails.endDate}",
            lokasiTitikKumpul: tripDetails.gatheringPoint,
          ),
          SizedBox(height: 24.h),
          TextComponent.titleMedium("Ringkasan Pembayaran"),
          SizedBox(height: 10.h),
          PaymentOverviewCard(
            biayaTrip: formattedBiayaTrip,
            diskon: formattedDiskon,
            ppn: "Rp 0",
            totalPembayaran: formattedTotalPembayaran,
          ),
          SizedBox(height: 24.h),
          ButtonComponent(
            text: "Bayar Sekarang",
            onPressed: () async {
              print("Button 'Bayar Sekarang' pressed");
              final tokenService = ref.read(tokenServiceProvider);
              final result = await tokenService.getToken(
                productName: tripDetails.tripName,
                price: totalPembayaran,
                quantity: 1,
              );

              result.fold(
                (failure) {
                  print("Failed to get token: ${failure.message}");
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: Text(failure.message),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                (token) {
                  print("Token received: ${token.token}");
                  final midtrans = ref.read(midtransProvider);
                  if (midtrans != null) {
                    print("Starting Midtrans payment flow");
                    midtrans.startPaymentUiFlow(
                      token: token.token,
                    );
                  } else {
                    print("Midtrans is not initialized");
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
