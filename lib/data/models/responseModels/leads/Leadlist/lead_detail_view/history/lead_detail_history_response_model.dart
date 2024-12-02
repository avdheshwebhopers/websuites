class LeadDetailHistoryResponseModel {
  String? id;
  String? activity;
  String? remark;
  String? leadStatus;
  String? reminder;
  bool? reminderStatus;
  dynamic meetingWith;
  dynamic meetingWithName;
  dynamic meetingWithPhone;
  int? meetingWithCountryCode;
  dynamic dateContacted;
  String? services;
  double? lat;
  double? lng;
  dynamic ccTo;
  bool? informedToCustomer;
  dynamic remoteLocation;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? callDuration;
  dynamic recordFile;
  dynamic callActivtyDescription;
  CreatedBy? createdBy;
  dynamic visitedWith;
  CreatedBy? reminderTo;
  dynamic screenshot;
  dynamic leadType;
  dynamic leadStatusValue;
  dynamic whatsappLog;

  LeadDetailHistoryResponseModel(
      {this.id,
      this.activity,
      this.remark,
      this.leadStatus,
      this.reminder,
      this.reminderStatus,
      this.meetingWith,
      this.meetingWithName,
      this.meetingWithPhone,
      this.meetingWithCountryCode,
      this.dateContacted,
      this.services,
      this.lat,
      this.lng,
      this.ccTo,
      this.informedToCustomer,
      this.remoteLocation,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.callDuration,
      this.recordFile,
      this.callActivtyDescription,
      this.createdBy,
      this.visitedWith,
      this.reminderTo,
      this.screenshot,
      this.leadType,
      this.leadStatusValue,
      this.whatsappLog});

  LeadDetailHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    remark = json['remark'];
    leadStatus = json['leadStatus'];
    reminder = json['reminder'];
    reminderStatus = json['reminder_status'];
    meetingWith = json['meeting_with'];
    meetingWithName = json['meeting_with_name'];
    meetingWithPhone = json['meeting_with_phone'];
    meetingWithCountryCode = json['meeting_with_country_code'];
    dateContacted = json['date_contacted'];
    services = json['services'];
    lat = json['lat'];
    lng = json['lng'];
    ccTo = json['cc_to'];
    informedToCustomer = json['informed_to_customer'];
    remoteLocation = json['remote_location'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    callDuration = json['call_duration'];
    recordFile = json['record_file'];
    callActivtyDescription = json['call_activty_description'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    visitedWith = json['visited_with'];
    reminderTo = json['reminder_to'] != null
        ? new CreatedBy.fromJson(json['reminder_to'])
        : null;
    screenshot = json['screenshot'];
    leadType = json['lead_type'];
    leadStatus = json['lead_status'];
    whatsappLog = json['whatsappLog'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity'] = this.activity;
    data['remark'] = this.remark;
    data['leadStatus'] = this.leadStatus;
    data['reminder'] = this.reminder;
    data['reminder_status'] = this.reminderStatus;
    data['meeting_with'] = this.meetingWith;
    data['meeting_with_name'] = this.meetingWithName;
    data['meeting_with_phone'] = this.meetingWithPhone;
    data['meeting_with_country_code'] = this.meetingWithCountryCode;
    data['date_contacted'] = this.dateContacted;
    data['services'] = this.services;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['cc_to'] = this.ccTo;
    data['informed_to_customer'] = this.informedToCustomer;
    data['remote_location'] = this.remoteLocation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['call_duration'] = this.callDuration;
    data['record_file'] = this.recordFile;
    data['call_activty_description'] = this.callActivtyDescription;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['visited_with'] = this.visitedWith;
    if (this.reminderTo != null) {
      data['reminder_to'] = this.reminderTo!.toJson();
    }
    data['screenshot'] = this.screenshot;
    data['lead_type'] = this.leadType;
    data['lead_status'] = this.leadStatus;
    data['whatsappLog'] = this.whatsappLog;
    return data;
  }
  static List<LeadDetailHistoryResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadDetailHistoryResponseModel.fromJson(json)).toList();
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
  String? profilePic;
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
  List<RoleList>? roleList;
  MailjetSender? mailjetSender;
  dynamic smtpSender;
  dynamic smsSender;

  CreatedBy(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.address,
      this.bio,
      this.profilePic,
      this.password,
      this.status,
      this.rememberToken,
      this.rememberTokenTime,
      this.defaultAt,
      this.createdAt,
      this.updatedAt,
      this.deviceId,
      this.tracking,
      this.crmCategory,
      this.mobileApp,
      this.superSettings,
      this.roleList,
      this.mailjetSender,
      this.smtpSender,
      this.smsSender});

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
    if (json['role_list'] != null) {
      roleList = <RoleList>[];
      json['role_list'].forEach((v) {
        roleList!.add(new RoleList.fromJson(v));
      });
    }
    mailjetSender = json['mailjetSender'] != null
        ? new MailjetSender.fromJson(json['mailjetSender'])
        : null;
    smtpSender = json['smtpSender'];
    smsSender = json['smsSender'];
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
    if (this.roleList != null) {
      data['role_list'] = this.roleList!.map((v) => v.toJson()).toList();
    }
    if (this.mailjetSender != null) {
      data['mailjetSender'] = this.mailjetSender!.toJson();
    }
    data['smtpSender'] = this.smtpSender;
    data['smsSender'] = this.smsSender;
    return data;
  }
}

class RoleList {
  String? id;
  String? name;
  String? description;
  bool? defaultAt;

  RoleList({this.id, this.name, this.description, this.defaultAt});

  RoleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    defaultAt = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['default'] = this.defaultAt;
    return data;
  }
}

class MailjetSender {
  String? id;
  String? provider;
  String? name;
  String? email;
  bool? status;
  String? mailjetSenderId;
  dynamic smtpHost;
  dynamic smtpPassword;
  dynamic smtpPort;
  dynamic smtpAuthentication;
  bool? isDefaultSender;
  String? createdAt;
  String? updatedAt;

  MailjetSender(
      {this.id,
      this.provider,
      this.name,
      this.email,
      this.status,
      this.mailjetSenderId,
      this.smtpHost,
      this.smtpPassword,
      this.smtpPort,
      this.smtpAuthentication,
      this.isDefaultSender,
      this.createdAt,
      this.updatedAt});

  MailjetSender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    provider = json['provider'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    mailjetSenderId = json['mailjet_sender_id'];
    smtpHost = json['smtp_host'];
    smtpPassword = json['smtp_password'];
    smtpPort = json['smtp_port'];
    smtpAuthentication = json['smtp_authentication'];
    isDefaultSender = json['is_default_sender'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['provider'] = this.provider;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['mailjet_sender_id'] = this.mailjetSenderId;
    data['smtp_host'] = this.smtpHost;
    data['smtp_password'] = this.smtpPassword;
    data['smtp_port'] = this.smtpPort;
    data['smtp_authentication'] = this.smtpAuthentication;
    data['is_default_sender'] = this.isDefaultSender;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
