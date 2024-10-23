import 'package:get/get.dart';

class LeadSettingResponseModel {
  String id;
  String leadField;
  String fieldName;
  bool locked;
  int score;
  bool scorable;
  int order;
  String type;
  bool allowGlobalSearch;
  RxBool status; // Changed to observable
  RxBool filter; // Changed to observable
  bool allowedInLeadsList;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> hideLeadColumnsFromRole;
  List<dynamic> restrictedRoles;

  // Adding isVisible and isSearchFilter as observables
  RxBool isVisible;
  RxBool isSearchFilter;

  LeadSettingResponseModel({
    required this.id,
    required this.leadField,
    required this.fieldName,
    required this.locked,
    required this.score,
    required this.scorable,
    required this.order,
    required this.type,
    required this.allowGlobalSearch,
    required bool status, // Change to RxBool
    required bool filter, // Change to RxBool
    required this.allowedInLeadsList,
    required this.createdAt,
    required this.updatedAt,
    required this.hideLeadColumnsFromRole,
    required this.restrictedRoles,
  })  : status = RxBool(status),
        filter = RxBool(filter),
        isVisible = RxBool(false), // Initialize with default value
        isSearchFilter = RxBool(false); // Initialize with default value

  // Factory constructor to create an instance from JSON
  factory LeadSettingResponseModel.fromJson(Map<String, dynamic> json) {
    return LeadSettingResponseModel(
      id: json['id'],
      leadField: json['lead_field'],
      fieldName: json['field_name'],
      locked: json['locked'],
      score: json['score'],
      scorable: json['scorable'],
      order: json['order'],
      type: json['type'],
      allowGlobalSearch: json['allowGlobalSearch'],
      status: json['status'], // Pass the raw value to RxBool
      filter: json['filter'], // Pass the raw value to RxBool
      allowedInLeadsList: json['allowedInLeadsList'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      hideLeadColumnsFromRole: List<dynamic>.from(json['hide_lead_columns_from_role']),
      restrictedRoles: List<dynamic>.from(json['restricted_roles']),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lead_field': leadField,
      'field_name': fieldName,
      'locked': locked,
      'score': score,
      'scorable': scorable,
      'order': order,
      'type': type,
      'allowGlobalSearch': allowGlobalSearch,
      'status': status.value, // Get the value of the observable
      'filter': filter.value, // Get the value of the observable
      'allowedInLeadsList': allowedInLeadsList,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'hide_lead_columns_from_role': hideLeadColumnsFromRole,
      'restricted_roles': restrictedRoles,
    };
  }

  // Method to create a list of LeadSettingResponseModel from a JSON array
  static List<LeadSettingResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LeadSettingResponseModel.fromJson(json)).toList();
  }
}
