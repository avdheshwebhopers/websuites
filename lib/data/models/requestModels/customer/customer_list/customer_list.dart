class CustomerRequestModel {
  final String? assignedRange;
  final String? assignedTo;
  final String city;
  final Map<String, dynamic> customFields;
  final bool customerAssignedToTeam;
  final String customerType;
  final String division;
  final int limit;
  final int page;
  final String paginationType;
  final String projectStatus;
  final Range? range;
  final String? reminderRange;
  final String reminderType;
  final String search;
  final String serviceStatus;
  final String status;

  CustomerRequestModel({
    this.assignedRange,
    this.assignedTo,
    this.city = "",
    this.customFields = const {},
    this.customerAssignedToTeam = false,
    this.customerType = "",
    this.division = "",
    this.limit = 15,
    this.page = 1,
    this.paginationType = "old",
    this.projectStatus = "",
    this.range,
    this.reminderRange,
    this.reminderType = "",
    this.search = "",
    this.serviceStatus = "",
    this.status = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'assigned_range': assignedRange,
      'assigned_to': assignedTo,
      'city': city,
      'custom_fields': customFields,
      'customer_assigned_to_team': customerAssignedToTeam,
      'customer_type': customerType,
      'division': division,
      'limit': limit,
      'page': page,
      'pagination_type': paginationType,
      'projectStatus': projectStatus,
      'range': range?.toJson(),
      'reminder_range': reminderRange,
      'reminder_type': reminderType,
      'search': search,
      'serviceStatus': serviceStatus,
      'status': status,
    };
  }
}

class Range {
  final String from;
  final String to;

  Range({required this.from, required this.to});

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
