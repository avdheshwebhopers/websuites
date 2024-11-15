class SalesListRequestModel {
  String? notificationTo;
  int? limit;
  int? page;

  SalesListRequestModel({this.notificationTo, this.limit, this.page});

  SalesListRequestModel.fromJson(Map<String, dynamic> json) {
    notificationTo = json['notification_to'];
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_to'] = this.notificationTo;
    data['limit'] = this.limit;
    data['page'] = this.page;
    return data;
  }
}
