import 'dart:convert';

class CustomerServiceAreaStateRequestModel {
  final String divisionId;

  CustomerServiceAreaStateRequestModel({required this.divisionId});

  // Convert RequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'divisionId': divisionId,
    };
  }

  // Factory method to create RequestModel from JSON
  factory CustomerServiceAreaStateRequestModel.fromJson(Map<String, dynamic> json) {
    return CustomerServiceAreaStateRequestModel(
      divisionId: json['divisionId'],
    );
  }


}
