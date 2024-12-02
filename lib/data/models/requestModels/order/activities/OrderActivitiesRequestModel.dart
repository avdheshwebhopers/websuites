class OrderActivitiesRequestModel {
  DateRange? dateRange;
  String? division;
  String? userId;
  bool? isFilterUserWithTeam;
  List<String>? products; // Updated to List<String> or a more appropriate type instead of Null
  int? limit;
  int? page;

  OrderActivitiesRequestModel({
    this.dateRange,
    this.division,
    this.userId,
    this.isFilterUserWithTeam,
    this.products,
    this.limit,
    this.page,
  });

  OrderActivitiesRequestModel.fromJson(Map<String, dynamic> json) {
    dateRange = json['date_range'] != null
        ? DateRange.fromJson(json['date_range'])
        : null;
    division = json['division'];
    userId = json['userId'];
    isFilterUserWithTeam = json['isFilterUserWithTeam'];
    if (json['products'] != null) {
      products = <String>[]; // Changed to List<String>
      json['products'].forEach((v) {
        products!.add(v as String); // Assuming products are strings or another suitable type
      });
    }
    limit = json['limit'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dateRange != null) {
      data['date_range'] = dateRange!.toJson();
    }
    data['division'] = division;
    data['userId'] = userId;
    data['isFilterUserWithTeam'] = isFilterUserWithTeam;
    if (products != null) {
      data['products'] = products!.map((v) => v).toList(); // Adjusted to work with List<String>
    }
    data['limit'] = limit;
    data['page'] = page;
    return data;
  }
}

class DateRange {
  String? from;
  String? to;

  DateRange({this.from, this.to});

  DateRange.fromJson(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['from'] = from;
    data['to'] = to;
    return data;
  }
}
