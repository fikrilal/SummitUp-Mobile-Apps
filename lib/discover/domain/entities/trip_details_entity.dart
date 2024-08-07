class TripDetailsEntity {
  final int tripId;
  final String tripName;
  final String description;
  final int price;
  final int? discountPrice;
  final int duration;
  final String startDate;
  final String endDate;
  final String gatheringPoint;
  final String imageUrl;
  final double averageRating;
  final int totalReviews;
  final List<String> facilities;

  TripDetailsEntity({
    required this.tripId,
    required this.tripName,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.gatheringPoint,
    required this.imageUrl,
    required this.averageRating,
    required this.totalReviews,
    required this.facilities,
  });

  factory TripDetailsEntity.fromJson(Map<String, dynamic> json) {
    return TripDetailsEntity(
      tripId: json['trip_id'] as int,
      tripName: json['trip_name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      discountPrice: json['discount_price'] as int?,
      duration: json['duration'] as int,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      gatheringPoint: json['gathering_point'] as String,
      imageUrl: json['image_url'] as String,
      averageRating: (json['average_rating'] as num).toDouble(),
      totalReviews: json['total_reviews'] as int,
      facilities: List<String>.from(json['facilities'] ?? []),
    );
  }
}