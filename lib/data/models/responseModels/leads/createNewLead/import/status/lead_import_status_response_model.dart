class LeadImportStatusResponseModel {
  String? id;
  String? name;
  String? reference;
  String? description;
  String? status;
  bool? defaultAt;
  int? order;
  String? createdAt;
  String? updatedAt;

  LeadImportStatusResponseModel({this.id, this.name, this.reference, this.description, this.status, this.defaultAt, this.order, this.createdAt, this.updatedAt});

LeadImportStatusResponseModel.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
reference = json['reference'];
description = json['description'];
status = json['status'];
defaultAt = json['default'];
order = json['order'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['reference'] = this.reference;
data['description'] = this.description;
data['status'] = this.status;
data['default'] = this.defaultAt;
data['order'] = this.order;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
  static List<LeadImportStatusResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadImportStatusResponseModel.fromJson(json)).toList();
  }
}