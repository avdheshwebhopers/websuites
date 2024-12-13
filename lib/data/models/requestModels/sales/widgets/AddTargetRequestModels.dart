class SalesAddTargetRequestModel {
  String? notificationTo;
  int? limit;
  int? page;

  SalesAddTargetRequestModel({this.notificationTo, this.limit, this.page});

  SalesAddTargetRequestModel.fromJson(Map<String, dynamic> json) {
    notificationTo = json['notification_to'] as String?;
    limit = json['limit'] as int?;
    page = json['page'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notificationTo != null) {
      data['notification_to'] = notificationTo;
    }
    if (limit != null) {
      data['limit'] = limit;
    }
    if (page != null) {
      data['page'] = page;
    }
    return data;
  }
}
