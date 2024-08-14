class TasksListResponseModel {
  List<Items>? items;
  Meta? meta;
  String? user_key;
  String? members;

  TasksListResponseModel({
    this.items,
    this.user_key,
    this.meta,
    this.members
  });

  TasksListResponseModel.fromJson(Map<String, dynamic> json) {
    if(json['items'] != null) {
      items = <Items> [];
      json['items'].forEach((v){
        items !.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']):null;
    user_key = json['user_key'];
    members = json['members'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(items != null) {
      data['items'] = items !.map((v) => toJson()).toList();
    }
    if(meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = user_key;
    data['members'] = members;
    return data;
  }
}

class Items {
  String? id;
  String? subject;
  String? description;
  String? start_data;
  String? deadline;
  String? priority;
  int? estimated_minutes;
  String? created_at;
  String? updated_at;
  CreatedBy? created_by;
  List<Assigned>? assigned;
  TaskType? task_type;
  Status? status;
  Project? project;

  Items({
    this.id,
    this.subject,
    this.description,
    this.start_data,
    this.deadline,
    this.priority,
    this.estimated_minutes,
    this.created_at,
    this.updated_at,
    this.created_by,
    this.assigned,
    this.task_type,
    this.status,
    this.project
});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    start_data = json['start_data'];
    deadline = json['deadline'];
    priority = json['priority'];
    estimated_minutes = json['estimated_minutes'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    created_by = json['created_by'] != null ? CreatedBy.fromJson(json['created_by']): null;
    if(json['assigned'] != null) {
      assigned = <Assigned>[];
      json['assigned'].forEach((v){
        assigned !.add(Assigned.fromJson(v));
      });
    }
    task_type = json['task_type'] != null ? TaskType.fromJson(json['task_type']): null;
    status = json['status'] != null ? Status.fromJson(json['status']): null;
    project = json['project'] != null ? Project.fromJson(json['project']): null;
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['description'] = description;
    data['start_date'] = start_data;
    data['deadline'] = deadline;
    data['start_data'] = start_data;
    data['deadline'] = deadline;
    data['priority'] = priority;
    data['estimated_minutes'] = estimated_minutes;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    if(created_by != null) {
      data['created_by'] = created_by !.toJson();
    }
    if(assigned != null) {
      data['assigned'] = assigned !.map((v) => toJson()).toList();
    }
    if(task_type != null) {
      data['task_type'] = task_type !.toJson();
    }
    if(status != null) {
      data['status'] = status !.toJson();
    }
    if(project != null) {
      data['project'] = project !.toJson();
    }
    return data;
  }
}

class Assigned {
  String? id;
  int? status;
  AssignedTo? assigned_to;

  Assigned({
    this.id,
    this.status,
    this.assigned_to
  });

  Assigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    assigned_to = json['assigned_to'] != null
        ? AssignedTo.fromJson(json['assigned_to'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    if (assigned_to != null) {
      data['assigned_to'] = assigned_to!.toJson();
    }
    return data;
  }
}

class AssignedTo{
  String? id;
  String? first_name;
  String? last_name;
  bool? status;

  AssignedTo({
    this.id,
    this.first_name,
    this.status,
    this.last_name
});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    status = json['status'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['first_name'] = first_name;
    data['status'] = status;
    data['last_name'] = last_name;
    return data;
  }
}

class TaskType {
  String? id;
  String? name;

  TaskType({
    this.id,
    this.name
});

  TaskType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
class Status {
  String? id;
  String? name;
  String? color;

  Status({
    this.id,
    this.name,
    this.color
});

  Status.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['color'] = color;
    return data;
  }
}

class Project {
  String? id;
  String? project_name;

  Project({
    this.id,
    this.project_name,
});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    project_name = json['project_name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['project_name'] = project_name;
    return data;
  }
}

class CreatedBy {
  String? id;
  String? first_name;
  String? last_name;

  CreatedBy ({
    this.id,
    this.first_name,
    this.last_name
});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? itemCount;
  int? totalItems;

  Meta ({
    this.currentPage,
    this.itemsPerPage,
    this.totalPages,
    this.itemCount,
    this.totalItems
});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    itemCount = json['itemCount'];
    totalItems = json['totalItems'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['itemCount'] = itemCount;
    data['totalItems'] = totalItems;
    return data;
  }
}
