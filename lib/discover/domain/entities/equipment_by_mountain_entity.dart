class Equipment {
  final int equipmentId;
  final String equipmentName;
  final String description;
  final int pricePerDay;
  final int mountainId;
  final int categoryId;

  Equipment({
    required this.equipmentId,
    required this.equipmentName,
    required this.description,
    required this.pricePerDay,
    required this.mountainId,
    required this.categoryId,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      equipmentId: json['equipment_id'],
      equipmentName: json['equipment_name'],
      description: json['description'],
      pricePerDay: json['price_per_day'],
      mountainId: json['mountain_id'],
      categoryId: json['category_id'],
    );
  }
}
