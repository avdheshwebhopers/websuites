class TasksReportResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;

  TasksReportResponseModel({this.items, this.meta, this.userKey});

  TasksReportResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    userKey = json['user_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = userKey;
    return data;
  }
}

class Items {
  String? user;
  String? email;
  CurrentTask? currentTask;
  List<TaskList>? taskList;

  Items({this.user, this.email, this.currentTask, this.taskList});

  Items.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    email = json['email'];
    currentTask = json['currentTask'] != null
        ? CurrentTask.fromJson(json['currentTask'])
        : null;
    if (json['taskList'] != null) {
      taskList = <TaskList>[];
      json['taskList'].forEach((v) {
        taskList!.add(TaskList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['email'] = email;
    if (currentTask != null) {
      data['currentTask'] = currentTask!.toJson();
    }
    if (taskList != null) {
      data['taskList'] = taskList!.map((v) => toJson()).toList();
    }
    return data;
  }
}

class TaskList {
  String? id;

  TaskList({
    this.id
});

  TaskList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class CurrentTask {
  String? id;
  String? dateTime;
  String? action;
  String? createdAt;
  String? updatedAt;
  Task? task;
  String? todayStart;

  CurrentTask(
      {this.id,
        this.dateTime,
        this.action,
        this.createdAt,
        this.updatedAt,
        this.task,
        this.todayStart});

  CurrentTask.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['date_time'];
    action = json['action'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
    todayStart = json['today_start'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date_time'] = dateTime;
    data['action'] = action;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (task != null) {
      data['task'] = task!.toJson();
    }
    data['today_start'] = todayStart;
    return data;
  }
}

class Task {
  String? id;
  String? subject;
  String? description;
  String? startDate;
  String? deadline;
  String? priority;
  String? statusDateTime;
  int? estimatedMinutes;
  int? timeTaken;
  String? createdAt;
  String? updatedAt;
  bool? isSequentialTask;
  int? order;

  Task(
      {this.id,
        this.subject,
        this.description,
        this.startDate,
        this.deadline,
        this.priority,
        this.statusDateTime,
        this.estimatedMinutes,
        this.timeTaken,
        this.createdAt,
        this.updatedAt,
        this.isSequentialTask,
        this.order});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    description = json['description'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    priority = json['priority'];
    statusDateTime = json['status_date_time'];
    estimatedMinutes = json['estimated_minutes'];
    timeTaken = json['time_taken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isSequentialTask = json['is_sequential_task'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['subject'] = subject;
    data['description'] = description;
    data['start_date'] = startDate;
    data['deadline'] = deadline;
    data['priority'] = priority;
    data['status_date_time'] = statusDateTime;
    data['estimated_minutes'] = estimatedMinutes;
    data['time_taken'] = timeTaken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_sequential_task'] = isSequentialTask;
    data['order'] = order;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    return data;
  }
}