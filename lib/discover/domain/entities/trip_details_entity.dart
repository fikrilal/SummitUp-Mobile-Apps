class TripDetailsEntity {
  final int tripId;
  final String tripName;
  final String description;
  final int price;
  final int duration;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final double averageRating;
  final List<String> facilities;

  TripDetailsEntity({
    required this.tripId,
    required this.tripName,
    required this.description,
    required this.price,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.averageRating,
    required this.facilities,
  });

  factory TripDetailsEntity.fromJson(Map<String, dynamic> json) {
    return TripDetailsEntity(
      tripId: json['trip_id'] as int,
      tripName: json['trip_name'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      duration: json['duration'] as int,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      imageUrl: json['image_url'] as String,
      averageRating: (json['average_rating'] as num).toDouble(),
      facilities: List<String>.from(json['facilities'] as List<dynamic>),
    );
  }
}
