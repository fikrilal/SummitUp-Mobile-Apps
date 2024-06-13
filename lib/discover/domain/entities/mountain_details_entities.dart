class MountainDetail {
  final int id;
  final String name;
  final String location;
  final int elevation;
  final String description;
  final String imageUrl;

  MountainDetail({
    required this.id,
    required this.name,
    required this.location,
    required this.elevation,
    required this.description,
    required this.imageUrl,
  });

  factory MountainDetail.fromJson(Map<String, dynamic> json) {
    return MountainDetail(
      id: json['id'],
      name: json['mountain_name'],
      location: json['location'],
      elevation: json['elevation'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}