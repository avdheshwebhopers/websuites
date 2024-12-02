class LeadDetailHistoryRequestModel {
  String? activity;

  LeadDetailHistoryRequestModel({this.activity});

  factory LeadDetailHistoryRequestModel.fromJson(Map<String, dynamic> json) {
    return LeadDetailHistoryRequestModel(
      activity: json['activity'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    return data;
  }
}
