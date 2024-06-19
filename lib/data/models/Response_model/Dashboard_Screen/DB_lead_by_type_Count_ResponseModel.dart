class Dashboard_Leads_By_Type_Count_Response_Model {
  String? id;
  String? name;
  Null subTypes;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? activityChartInterval;
  Null activityChartLabelY;
  String? activityChartLabelX;
  bool? isReminderRequired;
  bool? removeFromTodo;
  bool? removeFromList;
  Null leads;
  int? leadCount;

  Dashboard_Leads_By_Type_Count_Response_Model(
      {this.id,
        this.name,
        this.subTypes,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.activityChartInterval,
        this.activityChartLabelY,
        this.activityChartLabelX,
        this.isReminderRequired,
        this.removeFromTodo,
        this.removeFromList,
        this.leads,
        this.leadCount});

  Dashboard_Leads_By_Type_Count_Response_Model.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    subTypes = json['sub_types'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activityChartInterval = json['activity_chart_interval'];
    activityChartLabelY = json['activity_chart_label_y'];
    activityChartLabelX = json['activity_chart_label_x'];
    isReminderRequired = json['isReminderRequired'];
    removeFromTodo = json['remove_from_todo'];
    removeFromList = json['remove_from_list'];
    leads = json['leads'];
    leadCount = json['leadCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sub_types'] = subTypes;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['activity_chart_interval'] = activityChartInterval;
    data['activity_chart_label_y'] = activityChartLabelY;
    data['activity_chart_label_x'] = activityChartLabelX;
    data['isReminderRequired'] = isReminderRequired;
    data['remove_from_todo'] = removeFromTodo;
    data['remove_from_list'] = removeFromList;
    data['leads'] = leads;
    data['leadCount'] = leadCount;
    return data;
  }
}