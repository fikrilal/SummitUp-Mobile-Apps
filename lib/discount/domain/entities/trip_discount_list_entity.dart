class DiscountTrip {
  final int id;
  final int mountainId;
  final String tripName;
  final String description;
  final double price;
  final double discountPrice;
  final int duration;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final double averageRating;
  final int totalReviews;

  DiscountTrip({
    required this.id,
    required this.mountainId,
    required this.tripName,
    required this.description,
    required this.price,
    required this.discountPrice,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.averageRating,
    required this.totalReviews,
  });

  factory DiscountTrip.fromJson(Map<String, dynamic> json) {
    return DiscountTrip(
      id: json['id'],
      mountainId: json['mountain_id'],
      tripName: json['trip_name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(), // Cast to double
      discountPrice: (json['discount_price'] as num).toDouble(), // Cast to double
      duration: json['duration'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      imageUrl: json['image_url'],
      averageRating: (json['average_rating'] as num).toDouble(), // Cast to double
      totalReviews: json['total_reviews'],
    );
  }
}
