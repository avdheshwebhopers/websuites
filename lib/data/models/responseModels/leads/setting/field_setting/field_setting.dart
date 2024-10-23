class FieldSettingResponseModel {
  String? id;
  String? name;
  String? displayName;
  bool? isRequired;
  bool? isStatusFixed;
  String? type;
  List<Null>? leadFieldEditRestrictions;
  List<Null>? restrictedRoles;

  FieldSettingResponseModel(
      {this.id,
        this.name,
        this.displayName,
        this.isRequired,
        this.isStatusFixed,
        this.type,
        this.leadFieldEditRestrictions,
        this.restrictedRoles});

  FieldSettingResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    isRequired = json['isRequired'];
    isStatusFixed = json['isStatusFixed'];
    type = json['type'];
    if (json['lead_field_edit_restrictions'] != null) {
      leadFieldEditRestrictions = <Null>[];
      json['lead_field_edit_restrictions'].forEach((v) {
        leadFieldEditRestrictions!.add((v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['displayName'] = displayName;
    data['isRequired'] = isRequired;
    data['isStatusFixed'] = isStatusFixed;
    data['type'] = type;
    if (leadFieldEditRestrictions != null) {
      data['lead_field_edit_restrictions'] =
          leadFieldEditRestrictions!.map((v) =>()).toList();
    }
    if (restrictedRoles != null) {
      data['restricted_roles'] =
          restrictedRoles!.map((v) => ()).toList();
    }
    return data;
  }
  static List<FieldSettingResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => FieldSettingResponseModel.fromJson(json)).toList();
  }
}


