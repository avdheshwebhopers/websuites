import '../lead_list/lead_list.dart';

class LeadActivityRequestModel {
  final int active;
  final Range dateRange;
  final int limit;
  final int page;
  final int rowsPerPage;

  // Constructor
  LeadActivityRequestModel({
    required this.active,
    required this.dateRange,
    required this.limit,
    required this.page,
    required this.rowsPerPage,
  });

  // Convert the model to JSON format for API call
  Map<String, dynamic> toJson() {
    return {
      'active': active,
      'date_range': dateRange.toJson(),
      'limit': limit,
      'page': page,
      'rowsPerPage': rowsPerPage,
    };
  }
}

// Helper class for date range
class DateRange {
  final String from;
  final String to;

  // Constructor
  DateRange({
    required this.from,
    required this.to,
  });

  // Convert date range to JSON
  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
