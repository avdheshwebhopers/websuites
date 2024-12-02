import '../../../requestModels/dashboardScreen/db_transactions.dart';

class LeadListResponseModel {
  List<Items>? items;
  Meta? meta;
  Null userKey;

  LeadListResponseModel({this.items, this.meta, this.userKey});

  LeadListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
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
  String? id;
  String? firstName;
  String? lastName;
  int? countryCode;
  String? mobile;
  String? mobileWithCountrycode;
  String? email;
  String? organization;
  String? description;
  String? address;
  String? city;
  Null state;
  Null deadRemark;
  String? createdAt;
  String? updatedAt;
  String? latestEnquiryDate;
  String? leadStatus;
  Null type;
  Null subType;
  List<Enquiries>? enquiries;
  LastReminder? lastReminder;
  LastActivity? lastActivity;
  Pincode? pincode;
  Null leadCity;
  District? leadState;
  District? leadCountry;
  District? source;
  List<Divisions>? divisions;

  Items(
      {this.id,
        this.firstName,
        this.lastName,
        this.countryCode,
        this.mobile,
        this.mobileWithCountrycode,
        this.email,
        this.organization,
        this.description,
        this.address,
        this.city,
        this.state,
        this.deadRemark,
        this.createdAt,
        this.updatedAt,
        this.latestEnquiryDate,
        this.leadStatus,
        this.type,
        this.subType,
        this.enquiries,
        this.lastReminder,
        this.lastActivity,
        this.pincode,
        this.leadCity,
        this.leadState,
        this.leadCountry,
        this.source,
        this.divisions});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    mobileWithCountrycode = json['mobile_with_countrycode'];
    email = json['email'];
    organization = json['organization'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    deadRemark = json['dead_remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    latestEnquiryDate = json['latest_enquiry_date'];
    leadStatus = json['leadStatus'];
    type = json['type'];
    subType = json['sub_type'];
    if (json['enquiries'] != null) {
      enquiries = <Enquiries>[];
      json['enquiries'].forEach((v) {
        enquiries!.add(new Enquiries.fromJson(v));
      });
    }
    lastReminder = json['last_reminder'] != null
        ? LastReminder.fromJson(json['last_reminder'])
        : null;
    lastActivity = json['last_activity'] != null
        ? LastActivity.fromJson(json['last_activity'])
        : null;
    pincode =
    json['pincode'] != null ? new Pincode.fromJson(json['pincode']) : null;
    leadCity = json['lead_city'];
    leadState = json['lead_state'] != null
        ? new District.fromJson(json['lead_state'])
        : null;
    leadCountry = json['lead_country'] != null
        ? new District.fromJson(json['lead_country'])
        : null;
    source =
    json['source'] != null ? new District.fromJson(json['source']) : null;
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['mobile_with_countrycode'] = this.mobileWithCountrycode;
    data['email'] = this.email;
    data['organization'] = this.organization;
    data['description'] = this.description;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['dead_remark'] = this.deadRemark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['latest_enquiry_date'] = this.latestEnquiryDate;
    data['leadStatus'] = this.leadStatus;
    data['type'] = this.type;
    data['sub_type'] = this.subType;
    if (this.enquiries != null) {
      data['enquiries'] = this.enquiries!.map((v) => v.toJson()).toList();
    }
    if (this.lastReminder != null) {
      data['last_reminder'] = this.lastReminder!.toJson();
    }
    if (this.lastActivity != null) {
      data['last_activity'] = this.lastActivity!.toJson();
    }
    if (this.pincode != null) {
      data['pincode'] = this.pincode!.toJson();
    }
    data['lead_city'] = this.leadCity;
    if (this.leadState != null) {
      data['lead_state'] = this.leadState!.toJson();
    }
    if (this.leadCountry != null) {
      data['lead_country'] = this.leadCountry!.toJson();
    }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.divisions != null) {
      data['divisions'] = this.divisions!.map((v) => ()).toList();
    }
    return data;
  }
}

class Enquiries {
  String? id;

  Enquiries({this.id});

  Enquiries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class LastReminder {
  String? id;
  String? remark;
  String? reminder;
  bool? reminderStatus;
  String? createdAt;

  LastReminder(
      {this.id,
        this.remark,
        this.reminder,
        this.reminderStatus,
        this.createdAt});

  LastReminder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    remark = json['remark'];
    reminder = json['reminder'];
    reminderStatus = json['reminder_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['remark'] = this.remark;
    data['reminder'] = this.reminder;
    data['reminder_status'] = this.reminderStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class LastActivity {
  String? id;
  String? activity;
  String? remark;
  String? createdAt;

  LastActivity({this.id, this.activity, this.remark, this.createdAt});

  LastActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    remark = json['remark'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['activity'] = this.activity;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Pincode {
  String? id;
  String? code;
  District? district;

  Pincode({this.id, this.code, this.district});

  Pincode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    return data;
  }
}

class District {
  String? id;
  String? name;

  District({this.id, this.name});

  District.fromJson(Map<String, dynamic> json) {
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