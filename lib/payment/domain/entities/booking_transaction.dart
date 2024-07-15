class BookingTransaction {
  final int id;
  final String? midtransId; // Change to nullable
  final int bookingId;
  final int userId;
  final double amount;
  final String? paymentMethod; // Change to nullable
  final String transactionStatus;
  final DateTime createdAt;
  final DateTime? expiredAt; // Change to nullable

  BookingTransaction({
    required this.id,
    this.midtransId, // Nullable
    required this.bookingId,
    required this.userId,
    required this.amount,
    this.paymentMethod, // Nullable
    required this.transactionStatus,
    required this.createdAt,
    this.expiredAt, // Nullable
  });

  factory BookingTransaction.fromJson(Map<String, dynamic> json) {
    return BookingTransaction(
      id: json['id'],
      midtransId: json['midtrans_id'],
      bookingId: json['booking_id'],
      userId: json['user_id'],
      amount: json['amount'] is String ? double.tryParse(json['amount']) ?? 0.0 : json['amount'].toDouble(),
      paymentMethod: json['payment_method'],
      transactionStatus: json['transaction_status'],
      createdAt: DateTime.parse(json['created_at']),
      expiredAt: json['expired_at'] != null ? DateTime.parse(json['expired_at']) : null,
    );
  }
}
