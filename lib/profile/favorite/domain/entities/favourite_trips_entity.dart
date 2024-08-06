class FavouriteTrip {
  final int favouriteId;
  final int tripId;
  final String tripName;
  final String description;
  final double price;
  final int duration;
  final String startDate;
  final String endDate;
  final String imageUrl;
  final double averageRating;

  FavouriteTrip({
    required this.favouriteId,
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

  factory FavouriteTrip.fromJson(Map<String, dynamic> json) {
    return FavouriteTrip(
      favouriteId: json['favourite_id'],
      tripId: json['trip_id'],
      tripName: json['trip_name'],
      description: json['description'],
      price: json['price'].toDouble(),
      duration: json['duration'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      imageUrl: json['image_url'],
      averageRating: json['average_rating'].toDouble(),
    );
  }
}
