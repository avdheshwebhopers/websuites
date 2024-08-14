class ProductCategoryResponseModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? created_at;
  String? updated_at;
  Parent? parent;

  ProductCategoryResponseModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.created_at,
    this.updated_at,
    this.parent
}
);

  ProductCategoryResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    parent = json['parent'] != null ? Parent.fromJson(json['json']): null;
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    if(parent != null) {
      data['parent'] = parent !.toJson();
    }
    return data;
  }
}

class Parent {
  String? id;
  String? name;
  String? description;
  String? image;
  String? created_at;
  String? updated_at;
  String? parent;

  Parent({
    this.id,
    this.name,
    this.description,
    this.image,
    this.created_at,
    this.updated_at,
    this.parent,
  }
  );

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['parent'] = parent;
    return data;
  }
}