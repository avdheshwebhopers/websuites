class LeadCustomFieldsResponseModel {
  LeadCustomFieldsResponseModel({
    required this.id,
    required this.fieldFor,
    required this.fieldLabel,
    required this.fieldName,
    required this.type,
    required this.description,
    required this.answers,
    required this.pattern,
    required this.maxValue,
    required this.required,
    required this.requiredForCustomer,
    required this.defaultValue,
    required this.multiple,
    required this.createdAt,
    required this.updatedAt,
    required this.leadCustomFieldEditRestrictions,
    required this.restrictedRoles,
  });

  final String? id;
  final String? fieldFor;
  final String? fieldLabel;
  final String? fieldName;
  final String? type;
  final String? description;
  final String? answers;
  final String? pattern;
  final int? maxValue;
  final bool? required;
  final bool? requiredForCustomer;
  final String? defaultValue;
  final bool? multiple;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic> leadCustomFieldEditRestrictions;
  final List<dynamic> restrictedRoles;

  factory LeadCustomFieldsResponseModel.fromJson(Map<String, dynamic> json){
    return LeadCustomFieldsResponseModel(
      id: json["id"],
      fieldFor: json["field_for"],
      fieldLabel: json["field_label"],
      fieldName: json["field_name"],
      type: json["type"],
      description: json["description"],
      answers: json["answers"],
      pattern: json["pattern"],
      maxValue: json["max_value"],
      required: json["required"],
      requiredForCustomer: json["required_for_customer"],
      defaultValue: json["default_value"],
      multiple: json["multiple"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      leadCustomFieldEditRestrictions: json["lead_custom_field_edit_restrictions"] == null ? [] : List<dynamic>.from(json["lead_custom_field_edit_restrictions"]!.map((x) => x)),
      restrictedRoles: json["restricted_roles"] == null ? [] : List<dynamic>.from(json["restricted_roles"]!.map((x) => x)),
    );
  }

}
