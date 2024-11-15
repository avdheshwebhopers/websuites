class CustomerMasterActivationServicesResponseModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  CustomerMasterActivationServicesResponseModel(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  CustomerMasterActivationServicesResponseModel.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
  static List<CustomerMasterActivationServicesResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerMasterActivationServicesResponseModel.fromJson(json)).toList();
  }

}



