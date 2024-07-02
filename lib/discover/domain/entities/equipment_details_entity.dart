class EquipmentDetail {
  final int equipmentId;
  final String equipmentName;
  final String description;
  final int pricePerDay;
  final int mountainId;
  final int categoryId;
  final String categoryName;
  final String imageUrl;

  EquipmentDetail({
    required this.equipmentId,
    required this.equipmentName,
    required this.description,
    required this.pricePerDay,
    required this.mountainId,
    required this.categoryId,
    required this.categoryName,
    required this.imageUrl,
  });

  factory EquipmentDetail.fromJson(Map<String, dynamic> json) {
    return EquipmentDetail(
      equipmentId: json['equipment_id'] as int,
      equipmentName: json['equipment_name'] as String,
      description: json['description'] as String,
      pricePerDay: json['price_per_day'] as int,
      mountainId: json['mountain_id'] as int,
      categoryId: json['category_id'] as int,
      categoryName: json['category_name'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}
