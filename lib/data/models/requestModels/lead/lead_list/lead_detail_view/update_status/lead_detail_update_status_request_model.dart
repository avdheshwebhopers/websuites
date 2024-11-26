class LeadUpdateStatusRequestModel {
  final String remark;
  final String status;

  LeadUpdateStatusRequestModel({
    required this.remark,
    required this.status,
  });

  // Convert JSON to RequestModel
  factory LeadUpdateStatusRequestModel.fromJson(Map<String, dynamic> json) {
    return LeadUpdateStatusRequestModel(
      remark: json['remark'],
      status: json['status'],
    );
  }

  // Convert RequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'remark': remark,
      'status': status,
    };
  }
}
