class LeadCustomFieldsResponseModel {
  String? id;
  String? fieldFor;
  String? fieldLabel;
  String? fieldName;
  String? type;
  String? description;
  String? answers;
  Null pattern;
  int? maxValue;
  bool? required;
  bool? requiredForCustomer;
  String? defaultValue;
  bool? multiple;
  String? createdAt;
  String? updatedAt;

  LeadCustomFieldsResponseModel(
      {this.id,
        this.fieldFor,
        this.fieldLabel,
        this.fieldName,
        this.type,
        this.description,
        this.answers,
        this.pattern,
        this.maxValue,
        this.required,
        this.requiredForCustomer,
        this.defaultValue,
        this.multiple,
        this.createdAt,
        this.updatedAt
      });

  LeadCustomFieldsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldFor = json['field_for'];
    fieldLabel = json['field_label'];
    fieldName = json['field_name'];
    type = json['type'];
    description = json['description'];
    answers = json['answers'];
    pattern = json['pattern'];
    maxValue = json['max_value'];
    required = json['required'];
    requiredForCustomer = json['required_for_customer'];
    defaultValue = json['default_value'];
    multiple = json['multiple'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['field_for'] = fieldFor;
    data['field_label'] = fieldLabel;
    data['field_name'] = fieldName;
    data['type'] = type;
    data['description'] = description;
    data['answers'] = answers;
    data['pattern'] = pattern;
    data['max_value'] = maxValue;
    data['required'] = required;
    data['required_for_customer'] = requiredForCustomer;
    data['default_value'] = defaultValue;
    data['multiple'] = multiple;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}