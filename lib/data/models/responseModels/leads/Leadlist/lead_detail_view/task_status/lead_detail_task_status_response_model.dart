class LeadDetailTaskStatusResponseModel {
  String? id;
  String? name;
  String? reference;
  bool? defaultAt;
  String? color;
  bool? status;
  int? order;
  String? description;
  String? createdAt;
  String? updatedAt;

  LeadDetailTaskStatusResponseModel({this.id, this.name, this.reference, this.defaultAt, this.color, this.status, this.order, this.description, this.createdAt, this.updatedAt});

LeadDetailTaskStatusResponseModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
reference = json['reference'];
defaultAt = json['default'];
color = json['color'];
status = json['status'];
order = json['order'];
description = json['description'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['reference'] = this.reference;
data['default'] = this.defaultAt;
data['color'] = this.color;
data['status'] = this.status;
data['order'] = this.order;
data['description'] = this.description;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}

  static List<LeadDetailTaskStatusResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadDetailTaskStatusResponseModel.fromJson(json)).toList();
  }
}