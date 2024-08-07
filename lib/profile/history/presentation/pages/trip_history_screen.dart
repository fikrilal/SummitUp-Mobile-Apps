import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:summitup_mobile_apps/_core/presentation/components/appbar/appbar_component.dart';
import '../../../../_core/providers/user_providers.dart';
import '../components/trip_history_card.dart';
import 'package:summitup_mobile_apps/_core/presentation/constants/colors.dart';
import '../providers/transaction_history_providers.dart';

class TripHistoryScreen extends ConsumerWidget {
  const TripHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userProvider);

    return userAsyncValue.when(
      data: (user) {
        final transactionHistoryAsyncValue = ref.watch(transactionHistoryProvider(user.id));

        return Scaffold(
          backgroundColor: TextColors.grey50,
          appBar: const CustomAppBar(
            title: "Riwayat Trip",
            showBottomBorder: true,
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: transactionHistoryAsyncValue.when(
              data: (transactions) {
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = transactions[index];
                    return Column(
                      children: [
                        TripHistoryCard(
                          imageUrl: transaction.imageUrl,
                          title: transaction.tripName,
                          date: formatTransactionDate(transaction.transactionCreatedAt.toString()),
                          group: "${transaction.totalReviews} Orang",
                          price: "Rp${transaction.amount.toStringAsFixed(0)}",
                          onTap: () {
                            // Handle button tap, e.g., navigate to trip detail
                          },
                        ),
                        SizedBox(height: 8.h),
                      ],
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }
}

String formatTransactionDate(String dateStr) {
  DateTime date = DateTime.parse(dateStr);
  final DateFormat formatter = DateFormat('EEEE, dd MMMM - HH:mm', 'id_ID');
  return formatter.format(date);
}
