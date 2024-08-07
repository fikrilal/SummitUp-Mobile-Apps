class Transaction {
  final int transactionId;
  final String midtransId;
  final int bookingId;
  final int transactionUserId;
  final double amount;
  final String paymentMethod;
  final String transactionStatus;
  final DateTime transactionCreatedAt;
  final DateTime transactionExpiredAt;
  final int tripId;
  final int mountainId;
  final String tripName;
  final String description;
  final double price;
  final double discountPrice;
  final int duration;
  final DateTime startDate;
  final DateTime endDate;
  final String gatheringPoint;
  final String imageUrl;
  final double averageRating;
  final int totalReviews;
  final String mountainName;

  Transaction({
    required this.transactionId,
    required this.midtransId,
    required this.bookingId,
    required this.transactionUserId,
    required this.amount,
    required this.paymentMethod,
    required this.transactionStatus,
    required this.transactionCreatedAt,
    required this.transactionExpiredAt,
    required this.tripId,
    required this.mountainId,
    required this.tripName,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.gatheringPoint,
    required this.imageUrl,
    required this.averageRating,
    required this.totalReviews,
    required this.mountainName,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      transactionId: json['transaction_id'],
      midtransId: json['midtrans_id'] ?? '',
      bookingId: json['booking_id'],
      transactionUserId: json['transaction_user_id'],
      amount: json['amount'] != null ? double.parse(json['amount']) : 0.0,
      paymentMethod: json['payment_method'] ?? '',
      transactionStatus: json['transaction_status'] ?? '',
      transactionCreatedAt: DateTime.parse(json['transaction_created_at']),
      transactionExpiredAt: DateTime.parse(json['transaction_expired_at']),
      tripId: json['trip_id'],
      mountainId: json['mountain_id'],
      tripName: json['trip_name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] != null ? double.parse(json['price']) : 0.0,
      discountPrice: json['discount_price'] != null ? double.parse(json['discount_price']) : 0.0,
      duration: json['duration'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      gatheringPoint: json['gathering_point'] ?? '',
      imageUrl: json['image_url'] ?? '',
      averageRating: json['average_rating'] != null ? (json['average_rating'] as num).toDouble() : 0.0,
      totalReviews: json['total_reviews'],
      mountainName: json['mountain_name'] ?? '',
    );
  }
}
