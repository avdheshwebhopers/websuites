class CustomersActivitiesResponseModel {
  List<Items>? items;
  Meta? meta;
  String? user_key;

  CustomersActivitiesResponseModel({this.items, this.meta, this.user_key});

  CustomersActivitiesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    user_key = json['user_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = user_key;
    return data;
  }
}

class Items {
  String? id;
  String? activity;
  String? remark;
  String? reminder;
  bool? reminder_status;
  String? meeting_with;
  String? meeting_with_name;
  String? meeting_with_phone;
  String? date_contacted;
  String? services;
  String? lat;
  String? lng;
  String? remote_location;
  String? cc_to;
  bool? informed_to_customer;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  int? call_duration;
  String? record_file;
  String? call_activty_description;
  Customer? customer;
  SubActivity? sub_activity;
  String? customer_type;
  String? screenshot;
  VisitedWith? visited_with;
  VisitedWith? created_by;
  VisitedWith? reminder_to;

  Items(
      {this.id,
        this.activity,
        this.remark,
        this.reminder,
        this.reminder_status,
        this.meeting_with,
        this.meeting_with_name,
        this.meeting_with_phone,
        this.date_contacted,
        this.services,
        this.lat,
        this.lng,
        this.remote_location,
        this.cc_to,
        this.informed_to_customer,
        this.created_at,
        this.updated_at,
        this.deleted_at,
        this.call_duration,
        this.record_file,
        this.call_activty_description,
        this.customer,
        this.sub_activity,
        this.customer_type,
        this.screenshot,
        this.visited_with,
        this.created_by,
        this.reminder_to});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    remark = json['remark'];
    reminder = json['reminder'];
    reminder_status = json['reminder_status'];
    meeting_with = json['meeting_with'];
    meeting_with_name = json['meeting_with_name'];
    meeting_with_phone = json['meeting_with_phone'];
    date_contacted = json['date_contacted'];
    services = json['services'];
    lat = json['lat'];
    lng = json['lng'];
    remote_location = json['remote_location'];
    cc_to = json['cc_to'];
    informed_to_customer = json['informed_to_customer'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    call_duration = json['call_duration'];
    record_file = json['record_file'];
    call_activty_description = json['call_activty_description'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    sub_activity = json['sub_activity'] != null
        ? SubActivity.fromJson(json['sub_activity'])
        : null;
    customer_type = json['customer_type'];
    screenshot = json['screenshot'];
    visited_with = json['visited_with'] != null
        ? VisitedWith.fromJson(json['visited_with'])
        : null;
    created_by = json['created_by'] != null
        ? VisitedWith.fromJson(json['created_by'])
        : null;
    reminder_to = json['reminder_to'] != null
        ? VisitedWith.fromJson(json['reminder_to'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['activity'] = activity;
    data['remark'] = remark;
    data['reminder'] = reminder;
    data['reminder_status'] = reminder_status;
    data['meeting_with'] = meeting_with;
    data['meeting_with_name'] = meeting_with_name;
    data['meeting_with_phone'] = meeting_with_phone;
    data['date_contacted'] = date_contacted;
    data['services'] = services;
    data['lat'] = lat;
    data['lng'] = lng;
    data['remote_location'] = remote_location;
    data['cc_to'] = cc_to;
    data['informed_to_customer'] = informed_to_customer;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['call_duration'] = call_duration;
    data['record_file'] = record_file;
    data['call_activty_description'] = call_activty_description;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (sub_activity != null) {
      data['sub_activity'] = sub_activity!.toJson();
    }
    data['customer_type'] = customer_type;
    data['screenshot'] = screenshot;
    if (visited_with != null) {
      data['visited_with'] = visited_with!.toJson();
    }
    if (created_by != null) {
      data['created_by'] = created_by!.toJson();
    }
    if (reminder_to != null) {
      data['reminder_to'] = reminder_to!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? company_name;
  String? first_name;
  String? last_name;
  String? primary_email;
  int? country_code;
  String? primary_contact;
  String? organization;
  String? primary_address;
  String? profile_image;
  String? dob;
  String? about_client;
  String? other_information;
  double? lat;
  double? lng;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? delete_remark;
  String? zoho_contact_id;
  String? status;
  String? sub_status;

  Customer(
      {this.id,
        this.company_name,
        this.first_name,
        this.last_name,
        this.primary_email,
        this.country_code,
        this.primary_contact,
        this.organization,
        this.primary_address,
        this.profile_image,
        this.dob,
        this.about_client,
        this.other_information,
        this.lat,
        this.lng,
        this.created_at,
        this.updated_at,
        this.deleted_at,
        this.delete_remark,
        this.zoho_contact_id,
        this.status,
        this.sub_status});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    primary_email = json['primary_email'];
    country_code = json['country_code'];
    primary_contact = json['primary_contact'];
    organization = json['organization'];
    primary_address = json['primary_address'];
    profile_image = json['profile_image'];
    dob = json['dob'];
    about_client = json['about_client'];
    other_information = json['other_information'];
    lat = json['lat'];
    lng = json['lng'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    delete_remark = json['delete_remark'];
    zoho_contact_id = json['zoho_contact_id'];
    status = json['status'];
    sub_status = json['subStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['primary_email'] = primary_email;
    data['country_code'] = country_code;
    data['primary_contact'] = primary_contact;
    data['organization'] = organization;
    data['primary_address'] = primary_address;
    data['profile_image'] = profile_image;
    data['dob'] = dob;
    data['about_client'] = about_client;
    data['other_information'] = other_information;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['delete_remark'] = delete_remark;
    data['zoho_contact_id'] = zoho_contact_id;
    data['status'] = status;
    data['subStatus'] = sub_status;
    return data;
  }
}

class SubActivity {
  String? id;
  String? type;
  String? name;
  bool? status;
  String? created_at;
  String? updated_at;
  String? deleted_at;

  SubActivity(
      {this.id,
        this.type,
        this.name,
        this.status,
        this.created_at,
        this.updated_at,
        this.deleted_at});

  SubActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}

class VisitedWith {
  String? id;
  String? first_name;
  String? last_name;

  VisitedWith({this.id, this.first_name, this.last_name});

  VisitedWith.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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