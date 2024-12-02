class HrmLeaveResponseModel {
  String? id;
  String? type;
  String? name;
  String? short_code;
  String? paid_option;
  String? description;
  bool? is_employee_view_description;
  bool? is_sick_leave;
  String? limit_gender;
  String? limit_martial_status;
  bool? status;
  String? created_at;
  String? updated_at;
  List<Reason>? reason;

  HrmLeaveResponseModel({
    this.id,
    this.type,
    this.name,
    this.short_code,
    this.paid_option,
    this.description,
    this.is_employee_view_description,
    this.is_sick_leave,
    this.updated_at,
    this.created_at,
    this.reason
  });

  HrmLeaveResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    short_code = json['short_code'];
    paid_option = json['paid_option'];
    description = json['description'];
    is_employee_view_description = json['is_employee_view_description'];
    is_sick_leave = json['is_sick_leave'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
    if(json['reason'] != null){
      reason = <Reason>[];
      json['reason'].forEach((v){
        reason!.add(Reason.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['short_code'] = short_code;
    data['paid_option'] = paid_option;
    data['description'] = description;
    data['is_employee_view_description'] = is_employee_view_description;
    data['is_sick_leave'] = is_sick_leave;
    data['updated_at'] = updated_at;
    data['created_at'] = created_at;
    if (reason != null) {
      data['reason'] != reason !.map((v) => toJson()).toList();
    }
    return data;
  }
}

class Reason{
  String? id;
  String? name;

  Reason({
    this.name,
    this.id
  });

  Reason.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}