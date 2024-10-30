class RequestModel {
  String? assignedType;
  String? assignedRange;
  String city;
  Map<String, dynamic> customFields;
  String division;
  bool isOpen;
  bool isForeignLead;
  String? lastActivityRange;
  String leadAssigned;
  bool leadAssignedToTeam;
  int limit;
  bool noCampaign;
  int page;
  String paginationType;
  String productCategory;
  String queryType;
  Range range;
  String? reminderType;
  String? reminderRange;
  String? repeatType;
  String search;
  List<String> serviceType;
  String source;
  String status;
  List<String> subTypes;
  String? toDoList;
  String type;
  String? unhandle;

  RequestModel({
    this.assignedType,
    this.assignedRange,
    required this.city,
    required this.customFields,
    required this.division,
    required this.isOpen,
    required this.isForeignLead,
    this.lastActivityRange,
    required this.leadAssigned,
    required this.leadAssignedToTeam,
    required this.limit,
    required this.noCampaign,
    required this.page,
    required this.paginationType,
    required this.productCategory,
    required this.queryType,
    required this.range,
    this.reminderType,
    this.reminderRange,
    this.repeatType,
    required this.search,
    required this.serviceType,
    required this.source,
    required this.status,
    required this.subTypes,
    this.toDoList,
    required this.type,
    this.unhandle,
  });

  Map<String, dynamic> toJson() {
    return {
      "assignedType": assignedType,
      "assigned_range": assignedRange,
      "city": city,
      "custom_fields": customFields,
      "division": division,
      "isOpen": isOpen,
      "is_foreign_lead": isForeignLead,
      "lastActivityRange": lastActivityRange,
      "lead_assigned": leadAssigned,
      "lead_assigned_to_team": leadAssignedToTeam,
      "limit": limit,
      "no_campaig": noCampaign,
      "page": page,
      "pagination_type": paginationType,
      "productCategory": productCategory,
      "query_type": queryType,
      "range": range.toJson(),
      "reminderType": reminderType,
      "reminder_range": reminderRange,
      "repeatType": repeatType,
      "search": search,
      "service_type": serviceType,
      "source": source,
      "status": status,
      "sub_types": subTypes,
      "toDoList": toDoList,
      "type": type,
      "unhandle": unhandle,
    };
  }
}

class Range {
  String from;
  String to;

  Range({required this.from, required this.to});

  Map<String, dynamic> toJson() {
    return {
      "from": from,
      "to": to,
    };
  }
}
