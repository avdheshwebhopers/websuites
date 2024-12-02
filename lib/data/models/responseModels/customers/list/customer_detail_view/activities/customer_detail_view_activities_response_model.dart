class CustomerDetailViewActivitiesResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;

  CustomerDetailViewActivitiesResponseModel(
      {this.items, this.meta, this.userKey});

  CustomerDetailViewActivitiesResponseModel.fromJson(
      Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    userKey = json['user_key'];
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
    return data;
  }
}

class Items {
  String? id;
  String? activity;
  String? remark;
  String? reminder;
  bool? reminderStatus;
  String? meetingWith;
  String? meetingWithName;
  String? meetingWithPhone;
  Null? dateContacted;
  Null? services;
  String? lat;
  String? lng;
  Null? remoteLocation;
  Null? ccTo;
  bool? informedToCustomer;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  int? callDuration;
  Null? recordFile;
  String? callActivtyDescription;
  Customer? customer;
  SubActivity? subActivity;
  Null? customerType;
  Null? screenshot;
  VisitedWith? visitedWith;
  VisitedWith? createdBy;
  VisitedWith? reminderTo;

  Items(
      {this.id,
        this.activity,
        this.remark,
        this.reminder,
        this.reminderStatus,
        this.meetingWith,
        this.meetingWithName,
        this.meetingWithPhone,
        this.dateContacted,
        this.services,
        this.lat,
        this.lng,
        this.remoteLocation,
        this.ccTo,
        this.informedToCustomer,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.callDuration,
        this.recordFile,
        this.callActivtyDescription,
        this.customer,
        this.subActivity,
        this.customerType,
        this.screenshot,
        this.visitedWith,
        this.createdBy,
        this.reminderTo});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    remark = json['remark'];
    reminder = json['reminder'];
    reminderStatus = json['reminder_status'];
    meetingWith = json['meeting_with'];
    meetingWithName = json['meeting_with_name'];
    meetingWithPhone = json['meeting_with_phone'];
    dateContacted = json['date_contacted'];
    services = json['services'];
    lat = json['lat'];
    lng = json['lng'];
    remoteLocation = json['remote_location'];
    ccTo = json['cc_to'];
    informedToCustomer = json['informed_to_customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    callDuration = json['call_duration'];
    recordFile = json['record_file'];
    callActivtyDescription = json['call_activty_description'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    subActivity = json['sub_activity'] != null
        ? new SubActivity.fromJson(json['sub_activity'])
        : null;
    customerType = json['customer_type'];
    screenshot = json['screenshot'];
    visitedWith = json['visited_with'] != null
        ? new VisitedWith.fromJson(json['visited_with'])
        : null;
    createdBy = json['created_by'] != null
        ? new VisitedWith.fromJson(json['created_by'])
        : null;
    reminderTo = json['reminder_to'] != null
        ? new VisitedWith.fromJson(json['reminder_to'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity'] = this.activity;
    data['remark'] = this.remark;
    data['reminder'] = this.reminder;
    data['reminder_status'] = this.reminderStatus;
    data['meeting_with'] = this.meetingWith;
    data['meeting_with_name'] = this.meetingWithName;
    data['meeting_with_phone'] = this.meetingWithPhone;
    data['date_contacted'] = this.dateContacted;
    data['services'] = this.services;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['remote_location'] = this.remoteLocation;
    data['cc_to'] = this.ccTo;
    data['informed_to_customer'] = this.informedToCustomer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['call_duration'] = this.callDuration;
    data['record_file'] = this.recordFile;
    data['call_activty_description'] = this.callActivtyDescription;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.subActivity != null) {
      data['sub_activity'] = this.subActivity!.toJson();
    }
    data['customer_type'] = this.customerType;
    data['screenshot'] = this.screenshot;
    if (this.visitedWith != null) {
      data['visited_with'] = this.visitedWith!.toJson();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    if (this.reminderTo != null) {
      data['reminder_to'] = this.reminderTo!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  int? countryCode;
  String? primaryContact;
  String? organization;
  List<String>? websites;
  String? primaryAddress;
  Null? profileImage;
  Null? dob;
  String? gstin;
  String? aboutClient;
  String? otherInformation;
  double? lat;
  double? lng;
  Null? joinedAt;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? deleteRemark;
  Null? zohoContactId;
  String? status;
  Null? subStatus;

  Customer(
      {this.id,
        this.firstName,
        this.lastName,
        this.primaryEmail,
        this.countryCode,
        this.primaryContact,
        this.organization,
        this.websites,
        this.primaryAddress,
        this.profileImage,
        this.dob,
        this.gstin,
        this.aboutClient,
        this.otherInformation,
        this.lat,
        this.lng,
        this.joinedAt,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.deleteRemark,
        this.zohoContactId,
        this.status,
        this.subStatus});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    primaryEmail = json['primary_email'];
    countryCode = json['country_code'];
    primaryContact = json['primary_contact'];
    organization = json['organization'];
    websites = json['websites'].cast<String>();
    primaryAddress = json['primary_address'];
    profileImage = json['profile_image'];
    dob = json['dob'];
    gstin = json['gstin'];
    aboutClient = json['about_client'];
    otherInformation = json['other_information'];
    lat = json['lat'];
    lng = json['lng'];
    joinedAt = json['joined_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deleteRemark = json['delete_remark'];
    zohoContactId = json['zoho_contact_id'];
    status = json['status'];
    subStatus = json['subStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['primary_email'] = this.primaryEmail;
    data['country_code'] = this.countryCode;
    data['primary_contact'] = this.primaryContact;
    data['organization'] = this.organization;
    data['websites'] = this.websites;
    data['primary_address'] = this.primaryAddress;
    data['profile_image'] = this.profileImage;
    data['dob'] = this.dob;
    data['gstin'] = this.gstin;
    data['about_client'] = this.aboutClient;
    data['other_information'] = this.otherInformation;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['joined_at'] = this.joinedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['delete_remark'] = this.deleteRemark;
    data['zoho_contact_id'] = this.zohoContactId;
    data['status'] = this.status;
    data['subStatus'] = this.subStatus;
    return data;
  }
}

class SubActivity {
  String? id;
  String? type;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  SubActivity(
      {this.id,
        this.type,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  SubActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class VisitedWith {
  String? id;
  String? firstName;
  String? lastName;

  VisitedWith({this.id, this.firstName, this.lastName});

  VisitedWith.fromJson(Map<String, dynamic> json) {
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