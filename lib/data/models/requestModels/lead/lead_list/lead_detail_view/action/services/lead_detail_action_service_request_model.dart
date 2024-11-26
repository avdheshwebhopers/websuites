class LeadDetailActionServiceRequestModel {
  final String activity;
  final double lat;
  final double lng;
  final String remark;
  final List<String> services;

  LeadDetailActionServiceRequestModel({
    required this.activity,
    required this.lat,
    required this.lng,
    required this.remark,
    required this.services,
  });

  // Convert JSON to RequestModel
  factory LeadDetailActionServiceRequestModel.fromJson(Map<String, dynamic> json) {
    return LeadDetailActionServiceRequestModel(
      activity: json['activity'],
      lat: json['lat'],
      lng: json['lng'],
      remark: json['remark'],
      services: List<String>.from(json['services']),
    );
  }

  // Convert RequestModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'activity': activity,
      'lat': lat,
      'lng': lng,
      'remark': remark,
      'services': services,
    };
  }
}
