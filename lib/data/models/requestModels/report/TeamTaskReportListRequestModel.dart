class TaskReportRequestModel {
  String? date;
  int? limit;
  Null? reportOf;
  int? page;

  TaskReportRequestModel({this.date, this.limit, this.reportOf, this.page});

  TaskReportRequestModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    limit = json['limit'];
    reportOf = json['report_of'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['limit'] = this.limit;
    data['report_of'] = this.reportOf;
    data['page'] = this.page;
    return data;
  }
}
