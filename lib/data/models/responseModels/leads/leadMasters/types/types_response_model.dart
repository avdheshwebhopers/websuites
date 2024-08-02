
class LeadMasterTypesResponseModel {
  String? id;
  String? name;
  String? sub_types;
  String? status;
  String? created_at;
  String? updated_at;
  int? activity_chart_interval;
  String? activity_chart_interval_y;
  String? activity_chart_interval_x;
  bool? isReminderRequired;
  bool? remove_from_todo;
  bool? remove_from_list;
  List<Children>? children;
  bool? hasReminderableChildren;

  LeadMasterTypesResponseModel({
    this.id,
    this.name,
    this.sub_types,
    this.status,
    this.created_at,
    this.updated_at,
    this.activity_chart_interval,
    this.activity_chart_interval_y,
    this.activity_chart_interval_x,
    this.isReminderRequired,
    this.remove_from_todo,
    this.remove_from_list,
    this.children,
    this.hasReminderableChildren
});
  
  LeadMasterTypesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sub_types = json['sub_types'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    activity_chart_interval = json['activity_chart_interval'];
    activity_chart_interval_y = json['activity_chart_interval_y'];
    activity_chart_interval_x = json['activity_chart_interval_x'];
    isReminderRequired = json['isReminderRequired'];
    remove_from_todo = json['remove_from_todo'];
    remove_from_list = json['remove_from_list'];
    if(json['children'] != null) {
      children = <Children>[];
      json['children'].ForEach ((v){
        children !.add(Children.fromJson(v));
      });
      hasReminderableChildren = json['hasReminderableChildren'];
    }
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['sub_types'] = sub_types;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['activity_chart_interval'] = activity_chart_interval;
    data['activity_chart_interval_y'] = activity_chart_interval_y;
    data['activity_chart_interval_x'] = activity_chart_interval_x;
    data['isReminderRequired'] = isReminderRequired;
    data['remove_from_todo'] = remove_from_todo;
    data['remove_from_list'] = remove_from_list;
    if(children != null){
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['hasReminderableChildren'] = hasReminderableChildren;
    return data;
  }
}

class Children {
  String? id;
  String? name;
  String? sub_types;
  String? status;
  String? created_at;
  String? updated_at;
  int? activity_chart_interval;
  String? activity_chart_label_y;
  String? activity_chart_label_x;
  bool? isReminderRequired;
  bool? remove_from_todo;
  bool? remove_from_list;

  Children({
    this.id,
    this.name,
    this.sub_types,
    this.status,
    this.created_at,
    this.updated_at,
    this.activity_chart_interval,
    this.activity_chart_label_x,
    this.activity_chart_label_y,
    this.isReminderRequired,
    this.remove_from_todo,
    this.remove_from_list
});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sub_types = json['sub_types'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    activity_chart_interval = json['activity_chart_interval'];
    activity_chart_label_x = json['activity_chart_label_x'];
    activity_chart_label_y = json['activity_chart_label_y'];
    isReminderRequired = json['isReminderRequired'];
    remove_from_todo = json['remove_from_todo'];
    remove_from_list = json['remove_from_list'];
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sub_types'] = sub_types;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['activity_chart_label_x'] = activity_chart_label_x;
    data['activity_chart_label_y'] = activity_chart_label_y;
    data['activity_chart_interval'] = activity_chart_interval;
    data['isReminderRequired'] = isReminderRequired;
    data['remove_from_todo'] = remove_from_todo;
    data['remove_from_list'] = remove_from_list;
    return data;
  }
}