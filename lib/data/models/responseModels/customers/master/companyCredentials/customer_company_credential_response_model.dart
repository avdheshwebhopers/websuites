class CustomerCompanyCredentialResponseModel {
  String? id;
  String? name;
  String? created_at;
  String? updated_at;

  CustomerCompanyCredentialResponseModel({
    this.id,
    this.name,
    this.created_at,
    this.updated_at
});

  CustomerCompanyCredentialResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}