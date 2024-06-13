class Trip {
  final int tripId;
  final String tripName;
  final String description;
  final int price;
  final int duration;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final double averageRating;

  Trip({
    required this.tripId,
    required this.tripName,
    required this.description,
    required this.price,
    required this.duration,
    required this.startDate,
    required this.endDate,
    required this.imageUrl,
    required this.averageRating,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      tripId: json['trip_id'],
      tripName: json['trip_name'],
      description: json['description'],
      price: json['price'],
      duration: json['duration'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      imageUrl: json['image_url'],
      averageRating: (json['average_rating'] as num).toDouble(),
    );
  }
}