class DeleteListRequestModel {
  final String? dataRange;
  final int limit;
  final int page;
  final String? range;
  final String? rangeReminder;
  final String? search;
  final String? unhandle;

  DeleteListRequestModel({
    this.dataRange,
    this.limit = 15,
    this.page = 1,
    this.range,
    this.rangeReminder,
    this.search,
    this.unhandle,
  });

  Map<String, dynamic> toJson() {
    return {
      'data_range': dataRange,
      'limit': limit,
      'page': page,
      'range': range,
      'range_reminder': rangeReminder,
      'search': search,
      'unhandle': unhandle,
    };
  }
}
