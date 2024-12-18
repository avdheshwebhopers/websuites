class TaskDetailsResponseModel {
  TaskDetailsResponseModel({
    required this.taskInfo,
    required this.hours,
    required this.minutes,
  });
  late final TaskInfo taskInfo;
  late final int hours;
  late final double minutes;

  TaskDetailsResponseModel.fromJson(Map<String, dynamic> json){
    taskInfo = TaskInfo.fromJson(json['taskInfo']);
    hours = json['hours'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['taskInfo'] = taskInfo.toJson();
    _data['hours'] = hours;
    _data['minutes'] = minutes;
    return _data;
  }
}

class TaskInfo {
  TaskInfo({
    required this.id,
    required this.subject,
    required this.description,
    required this.startDate,
    this.completeDate,
    this.deadline,
    required this.priority,
    this.statusDateTime,
    required this.estimatedMinutes,
    required this.timeTaken,
    required this.createdAt,
    required this.updatedAt,
    required this.isSequentialTask,
    required this.order,
    required this.createdBy,
    this.relatedLead,
    required this.status,
    required this.taskType,
    this.department,
    required this.project,
    this.customer,
    required this.assigned,
    required this.taskDescriptions,
    required this.attachments,
    required this.histories,
    required this.timeTracker,
  });
  late final String id;
  late final String subject;
  late final String description;
  late final String startDate;
  late final Null completeDate;
  late final Null deadline;
  late final String priority;
  late final Null statusDateTime;
  late final int estimatedMinutes;
  late final int timeTaken;
  late final String createdAt;
  late final String updatedAt;
  late final bool isSequentialTask;
  late final int order;
  late final CreatedBy createdBy;
  late final Null relatedLead;
  late final Status status;
  late final TaskType taskType;
  late final Null department;
  late final Project project;
  late final Null customer;
  late final List<Assigned> assigned;
  late final List<TaskDescriptions> taskDescriptions;
  late final List<dynamic> attachments;
  late final List<dynamic> histories;
  late final List<TimeTracker> timeTracker;

  TaskInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    startDate = json['start_date'];
    completeDate = null;
    deadline = null;
    priority = json['priority'];
    statusDateTime = null;
    estimatedMinutes = json['estimated_minutes'];
    timeTaken = json['time_taken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSequentialTask = json['is_sequential_task'];
    order = json['order'];
    createdBy = CreatedBy.fromJson(json['created_by']);
    relatedLead = null;
    status = Status.fromJson(json['status']);
    taskType = TaskType.fromJson(json['task_type']);
    department = null;
    project = Project.fromJson(json['project']);
    customer = null;
    assigned = List.from(json['assigned']).map((e)=>Assigned.fromJson(e)).toList();
    taskDescriptions = List.from(json['task_descriptions']).map((e)=>TaskDescriptions.fromJson(e)).toList();
    attachments = List.castFrom<dynamic, dynamic>(json['attachments']);
    histories = List.castFrom<dynamic, dynamic>(json['histories']);
    timeTracker = List.from(json['time_tracker']).map((e)=>TimeTracker.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject'] = subject;
    _data['description'] = description;
    _data['start_date'] = startDate;
    _data['complete_date'] = completeDate;
    _data['deadline'] = deadline;
    _data['priority'] = priority;
    _data['status_date_time'] = statusDateTime;
    _data['estimated_minutes'] = estimatedMinutes;
    _data['time_taken'] = timeTaken;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['is_sequential_task'] = isSequentialTask;
    _data['order'] = order;
    _data['created_by'] = createdBy.toJson();
    _data['relatedLead'] = relatedLead;
    _data['status'] = status.toJson();
    _data['task_type'] = taskType.toJson();
    _data['department'] = department;
    _data['project'] = project.toJson();
    _data['customer'] = customer;
    _data['assigned'] = assigned.map((e)=>e.toJson()).toList();
    _data['task_descriptions'] = taskDescriptions.map((e)=>e.toJson()).toList();
    _data['attachments'] = attachments;
    _data['histories'] = histories;
    _data['time_tracker'] = timeTracker.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  late final String id;
  late final String firstName;
  late final String lastName;

  CreatedBy.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    return _data;
  }
}

class Status {
  Status({
    required this.id,
    required this.name,
    required this.reference,
  });
  late final String id;
  late final String name;
  late final String reference;

  Status.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['reference'] = reference;
    return _data;
  }
}

class TaskType {
  TaskType({
    required this.id,
    required this.name,
  });
  late final String id;
  late final String name;

  TaskType.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class Project {
  Project({
    required this.id,
    required this.projectName,
    required this.startDate,
    this.deadline,
    required this.members,
  });
  late final String id;
  late final String projectName;
  late final String startDate;
  late final Null deadline;
  late final List<Members> members;

  Project.fromJson(Map<String, dynamic> json){
    id = json['id'];
    projectName = json['project_name'];
    startDate = json['start_date'];
    deadline = null;
    members = List.from(json['members']).map((e)=>Members.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['project_name'] = projectName;
    _data['start_date'] = startDate;
    _data['deadline'] = deadline;
    _data['members'] = members.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Members {
  Members({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;

  Members.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    return _data;
  }
}

class Assigned {
  Assigned({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.assignedTo,
  });
  late final String id;
  late final int status;
  late final String createdAt;
  late final String updatedAt;
  late final AssignedTo assignedTo;

  Assigned.fromJson(Map<String, dynamic> json){
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    assignedTo = AssignedTo.fromJson(json['assigned_to']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['assigned_to'] = assignedTo.toJson();
    return _data;
  }
}

class AssignedTo {
  AssignedTo({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.status,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final bool status;

  AssignedTo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['status'] = status;
    return _data;
  }
}

class TaskDescriptions {
  TaskDescriptions({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.createdBy,
  });
  late final String id;
  late final String description;
  late final String createdAt;
  late final CreatedBy createdBy;

  TaskDescriptions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    description = json['description'];
    createdAt = json['created_at'];
    createdBy = CreatedBy.fromJson(json['created_by']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['description'] = description;
    _data['created_at'] = createdAt;
    _data['created_by'] = createdBy.toJson();
    return _data;
  }
}

class TimeTracker {
  TimeTracker({
    required this.id,
    required this.dateTime,
    required this.action,
  });
  late final String id;
  late final String dateTime;
  late final String action;

  TimeTracker.fromJson(Map<String, dynamic> json){
    id = json['id'];
    dateTime = json['date_time'];
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['date_time'] = dateTime;
    _data['action'] = action;
    return _data;
  }
}