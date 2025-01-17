class TaskListRequestModel {
  String? assignedTo;
  String? company;
  String? createdBy;
  String? customer;
  String? dateRange;
  String? dateType;
  String? divisionId;
  bool? isFilterAssigneeWithTeam;
  bool? isFilterCreatedByWithTeam;
  String? lead;
  int? limit;
  int? page;
  String? priority;
  String? project;
  Sort? sort;
  String? startDateRange;
  List<dynamic>? status;
  String? taskType;

  TaskListRequestModel({
    this.assignedTo,
    this.company,
    this.createdBy,
    this.customer,
    this.dateRange,
    this.dateType = "create_date",
    this.divisionId,
    this.isFilterAssigneeWithTeam = false,
    this.isFilterCreatedByWithTeam = true,
    this.lead,
    this.limit = 15,
    this.page = 1,
    this.priority,
    this.project,
    this.sort,
    this.startDateRange,
    this.status = const [],
    this.taskType,
  });

  Map<String, dynamic> toJson() {
    return {
      "assigned_to": assignedTo,
      "company": company,
      "created_by": createdBy,
      "customer": customer,
      "date_range": dateRange,
      "date_type": dateType,
      "divisionId": divisionId,
      "isFilterAssigneeWithTeam": isFilterAssigneeWithTeam,
      "isFilterCreatedByWithTeam": isFilterCreatedByWithTeam,
      "lead": lead,
      "limit": limit,
      "page": page,
      "priority": priority,
      "project": project,
      "sort": sort?.toJson(),
      "start_date_range": startDateRange,
      "status": status,
      "task_type": taskType,
    };
  }
}

class Sort {
  String? q;
  String? sortBy;

  Sort({
    this.q,
    this.sortBy = "ASC",
  });

  Map<String, dynamic> toJson() {
    return {
      "q": q,
      "sortBy": sortBy,
    };
  }
}
