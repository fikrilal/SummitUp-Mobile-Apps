class Booking {
  final int bookingId;
  final String userId;
  final String tripId;
  final DateTime createdAt;
  final DateTime expiredAt;
  final String bookingStatus;

  Booking({
    required this.bookingId,
    required this.userId,
    required this.tripId,
    required this.createdAt,
    required this.expiredAt,
    required this.bookingStatus,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      bookingId: json['booking_id'],
      userId: json['user_id'],
      tripId: json['trip_id'],
      createdAt: DateTime.parse(json['created_at']),
      expiredAt: DateTime.parse(json['expired_at']),
      bookingStatus: json['booking_status'],
    );
  }
}
