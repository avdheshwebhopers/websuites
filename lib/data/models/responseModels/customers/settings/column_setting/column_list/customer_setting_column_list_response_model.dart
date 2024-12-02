class CustomerSettingColumnListResponseModel {
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
  List<Null>? hideCustomerColumnsFromRole;
  List<Null>? restrictedRoles;

  CustomerSettingColumnListResponseModel(
      {this.id,
      this.leadField,
      this.fieldName,
      this.order,
      this.filter,
      this.allowGlobalSearch,
      this.status,
      this.type,
      this.createdAt,
      this.updatedAt,
      this.hideCustomerColumnsFromRole,
      this.restrictedRoles});

  CustomerSettingColumnListResponseModel.fromJson(Map<String, dynamic> json) {
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
    if (json['hide_customer_columns_from_role'] != null) {
      hideCustomerColumnsFromRole = <Null>[];
      json['hide_customer_columns_from_role'].forEach((v) {
        hideCustomerColumnsFromRole!.add((v));
      });
    }
    if (json['restricted_roles'] != null) {
      restrictedRoles = <Null>[];
      json['restricted_roles'].forEach((v) {
        restrictedRoles!.add((v));
      });
    }
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
    if (this.hideCustomerColumnsFromRole != null) {
      data['hide_customer_columns_from_role'] =
          this.hideCustomerColumnsFromRole!.map((v) => ()).toList();
    }
    if (this.restrictedRoles != null) {
      data['restricted_roles'] = this.restrictedRoles!.map((v) => ()).toList();
    }
    return data;
  }
  static List<CustomerSettingColumnListResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerSettingColumnListResponseModel.fromJson(json)).toList();
  }
}
