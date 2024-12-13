class TaskReportListResponseModel {
  String? id;
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? ccTo;
  String? createdAt;
  String? updateAt;
  Project? project;
  dynamic customer;
  List<Null>? attachments;
  CreatedBy? createdBy;

  TaskReportListResponseModel(
      {this.id,
        this.title,
        this.description,
        this.startDate,
        this.endDate,
        this.ccTo,
        this.createdAt,
        this.updateAt,
        this.project,
        this.customer,
        this.attachments,
        this.createdBy});

  TaskReportListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    ccTo = json['cc_to'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    customer = json['customer'];
    if (json['attachments'] != null) {
      attachments = <Null>[];
      json['attachments'].forEach((v) {
        attachments!.add((v));
      });
    }
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['cc_to'] = this.ccTo;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    data['customer'] = this.customer;
    if (this.attachments != null) {
      data['attachments'] = this.attachments!.map((v) =>()).toList();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    return data;
  }
  static List<TaskReportListResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>TaskReportListResponseModel.fromJson(json)).toList();
  }
}

class Project {
  String? id;
  String? projectName;
  String? billingType;
  String? status;
  int? totalRate;
  int? estimatedHours;
  String? startDate;
  dynamic deadline;
  String? description;
  dynamic demoUrl;
  dynamic finishDate;
  dynamic liveUrl;
  String? createdAt;
  String? updatedAt;

  Project(
      {this.id,
        this.projectName,
        this.billingType,
        this.status,
        this.totalRate,
        this.estimatedHours,
        this.startDate,
        this.deadline,
        this.description,
        this.demoUrl,
        this.finishDate,
        this.liveUrl,
        this.createdAt,
        this.updatedAt});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
    billingType = json['billing_type'];
    status = json['status'];
    totalRate = json['total_rate'];
    estimatedHours = json['estimated_hours'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    description = json['description'];
    demoUrl = json['demo_url'];
    finishDate = json['finish_date'];
    liveUrl = json['live_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    data['billing_type'] = this.billingType;
    data['status'] = this.status;
    data['total_rate'] = this.totalRate;
    data['estimated_hours'] = this.estimatedHours;
    data['start_date'] = this.startDate;
    data['deadline'] = this.deadline;
    data['description'] = this.description;
    data['demo_url'] = this.demoUrl;
    data['finish_date'] = this.finishDate;
    data['live_url'] = this.liveUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;

  CreatedBy({this.id, this.firstName, this.lastName});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}