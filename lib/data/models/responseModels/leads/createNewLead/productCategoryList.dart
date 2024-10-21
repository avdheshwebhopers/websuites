


class LeadProductCategoryList{
  final String id;
  final String name;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  LeadProductCategoryList({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create a ProductCategory from JSON
  factory LeadProductCategoryList.fromJson(Map<String, dynamic> json) {
    return LeadProductCategoryList(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Method to convert ProductCategory to JSON (if needed)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
