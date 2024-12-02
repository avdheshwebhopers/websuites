class LeadDetailActionLeadRequestModel {
  final String activity;
  final double lat;
  final double lng;
  final String leadType;
  final String remark;
  final String? subLeadType; // Nullable field for sub_lead_type

  LeadDetailActionLeadRequestModel({
    required this.activity,
    required this.lat,
    required this.lng,
    required this.leadType,
    required this.remark,
    this.subLeadType,
  });

  // Convert JSON to RequestModel
  factory LeadDetailActionLeadRequestModel.fromJson(Map<String, dynamic> json) {
    return LeadDetailActionLeadRequestModel(
      activity: json['activity'],
      lat: json['lat'],
      lng: json['lng'],
      leadType: json['lead_type'],
      remark: json['remark'],
      subLeadType: json['sub_lead_type'],
    );
  }

  // Convert RequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'lat': lat,
      'lng': lng,
      'lead_type': leadType,
      'remark': remark,
      'sub_lead_type': subLeadType,
    };
  }
}
