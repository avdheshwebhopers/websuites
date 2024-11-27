class ColumnSettingSaveChangesResponseModel {
  String? id;
  String? leadField;
  String? fieldName;
  int? order;
  bool? filter;
  bool? allowGlobalSearch;
  bool? status;
  String? type;
  String? createdAt;
  String? updatedAt;

  ColumnSettingSaveChangesResponseModel(
      {this.id,
        this.leadField,
        this.fieldName,
        this.order,
        this.filter,
        this.allowGlobalSearch,
        this.status,
        this.type,
        this.createdAt,
        this.updatedAt});

  ColumnSettingSaveChangesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadField = json['lead_field'];
    fieldName = json['field_name'];
    order = json['order'];
    filter = json['filter'];
    allowGlobalSearch = json['allowGlobalSearch'];
    status = json['status'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_field'] = this.leadField;
    data['field_name'] = this.fieldName;
    data['order'] = this.order;
    data['filter'] = this.filter;
    data['allowGlobalSearch'] = this.allowGlobalSearch;
    data['status'] = this.status;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
  static List<ColumnSettingSaveChangesResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ColumnSettingSaveChangesResponseModel.fromJson(json)).toList();
  }
}


