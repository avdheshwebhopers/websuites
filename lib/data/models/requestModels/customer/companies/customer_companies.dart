class CustomerCompaniesRequestModel {
  CustomerCompaniesRequestModel({
    required this.customer,
    required this.dateRange,
    required this.dateRangeTo,
    required this.division,
    required this.limit,
    required this.page,
    required this.reminderTo,
    required this.reminderType,
    required this.rowsPerPage,
    required this.status,
  });

  final String? customer;         // Changed from dynamic to String?
  final String? dateRange;        // Changed from dynamic to String?
  final String? dateRangeTo;      // Changed from dynamic to String?
  final String? division;         // Changed from dynamic to String?
  final int? limit;               // Nullable integer for limit
  final int? page;                // Nullable integer for page
  final String? reminderTo;       // Changed from dynamic to String?
  final String? reminderType;     // Changed from dynamic to String?
  final int? rowsPerPage;         // Nullable integer for rowsPerPage
  final String? status;           // Changed from dynamic to String?

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'customer': customer,
      'date_range': dateRange,
      'date_range_to': dateRangeTo,
      'division': division,
      'limit': limit,
      'page': page,
      'reminder_to': reminderTo,
      'reminder_type': reminderType,
      'rowsPerPage': rowsPerPage,
      'status': status,
    };
  }

  // Factory method to create an instance from JSON
  factory CustomerCompaniesRequestModel.fromJson(Map<String, dynamic> json) {
    return CustomerCompaniesRequestModel(
      customer: json["customer"],
      dateRange: json["date_range"],
      dateRangeTo: json["date_range_to"],
      division: json["division"],
      limit: json["limit"],
      page: json["page"],
      reminderTo: json["reminder_to"],
      reminderType: json["reminder_type"],
      rowsPerPage: json["rowsPerPage"],
      status: json["status"],
    );
  }
}