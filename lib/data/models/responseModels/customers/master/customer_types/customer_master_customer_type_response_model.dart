
class CustomerMasterCustomerTypeResponseModel {
  String? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  List<Null>? children;

  CustomerMasterCustomerTypeResponseModel({this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.children});

  CustomerMasterCustomerTypeResponseModel.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => ()).toList();
    }
    return data;
  }
  static List<CustomerMasterCustomerTypeResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerMasterCustomerTypeResponseModel.fromJson(json)).toList();
  }
}


