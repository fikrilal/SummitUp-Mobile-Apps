import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/buttons/button_component.dart';
import '../../../_core/presentation/components/appbar/appbar_component.dart';
import '../../../_core/presentation/components/texts/component_text.dart';
import '../../../_core/presentation/constants/colors.dart';
import '../../../_core/providers/user_providers.dart';
import '../../../payment/presentation/pages/payment_screen.dart';
import '../../../payment/presentation/providers/create_booking_providers.dart';
import '../../domain/entities/trip_details_entity.dart';
import '../providers/trip_detail_providers.dart';

class TripDetailsScreen extends ConsumerStatefulWidget {
  final int tripId;

  const TripDetailsScreen({super.key, required this.tripId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TripDetailsScreenState();
}

class _TripDetailsScreenState extends ConsumerState<TripDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final tripDetailAsyncValue = ref.watch(tripDetailProvider(widget.tripId));
    final userAsyncValue = ref.watch(userProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Detail Trip",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: tripDetailAsyncValue.when(
            data: (tripDetails) => _buildContent(tripDetails, userAsyncValue),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(TripDetailsEntity tripDetails, AsyncValue<User> userAsyncValue) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    final formattedPrice = currencyFormatter.format(tripDetails.price);
    final formattedRating = tripDetails.averageRating.toStringAsFixed(1);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: AspectRatio(
              aspectRatio: 16 / 10,
              child: CachedNetworkImage(
                imageUrl: tripDetails.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: double.infinity,
                  color: TextColors.grey200,
                ),
                errorWidget: (context, url, error) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/icon_danger.svg',
                        height: 24.h, width: 24.w, color: TextColors.grey500),
                    SizedBox(height: 4.h),
                    TextComponent.bodySmall("Gagal memuat gambar")
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          TextComponent.titleLarge(tripDetails.tripName,
              fontWeight: FontWeight.w600),
          SizedBox(height: 10.h),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/calendar_bold_icon.svg',
                width: 16.w,
                height: 16.h,
                color: AppColors.successColor,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodySmall("${tripDetails.duration} Hari"),
              SizedBox(width: 12.w),
              Container(
                height: 12.h,
                width: 1.w,
                color: TextColors.grey200,
              ),
              SizedBox(width: 12.w),
              SvgPicture.asset(
                'assets/icons/group_bold_icon.svg',
                width: 16.w,
                height: 16.h,
                color: AppColors.linkColor,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodySmall("10 orang"),
              SizedBox(width: 12.w),
              Container(
                height: 12.h,
                width: 1.w,
                color: TextColors.grey200,
              ),
              SizedBox(width: 12.w),
              SvgPicture.asset(
                'assets/icons/icon_star.svg',
                width: 16.w,
                height: 16.h,
                color: AppColors.warningColor,
              ),
              SizedBox(width: 8.w),
              TextComponent.bodySmall(
                  "$formattedRating (${tripDetails.totalReviews})"),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextComponent.titleMedium(formattedPrice,
                  color: BrandColors.brandPrimary500),
              TextComponent.bodySmall("/orang")
            ],
          ),
          SizedBox(height: 16.h),
          Divider(
            thickness: 1.h,
            color: TextColors.grey200,
          ),
          SizedBox(height: 16.h),
          TextComponent.titleMedium("Fasilitas Tersedia"),
          SizedBox(height: 10.h),
          _buildFacilitiesList(tripDetails.facilities),
          SizedBox(height: 16.h),
          Divider(
            thickness: 1.h,
            color: TextColors.grey200,
          ),
          SizedBox(height: 16.h),
          TextComponent.titleMedium("Tentang Trip"),
          SizedBox(height: 10.h),
          TextComponent.bodyMedium(
            tripDetails.description,
            softWrap: true,
            overflow: TextOverflow.clip,
            height: 1.5,
          ),
          SizedBox(height: 40.h),
          ButtonComponent(
            text: "Booking Sekarang",
            onPressed: () async {
              if (userAsyncValue is AsyncData<User>) {
                final user = userAsyncValue.value;
                final createBookingNotifier = ref.read(createBookingProvider.notifier);
                final expiredAt = DateTime.now().add(const Duration(hours: 1)).toString();

                final bookingData = {
                  'user_id': user.id.toString(),
                  'trip_id': tripDetails.tripId.toString(),
                  'expired_at': expiredAt,
                };

                final bookingId = await createBookingNotifier.createBooking(bookingData, context);

                if (bookingId != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentScreen(
                        tripId: widget.tripId,
                        bookingId: bookingId,
                      ),
                    ),
                  );
                } else {
                  _showErrorMessage(context, "Failed to create booking.");
                }
              } else {
                _showErrorMessage(context, "User data not loaded.");
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFacilitiesList(List<String> facilities) {
    if (facilities.isEmpty) {
      return TextComponent.bodyMedium("Trip ini tidak menyediakan fasilitas");
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: facilities
          .map((facility) => Padding(
        padding: EdgeInsets.only(bottom: 8.w),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/shield_icon.svg',
              width: 20.w,
              height: 20.h,
            ),
            SizedBox(width: 8.w),
            TextComponent.bodyMedium(facility)
          ],
        ),
      ))
          .toList(),
    );
  }

  void _showErrorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
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
  }
}

