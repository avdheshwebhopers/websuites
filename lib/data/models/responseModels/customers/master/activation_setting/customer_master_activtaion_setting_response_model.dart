class CustomerMasterActivationSettingResponseModel {
  List<Items>? items;
  Meta? meta;

  CustomerMasterActivationSettingResponseModel({this.items, this.meta});

  CustomerMasterActivationSettingResponseModel.fromJson(
      Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
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
  bool? isSentCustomer;
  String? createdAt;
  String? updatedAt;
  List<CcUsers>? ccUsers;
  MailTo? mailTo;
  Service? service;

  Items(
      {this.id,
      this.isSentCustomer,
      this.createdAt,
      this.updatedAt,
      this.ccUsers,
      this.mailTo,
      this.service});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSentCustomer = json['is_sent_customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['cc_users'] != null) {
      ccUsers = <CcUsers>[];
      json['cc_users'].forEach((v) {
        ccUsers!.add(CcUsers.fromJson(v));
      });
    }
    mailTo =
        json['mail_to'] != null ? MailTo.fromJson(json['mail_to']) : null;
    service =
        json['service'] != null ? Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_sent_customer'] = this.isSentCustomer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.ccUsers != null) {
      data['cc_users'] = this.ccUsers!.map((v) => v.toJson()).toList();
    }
    if (this.mailTo != null) {
      data['mail_to'] = this.mailTo!.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class CcUsers {
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
  String? rememberToken;
  Null rememberTokenTime;
  String? createdAt;
  String? updatedAt;
  Null deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;

  CcUsers(
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
      this.createdAt,
      this.updatedAt,
      this.deviceId,
      this.tracking,
      this.crmCategory,
      this.mobileApp,
      this.superSettings});

  CcUsers.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deviceId = json['device_id'];
    tracking = json['tracking'];
    crmCategory = json['crm_category'];
    mobileApp = json['mobile_app'];
    superSettings = json['superSettings'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['device_id'] = this.deviceId;
    data['tracking'] = this.tracking;
    data['crm_category'] = this.crmCategory;
    data['mobile_app'] = this.mobileApp;
    data['superSettings'] = this.superSettings;
    return data;
  }
}

class MailTo {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  Null address;
  Null bio;
  Null profilePic;
  String? password;
  bool? status;
  String? rememberToken;
  String? rememberTokenTime;
  String? createdAt;
  String? updatedAt;
  String? deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;

  MailTo(
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
      this.createdAt,
      this.updatedAt,
      this.deviceId,
      this.tracking,
      this.crmCategory,
      this.mobileApp,
      this.superSettings});

  MailTo.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deviceId = json['device_id'];
    tracking = json['tracking'];
    crmCategory = json['crm_category'];
    mobileApp = json['mobile_app'];
    superSettings = json['superSettings'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['device_id'] = this.deviceId;
    data['tracking'] = this.tracking;
    data['crm_category'] = this.crmCategory;
    data['mobile_app'] = this.mobileApp;
    data['superSettings'] = this.superSettings;
    return data;
  }
}

class Service {
  String? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Service(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
