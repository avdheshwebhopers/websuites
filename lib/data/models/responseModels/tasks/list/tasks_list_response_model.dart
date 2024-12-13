class TasksListResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;
  Null? members;

  TasksListResponseModel({this.items, this.meta, this.userKey, this.members});

  TasksListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    userKey = json['user_key'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['user_key'] = this.userKey;
    data['members'] = this.members;
    return data;
  }
}

class Items {
  String? id;
  String? subject;
  String? description;
  String? startDate;
  String? deadline;
  String? priority;
  int? estimatedMinutes;
  String? createdAt;
  String? updatedAt;
  CreatedBy? createdBy;
  List<Assigned>? assigned;
  TaskType? taskType;
  Status? status;
  Project? project;

  Items(
      {this.id,
        this.subject,
        this.description,
        this.startDate,
        this.deadline,
        this.priority,
        this.estimatedMinutes,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.assigned,
        this.taskType,
        this.status,
        this.project});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    priority = json['priority'];
    estimatedMinutes = json['estimated_minutes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    if (json['assigned'] != null) {
      assigned = <Assigned>[];
      json['assigned'].forEach((v) {
        assigned!.add(new Assigned.fromJson(v));
      });
    }
    taskType = json['task_type'] != null
        ? new TaskType.fromJson(json['task_type'])
        : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['deadline'] = this.deadline;
    data['priority'] = this.priority;
    data['estimated_minutes'] = this.estimatedMinutes;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    if (this.assigned != null) {
      data['assigned'] = this.assigned!.map((v) => v.toJson()).toList();
    }
    if (this.taskType != null) {
      data['task_type'] = this.taskType!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
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

class Assigned {
  String? id;
  int? status;
  AssignedTo? assignedTo;

  Assigned({this.id, this.status, this.assignedTo});

  Assigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    assignedTo = json['assigned_to'] != null
        ? new AssignedTo.fromJson(json['assigned_to'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.assignedTo != null) {
      data['assigned_to'] = this.assignedTo!.toJson();
    }
    return data;
  }
}

class AssignedTo {
  String? id;
  String? firstName;
  String? lastName;
  bool? status;

  AssignedTo({this.id, this.firstName, this.lastName, this.status});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['status'] = this.status;
    return data;
  }
}

class TaskType {
  String? id;
  String? name;

  TaskType({this.id, this.name});

  TaskType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Status {
  String? id;
  String? name;
  String? color;

  Status({this.id, this.name, this.color});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    return data;
  }
}

class Project {
  String? id;
  String? projectName;

  Project({this.id, this.projectName});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;

  Meta(
      {this.currentPage,
        this.itemsPerPage,
        this.totalPages,
        this.totalItems,
        this.itemCount});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['itemsPerPage'] = this.itemsPerPage;
    data['totalPages'] = this.totalPages;
    data['totalItems'] = this.totalItems;
    data['itemCount'] = this.itemCount;
    return data;
  }
}
