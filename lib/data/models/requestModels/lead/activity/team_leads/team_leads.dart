class TeamLeadRequestModel {
  DateRange? dateRange;
  int? limit;
  int? page;
  String? userId;

  TeamLeadRequestModel({
    this.dateRange,
    this.limit,
    this.page,
    this.userId,
  });

  // Factory method to create an instance from JSON
  factory TeamLeadRequestModel.fromJson(Map<String, dynamic> json) {
    return TeamLeadRequestModel(
      dateRange: json['date_range'] != null
          ? DateRange.fromJson(json['date_range'])
          : null,
      limit: json['limit'] ?? 0,
      page: json['page'] ?? 0,
      userId: json['user_id'] ?? "",
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dateRange != null) {
      data['date_range'] = dateRange!.toJson();
    }
    data['limit'] = limit;
    data['page'] = page;
    data['user_id'] = userId;
    return data;
  }
}

// DateRange class for handling the "from" and "to" dates
class DateRange {
  String? from;
  String? to;

  DateRange({this.from, this.to});

  // Factory method to create DateRange from JSON
  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      from: json['from'] ?? "",
      to: json['to'] ?? "",
    );
  }

  // Method to convert DateRange to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
