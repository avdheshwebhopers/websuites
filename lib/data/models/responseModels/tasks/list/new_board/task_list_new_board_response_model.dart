class NewBoardResponseModel {
  String? name;
  String? reference;
  String? color;
  int? order;
  dynamic description;
  String? id;
  bool? defaultAt;
  bool? status;
  String? createdAt;
  String? updatedAt;

  NewBoardResponseModel({this.name, this.reference, this.color, this.order, this.description, this.id, this.defaultAt, this.status, this.createdAt, this.updatedAt});

NewBoardResponseModel.fromJson(Map<String, dynamic> json) {
name = json['name'];
reference = json['reference'];
color = json['color'];
order = json['order'];
description = json['description'];
id = json['id'];
defaultAt = json['default'];
status = json['status'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['name'] = this.name;
data['reference'] = this.reference;
data['color'] = this.color;
data['order'] = this.order;
data['description'] = this.description;
data['id'] = this.id;
data['default'] = this.defaultAt;
data['status'] = this.status;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}