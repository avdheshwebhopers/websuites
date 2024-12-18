class ReportTaskUpdateResponseModel {
  String? id;
  String? subject;
  String? description;
  String? startDate;
  dynamic completeDate;
  String? deadline;
  String? priority;
  String? statusDateTime;
  int? estimatedMinutes;
  int? timeTaken;
  String? createdAt;
  String? updatedAt;
  bool? isSequentialTask;
  int? order;
  Status? status;
  Project? project;
  TaskType? taskType;

  ReportTaskUpdateResponseModel({this.id, this.subject, this.description, this.startDate, this.completeDate, this.deadline, this.priority, this.statusDateTime, this.estimatedMinutes, this.timeTaken, this.createdAt, this.updatedAt, this.isSequentialTask, this.order, this.status, this.project, this.taskType});

  ReportTaskUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    startDate = json['start_date'];
    completeDate = json['complete_date'];
    deadline = json['deadline'];
    priority = json['priority'];
    statusDateTime = json['status_date_time'];
    estimatedMinutes = json['estimated_minutes'];
    timeTaken = json['time_taken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSequentialTask = json['is_sequential_task'];
    order = json['order'];
    status = json['status'] != null ? new Status.fromJson(json['status']) : null;
    project = json['project'] != null ? new Project.fromJson(json['project']) : null;
    taskType = json['task_type'] != null ? new TaskType.fromJson(json['task_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['complete_date'] = this.completeDate;
    data['deadline'] = this.deadline;
    data['priority'] = this.priority;
    data['status_date_time'] = this.statusDateTime;
    data['estimated_minutes'] = this.estimatedMinutes;
    data['time_taken'] = this.timeTaken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_sequential_task'] = this.isSequentialTask;
    data['order'] = this.order;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.taskType != null) {
      data['task_type'] = this.taskType!.toJson();
    }
    return data;
  }
}

class Status {
  String? id;
  String? name;
  dynamic reference;
  bool? defaultAt;
  String? color;
  bool? status;
  int? order;
  dynamic description;
  String? createdAt;
  String? updatedAt;

  Status({this.id, this.name, this.reference, this.defaultAt, this.color, this.status, this.order, this.description, this.createdAt, this.updatedAt});

Status.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
reference = json['reference'];
defaultAt = json['default'];
color = json['color'];
status = json['status'];
order = json['order'];
description = json['description'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['reference'] = this.reference;
data['default'] = this.defaultAt;
data['color'] = this.color;
data['status'] = this.status;
data['order'] = this.order;
data['description'] = this.description;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
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
String? demoUrl;
dynamic finishDate;
String? liveUrl;
String? createdAt;
String? updatedAt;

Project({this.id, this.projectName, this.billingType, this.status, this.totalRate, this.estimatedHours, this.startDate, this.deadline, this.description, this.demoUrl, this.finishDate, this.liveUrl, this.createdAt, this.updatedAt});

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

class TaskType {
String? id;
String? name;
bool? status;
String? createdAt;
String? updatedAt;

TaskType({this.id, this.name, this.status, this.createdAt, this.updatedAt});

TaskType.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
status = json['status'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['status'] = this.status;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}