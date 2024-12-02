class ColumnUpdateRequestModel {
  final List<String> leadFieldManagementIds;

  ColumnUpdateRequestModel({required this.leadFieldManagementIds});

  // Convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'leadFieldManagementIds': leadFieldManagementIds,
    };
  }

  // Create an object from a JSON map (optional if you need deserialization)
  factory ColumnUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    return ColumnUpdateRequestModel(
      leadFieldManagementIds: List<String>.from(json['leadFieldManagementIds']),
    );
  }
}
