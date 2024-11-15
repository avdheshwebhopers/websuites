class OrderMasterResponseModel {
  final String id;
  final String name;
  final String? color; // Color can be null
  final bool isDefault; // Renamed from 'default' to avoid conflict with Dart keyword
  final String createdAt;
  final String updatedAt;

  OrderMasterResponseModel({
    required this.id,
    required this.name,
    this.color,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory method to parse the JSON response
  factory OrderMasterResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderMasterResponseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      color: json['color'] as String?,
      isDefault: json['default'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}
