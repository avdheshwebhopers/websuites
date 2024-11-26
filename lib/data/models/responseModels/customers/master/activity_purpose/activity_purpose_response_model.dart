class CustomerMasterActivityPurposeResponseModel {
  String? id;
  String? type;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  CustomerMasterActivityPurposeResponseModel(
      {this.id,
        this.type,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  CustomerMasterActivityPurposeResponseModel.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }

  static List<CustomerMasterActivityPurposeResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerMasterActivityPurposeResponseModel.fromJson(json)).toList();
  }

}