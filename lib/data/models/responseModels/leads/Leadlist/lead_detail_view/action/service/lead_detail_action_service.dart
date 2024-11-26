class LeadDetailActionServiceResponseModel {
  String? activity;
  String? remark;
  String? services;
  double? lat;
  double? lng;
  Lead? lead;
  dynamic subActivity;
  dynamic leadType;
  dynamic subLeadType;
  dynamic leadStatus;
  dynamic visitedWith;
  dynamic createdBy;
  dynamic reminderTo;
  dynamic leadStatusValue;
  dynamic reminder;
  dynamic meetingWith;
  dynamic meetingWithName;
  dynamic meetingWithPhone;
  dynamic dateContacted;
  dynamic ccTo;
  dynamic remoteLocation;
  dynamic recordFile;
  dynamic callActivtyDescription;
  String? id;
  bool? reminderStatus;
  int? meetingWithCountryCode;
  bool? informedToCustomer;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? callDuration;

  LeadDetailActionServiceResponseModel(
      {this.activity,
        this.remark,
        this.services,
        this.lat,
        this.lng,
        this.lead,
        this.subActivity,
        this.leadType,
        this.subLeadType,
        this.leadStatus,
        this.visitedWith,
        this.createdBy,
        this.reminderTo,
        this.leadStatusValue,
        this.reminder,
        this.meetingWith,
        this.meetingWithName,
        this.meetingWithPhone,
        this.dateContacted,
        this.ccTo,
        this.remoteLocation,
        this.recordFile,
        this.callActivtyDescription,
        this.id,
        this.reminderStatus,
        this.meetingWithCountryCode,
        this.informedToCustomer,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.callDuration});

  LeadDetailActionServiceResponseModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    remark = json['remark'];
    services = json['services'];
    lat = json['lat'];
    lng = json['lng'];
    lead = json['lead'] != null ? new Lead.fromJson(json['lead']) : null;
    subActivity = json['sub_activity'];
    leadType = json['lead_type'];
    subLeadType = json['sub_lead_type'];
    leadStatus = json['lead_status'];
    visitedWith = json['visited_with'];
    createdBy = json['created_by'] != null
        ? new Lead.fromJson(json['created_by'])
        : null;
    reminderTo = json['reminder_to'] != null
        ? new Lead.fromJson(json['reminder_to'])
        : null;
    leadStatus = json['leadStatus'];
    reminder = json['reminder'];
    meetingWith = json['meeting_with'];
    meetingWithName = json['meeting_with_name'];
    meetingWithPhone = json['meeting_with_phone'];
    dateContacted = json['date_contacted'];
    ccTo = json['cc_to'];
    remoteLocation = json['remote_location'];
    recordFile = json['record_file'];
    callActivtyDescription = json['call_activty_description'];
    id = json['id'];
    reminderStatus = json['reminder_status'];
    meetingWithCountryCode = json['meeting_with_country_code'];
    informedToCustomer = json['informed_to_customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    callDuration = json['call_duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['remark'] = this.remark;
    data['services'] = this.services;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.lead != null) {
      data['lead'] = this.lead!.toJson();
    }
    data['sub_activity'] = this.subActivity;
    data['lead_type'] = this.leadType;
    data['sub_lead_type'] = this.subLeadType;
    data['lead_status'] = this.leadStatus;
    data['visited_with'] = this.visitedWith;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    if (this.reminderTo != null) {
      data['reminder_to'] = this.reminderTo!.toJson();
    }
    data['leadStatus'] = this.leadStatus;
    data['reminder'] = this.reminder;
    data['meeting_with'] = this.meetingWith;
    data['meeting_with_name'] = this.meetingWithName;
    data['meeting_with_phone'] = this.meetingWithPhone;
    data['date_contacted'] = this.dateContacted;
    data['cc_to'] = this.ccTo;
    data['remote_location'] = this.remoteLocation;
    data['record_file'] = this.recordFile;
    data['call_activty_description'] = this.callActivtyDescription;
    data['id'] = this.id;
    data['reminder_status'] = this.reminderStatus;
    data['meeting_with_country_code'] = this.meetingWithCountryCode;
    data['informed_to_customer'] = this.informedToCustomer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['call_duration'] = this.callDuration;
    return data;
  }
}

class Lead {
  String? id;

  Lead({this.id});

  Lead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}