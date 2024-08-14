class ProductBrandResponseModel {
  String? id;
  String? name;
  String? description;
  String? created_at;
  String? updated_at;
  String? division;

  ProductBrandResponseModel({
    this.id,
    this.name,
    this.description,
    this.created_at,
    this.updated_at,
    this.division
});

  ProductBrandResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    division = json['division'];
   }

   Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['division'] = division;
    return data;
   }






}