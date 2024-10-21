class CustomizeOrderResponseModel {
  String? id;
  String? key;
  String? defaultLabel;
  String? updatedAt;

  CustomizeOrderResponseModel(
      {this.id, this.key, this.defaultLabel, this.updatedAt});

  CustomizeOrderResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    defaultLabel = json['default_label'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['default_label'] = this.defaultLabel;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
