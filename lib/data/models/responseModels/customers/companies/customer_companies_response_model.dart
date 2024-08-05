class CustomerCompaniesResponseModel {
  List<Items>? items;
  Meta? meta;

  CustomerCompaniesResponseModel({this.items, this.meta});

  CustomerCompaniesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Items {
  String? id;
  String? company_name;
  String? company_email;
  String? company_phone;
  int? country_code;
  String? contact_person_name;
  String? contact_person_number;
  int? c_country_code;
  String? address;
  String? website;
  String? gst;
  String? logo;
  int? lat;
  int? lng;
  Customer? customer;
  Parent? parent;

  Items(
      {this.id,
        this.company_name,
        this.company_email,
        this.company_phone,
        this.country_code,
        this.contact_person_name,
        this.contact_person_number,
        this.c_country_code,
        this.address,
        this.website,
        this.gst,
        this.logo,
        this.lat,
        this.lng,
        this.customer,
        this.parent});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    company_email = json['company_email'];
    company_phone = json['company_phone'];
    country_code = json['country_code'];
    contact_person_name = json['contact_person_name'];
    contact_person_number = json['contact_person_number'];
    c_country_code = json['c_country_code'];
    address = json['address'];
    website = json['website'];
    gst = json['gst'];
    logo = json['logo'];
    lat = json['lat'];
    lng = json['lng'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    parent =
    json['parent'] != null ? Parent.fromJson(json['parent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    data['company_email'] = company_email;
    data['company_phone'] = company_phone;
    data['country_code'] = country_code;
    data['contact_person_name'] = contact_person_name;
    data['contact_person_number'] = contact_person_number;
    data['c_country_code'] = c_country_code;
    data['address'] = address;
    data['website'] = website;
    data['gst'] = gst;
    data['logo'] = logo;
    data['lat'] = lat;
    data['lng'] = lng;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (parent != null) {
      data['parent'] = parent!.toJson();
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

class Parent {
  String? id;
  String? company_name;
  String? company_email;
  String? company_phone;
  int? country_code;
  String? contact_person_name;
  String? contact_person_number;
  int? c_country_code;
  String? address;
  String? website;
  String? gst;
  String? logo;
  int? lat;
  int? lng;

  Parent(
      {this.id,
        this.company_name,
        this.company_email,
        this.company_phone,
        this.country_code,
        this.contact_person_name,
        this.contact_person_number,
        this.c_country_code,
        this.address,
        this.website,
        this.gst,
        this.logo,
        this.lat,
        this.lng});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    company_email = json['company_email'];
    company_phone = json['company_phone'];
    country_code = json['country_code'];
    contact_person_name = json['contact_person_name'];
    contact_person_number = json['contact_person_number'];
    c_country_code = json['c_country_code'];
    address = json['address'];
    website = json['website'];
    gst = json['gst'];
    logo = json['logo'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    data['company_email'] = company_email;
    data['company_phone'] = company_phone;
    data['country_code'] = country_code;
    data['contact_person_name'] = contact_person_name;
    data['contact_person_number'] = contact_person_number;
    data['c_country_code'] = c_country_code;
    data['address'] = address;
    data['website'] = website;
    data['gst'] = gst;
    data['logo'] = logo;
    data['lat'] = lat;
    data['lng'] = lng;
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