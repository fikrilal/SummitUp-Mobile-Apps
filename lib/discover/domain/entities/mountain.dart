class Mountain {
  final String id;
  final String name;
  final String location;
  final String elevation;
  final String description;
  final String imageUrl;

  Mountain({
    required this.id,
    required this.name,
    required this.location,
    required this.elevation,
    required this.description,
    required this.imageUrl,
  });

  factory Mountain.fromJson(Map<String, dynamic> json) {
    return Mountain(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      elevation: json['elevation'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}
