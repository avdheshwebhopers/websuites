class ActivationAvailableFieldResponseModel {
  List<Items>? items;
  Meta? meta;

  ActivationAvailableFieldResponseModel({this.items, this.meta});

  ActivationAvailableFieldResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) { items!.add(new Items.fromJson(v)); });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Items {
  String? id;
  String? fieldLabel;
  String? fieldName;
  String? type;
  String? answers;
  bool? required;
  bool? defaultAt;
  String? createdAt;
  String? updatedAt;

  Items({this.id, this.fieldLabel, this.fieldName, this.type, this.answers, this.required, this.defaultAt, this.createdAt, this.updatedAt});

Items.fromJson(Map<String, dynamic> json) {
id = json['id'];
fieldLabel = json['field_label'];
fieldName = json['field_name'];
type = json['type'];
answers = json['answers'];
required = json['required'];
defaultAt = json['default'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['field_label'] = this.fieldLabel;
data['field_name'] = this.fieldName;
data['type'] = this.type;
data['answers'] = this.answers;
data['required'] = this.required;
data['default'] = this.defaultAt;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class Meta {
int? currentPage;
int? itemsPerPage;
int? totalPages;
int? totalItems;
int? itemCount;

Meta({this.currentPage, this.itemsPerPage, this.totalPages, this.totalItems, this.itemCount});

Meta.fromJson(Map<String, dynamic> json) {
currentPage = json['currentPage'];
itemsPerPage = json['itemsPerPage'];
totalPages = json['totalPages'];
totalItems = json['totalItems'];
itemCount = json['itemCount'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['currentPage'] = this.currentPage;
data['itemsPerPage'] = this.itemsPerPage;
data['totalPages'] = this.totalPages;
data['totalItems'] = this.totalItems;
data['itemCount'] = this.itemCount;
return data;
}
}