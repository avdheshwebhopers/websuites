class IncentiveBreakdownAddResponseModel {
  int? achievePercentage;
  int? incentive;
  String? incentiveType;
  TargetIncentiveMember? targetIncentiveMember;
  CreatedBy? createdBy;
  String? id;
  String? createdAt;
  String? updatedAt;

  IncentiveBreakdownAddResponseModel({this.achievePercentage, this.incentive, this.incentiveType, this.targetIncentiveMember, this.createdBy, this.id, this.createdAt, this.updatedAt});

  IncentiveBreakdownAddResponseModel.fromJson(Map<String, dynamic> json) {
    achievePercentage = json['achieve_percentage'];
    incentive = json['incentive'];
    incentiveType = json['incentive_type'];
    targetIncentiveMember = json['target_incentive_member'] != null ? new TargetIncentiveMember.fromJson(json['target_incentive_member']) : null;
    createdBy = json['created_by'] != null ? new CreatedBy.fromJson(json['created_by']) : null;
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['achieve_percentage'] = this.achievePercentage;
    data['incentive'] = this.incentive;
    data['incentive_type'] = this.incentiveType;
    if (this.targetIncentiveMember != null) {
      data['target_incentive_member'] = this.targetIncentiveMember!.toJson();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TargetIncentiveMember {
  String? id;
  int? saleTarget;
  String? createdAt;
  String? updatedAt;
  TargetIncentive? targetIncentive;

  TargetIncentiveMember({this.id, this.saleTarget, this.createdAt, this.updatedAt, this.targetIncentive});

  TargetIncentiveMember.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleTarget = json['sale_target'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    targetIncentive = json['target_incentive'] != null ? new TargetIncentive.fromJson(json['target_incentive']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sale_target'] = this.saleTarget;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.targetIncentive != null) {
      data['target_incentive'] = this.targetIncentive!.toJson();
    }
    return data;
  }
}

class TargetIncentive {
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  int? saleTarget;
  Team? team;
  String? createdAt;
  String? updatedAt;

  TargetIncentive({this.id, this.name, this.startDate, this.endDate, this.saleTarget, this.team, this.createdAt, this.updatedAt});

  TargetIncentive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    saleTarget = json['sale_target'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['sale_target'] = this.saleTarget;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Team {
  String? id;
  dynamic bio;
  String? email;
  String? mobile;
  bool? status;
  dynamic address;
  bool? defaultAt;
  List<Null>? children;
  String? password;
  bool? tracking;
  String? deviceId;
  String? lastName;
  List<RoleList>? roleList;
  dynamic smsSender;
  String? createdAt;
  String? firstName;
  bool? mobileApp;
  dynamic smtpSender;
  String? updatedAt;
  dynamic profilePic;
  String? crmCategory;
  dynamic mailjetSender;
  bool? superSettings;
  String? rememberToken;
  String? rememberTokenTime;

  Team({this.id, this.bio, this.email, this.mobile, this.status, this.address, this.defaultAt, this.children, this.password, this.tracking, this.deviceId, this.lastName, this.roleList, this.smsSender, this.createdAt, this.firstName, this.mobileApp, this.smtpSender, this.updatedAt, this.profilePic, this.crmCategory, this.mailjetSender, this.superSettings, this.rememberToken, this.rememberTokenTime});

Team.fromJson(Map<String, dynamic> json) {
id = json['id'];
bio = json['bio'];
email = json['email'];
mobile = json['mobile'];
status = json['status'];
address = json['address'];
defaultAt = json['default'];
if (json['children'] != null) {
children = <Null>[];
json['children'].forEach((v) { children!.add((v)); });
}
password = json['password'];
tracking = json['tracking'];
deviceId = json['device_id'];
lastName = json['last_name'];
if (json['role_list'] != null) {
roleList = <RoleList>[];
json['role_list'].forEach((v) { roleList!.add(new RoleList.fromJson(v)); });
}
smsSender = json['smsSender'];
createdAt = json['created_at'];
firstName = json['first_name'];
mobileApp = json['mobile_app'];
smtpSender = json['smtpSender'];
updatedAt = json['updated_at'];
profilePic = json['profile_pic'];
crmCategory = json['crm_category'];
mailjetSender = json['mailjetSender'];
superSettings = json['superSettings'];
rememberToken = json['remember_token'];
rememberTokenTime = json['remember_token_time'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['bio'] = this.bio;
data['email'] = this.email;
data['mobile'] = this.mobile;
data['status'] = this.status;
data['address'] = this.address;
data['default'] = this.defaultAt;
if (this.children != null) {
data['children'] = this.children!.map((v) => ()).toList();
}
data['password'] = this.password;
data['tracking'] = this.tracking;
data['device_id'] = this.deviceId;
data['last_name'] = this.lastName;
if (this.roleList != null) {
data['role_list'] = this.roleList!.map((v) => v.toJson()).toList();
}
data['smsSender'] = this.smsSender;
data['created_at'] = this.createdAt;
data['first_name'] = this.firstName;
data['mobile_app'] = this.mobileApp;
data['smtpSender'] = this.smtpSender;
data['updated_at'] = this.updatedAt;
data['profile_pic'] = this.profilePic;
data['crm_category'] = this.crmCategory;
data['mailjetSender'] = this.mailjetSender;
data['superSettings'] = this.superSettings;
data['remember_token'] = this.rememberToken;
data['remember_token_time'] = this.rememberTokenTime;
return data;
}
}

class RoleList {
String? id;
String? name;
bool? defaultAt;
String? description;

RoleList({this.id, this.name, this.defaultAt, this.description});

RoleList.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
defaultAt = json['default'];
description = json['description'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['default'] = this.defaultAt;
data['description'] = this.description;
return data;
}
}

class CreatedBy {
String? id;
String? firstName;
String? lastName;
String? email;
String? mobile;
String? address;
String? bio;
dynamic profilePic;
String? password;
bool? status;
dynamic rememberToken;
dynamic rememberTokenTime;
bool? defaultAt;
String? createdAt;
String? updatedAt;
String? deviceId;
bool? tracking;
String? crmCategory;
bool? mobileApp;
bool? superSettings;
dynamic parent;
List<RoleList>? roleList;
dynamic department;
dynamic mailjetSender;
dynamic smtpSender;

CreatedBy({this.id, this.firstName, this.lastName, this.email, this.mobile, this.address, this.bio, this.profilePic, this.password, this.status, this.rememberToken, this.rememberTokenTime, this.defaultAt, this.createdAt, this.updatedAt, this.deviceId, this.tracking, this.crmCategory, this.mobileApp, this.superSettings, this.parent, this.roleList, this.department, this.mailjetSender, this.smtpSender});

CreatedBy.fromJson(Map<String, dynamic> json) {
id = json['id'];
firstName = json['first_name'];
lastName = json['last_name'];
email = json['email'];
mobile = json['mobile'];
address = json['address'];
bio = json['bio'];
profilePic = json['profile_pic'];
password = json['password'];
status = json['status'];
rememberToken = json['remember_token'];
rememberTokenTime = json['remember_token_time'];
defaultAt = json['default'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
deviceId = json['device_id'];
tracking = json['tracking'];
crmCategory = json['crm_category'];
mobileApp = json['mobile_app'];
superSettings = json['superSettings'];
parent = json['parent'];
if (json['role_list'] != null) {
roleList = <RoleList>[];
json['role_list'].forEach((v) { roleList!.add(new RoleList.fromJson(v)); });
}
department = json['department'];
mailjetSender = json['mailjetSender'];
smtpSender = json['smtpSender'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['first_name'] = this.firstName;
data['last_name'] = this.lastName;
data['email'] = this.email;
data['mobile'] = this.mobile;
data['address'] = this.address;
data['bio'] = this.bio;
data['profile_pic'] = this.profilePic;
data['password'] = this.password;
data['status'] = this.status;
data['remember_token'] = this.rememberToken;
data['remember_token_time'] = this.rememberTokenTime;
data['default'] = this.defaultAt;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
data['device_id'] = this.deviceId;
data['tracking'] = this.tracking;
data['crm_category'] = this.crmCategory;
data['mobile_app'] = this.mobileApp;
data['superSettings'] = this.superSettings;
data['parent'] = this.parent;
if (this.roleList != null) {
data['role_list'] = this.roleList!.map((v) => v.toJson()).toList();
}
data['department'] = this.department;
data['mailjetSender'] = this.mailjetSender;
data['smtpSender'] = this.smtpSender;
return data;
}
}