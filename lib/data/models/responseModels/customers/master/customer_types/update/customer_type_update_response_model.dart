class CustomerTypeUpdateResponseModel {
  String? id;
  bool? status;
  String? name;
  String? updatedAt;

  CustomerTypeUpdateResponseModel(
      {this.id, this.status, this.name, this.updatedAt});

  CustomerTypeUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}