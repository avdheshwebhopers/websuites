class CustomerCompanyCredentialCreateResponseModel {
  String? name;
  String? id;
  String? createdAt;
  String? updatedAt;

  CustomerCompanyCredentialCreateResponseModel(
      {this.name, this.id, this.createdAt, this.updatedAt});

  CustomerCompanyCredentialCreateResponseModel.fromJson(
      Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}