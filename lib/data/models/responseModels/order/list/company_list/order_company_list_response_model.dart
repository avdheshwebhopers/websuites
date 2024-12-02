class OrderCompanyResponseModel {
  List<Items>? items;
  Meta? meta;

  OrderCompanyResponseModel({this.items, this.meta});

  OrderCompanyResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Items {
  String? id;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  int? countryCode;
  String? contactPersonName;
  String? contactPersonNumber;
  int? cCountryCode;
  String? address;
  String? website;
  String? gst;
  dynamic logo;
  int? lat;
  int? lng;
  Customer? customer;
  dynamic parent;

  Items(
      {this.id,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.countryCode,
        this.contactPersonName,
        this.contactPersonNumber,
        this.cCountryCode,
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
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    countryCode = json['country_code'];
    contactPersonName = json['contact_person_name'];
    contactPersonNumber = json['contact_person_number'];
    cCountryCode = json['c_country_code'];
    address = json['address'];
    website = json['website'];
    gst = json['gst'];
    logo = json['logo'];
    lat = json['lat'];
    lng = json['lng'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['country_code'] = this.countryCode;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_number'] = this.contactPersonNumber;
    data['c_country_code'] = this.cCountryCode;
    data['address'] = this.address;
    data['website'] = this.website;
    data['gst'] = this.gst;
    data['logo'] = this.logo;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    data['parent'] = this.parent;
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
  List<dynamic>? websites;
  String? primaryAddress;
  dynamic profileImage;
  String? dob;
  String? gstin;
  String? aboutClient;
  String? otherInformation;
  int? lat;
  int? lng;
  dynamic joinedAt;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic deleteRemark;
  dynamic zohoContactId;
  String? status;
  dynamic subStatus;

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
    if (json['websites'] != null) {
      websites = <Null>[];
      json['websites'].forEach((v) {
        websites!.add((v));
      });
    }
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
    if (this.websites != null) {
      data['websites'] = this.websites!.map((v) => ()).toList();
    }
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