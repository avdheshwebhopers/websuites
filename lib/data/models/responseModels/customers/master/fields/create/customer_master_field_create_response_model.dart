class CustomerMasterFieldCreateResponseModel {
  String? fieldLabel;
  String? fieldName;
  String? type;
  String? answers;
  bool? required;
  String? id;
  bool? defaultAt;
  String? createdAt;
  String? updatedAt;

  CustomerMasterFieldCreateResponseModel({this.fieldLabel, this.fieldName, this.type, this.answers, this.required, this.id, this.defaultAt, this.createdAt, this.updatedAt});

CustomerMasterFieldCreateResponseModel.fromJson(Map<String, dynamic> json) {
fieldLabel = json['field_label'];
fieldName = json['field_name'];
type = json['type'];
answers = json['answers'];
required = json['required'];
id = json['id'];
defaultAt = json['default'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['field_label'] = this.fieldLabel;
data['field_name'] = this.fieldName;
data['type'] = this.type;
data['answers'] = this.answers;
data['required'] = this.required;
data['id'] = this.id;
data['default'] = this.defaultAt;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}