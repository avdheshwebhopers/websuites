class CustomerActivationResponseModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? created_at;
  String? updated_at;

  CustomerActivationResponseModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.created_at,
    this.updated_at
});

  CustomerActivationResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}



