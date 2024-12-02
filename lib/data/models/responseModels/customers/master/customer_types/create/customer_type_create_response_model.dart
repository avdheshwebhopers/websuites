class CustomerTypeCreateResponseModel {
  String? name;
  Null parent;
  String? id;
  bool? status;
  String? createdAt;
  String? updatedAt;

  CustomerTypeCreateResponseModel(
      {this.name,
        this.parent,
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt});

  CustomerTypeCreateResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    parent = json['parent'];
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['parent'] = this.parent;
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}