class CustomerTypeResponseModel {
  String? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Null>? children;

  CustomerTypeResponseModel(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.children});

  CustomerTypeResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['children'] != null) {
      children = <Null>[];
      json['children'].forEach((v) {
        children!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (children != null) {
      data['children'] = children!.map((v) => v).toList();
    }
    return data;
  }

  static List<CustomerTypeResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerTypeResponseModel.fromJson(json)).toList();
  }
}


