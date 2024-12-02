class CustomerSettingFieldListResponseModel {
  String? id;
  String? name;
  String? displayName;
  bool? isRequired;
  bool? isInUse;
  bool? isStatusFixed;
  String? type;
  String? createdAt;
  String? updatedAt;
  List<Null>? customerFieldEditRestrictions;
  List<Null>? restrictedRoles;

  CustomerSettingFieldListResponseModel(
      {this.id,
        this.name,
        this.displayName,
        this.isRequired,
        this.isInUse,
        this.isStatusFixed,
        this.type,
        this.createdAt,
        this.updatedAt,
        this.customerFieldEditRestrictions,
        this.restrictedRoles});

  CustomerSettingFieldListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    isRequired = json['isRequired'];
    isInUse = json['isInUse'];
    isStatusFixed = json['isStatusFixed'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['customer_field_edit_restrictions'] != null) {
      customerFieldEditRestrictions = <Null>[];
      json['customer_field_edit_restrictions'].forEach((v) {
        customerFieldEditRestrictions!.add((v));
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
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['isRequired'] = this.isRequired;
    data['isInUse'] = this.isInUse;
    data['isStatusFixed'] = this.isStatusFixed;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.customerFieldEditRestrictions != null) {
      data['customer_field_edit_restrictions'] =
          this.customerFieldEditRestrictions!.map((v) => ()).toList();
    }
    if (this.restrictedRoles != null) {
      data['restricted_roles'] =
          this.restrictedRoles!.map((v) => ()).toList();
    }
    return data;
  }
  static List<CustomerSettingFieldListResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerSettingFieldListResponseModel.fromJson(json)).toList();
  }
}