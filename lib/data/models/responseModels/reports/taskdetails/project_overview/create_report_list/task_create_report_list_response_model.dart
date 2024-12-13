class CreateReportListResponseModel {
  String? title;
  String? description;
  String? startDate;
  String? endDate;
  String? ccTo;
  Project? project;
  Customer? customer;
  CreatedBy? createdBy;
  String? id;
  String? createdAt;
  String? updateAt;

  CreateReportListResponseModel(
      {this.title,
      this.description,
      this.startDate,
      this.endDate,
      this.ccTo,
      this.project,
      this.customer,
      this.createdBy,
      this.id,
      this.createdAt,
      this.updateAt});

  CreateReportListResponseModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    ccTo = json['cc_to'];
    project =
        json['project'] != null ? new Project.fromJson(json['project']) : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    id = json['id'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['cc_to'] = this.ccTo;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}

class Project {
  String? id;
  String? projectName;
  String? billingType;
  String? status;
  int? totalRate;
  int? estimatedHours;
  String? startDate;
  dynamic deadline;
  String? description;
  String? demoUrl;
  dynamic finishDate;
  String? liveUrl;
  String? createdAt;
  String? updatedAt;
  Customer? customer;
  Company? company;

  Project(
      {this.id,
      this.projectName,
      this.billingType,
      this.status,
      this.totalRate,
      this.estimatedHours,
      this.startDate,
      this.deadline,
      this.description,
      this.demoUrl,
      this.finishDate,
      this.liveUrl,
      this.createdAt,
      this.updatedAt,
      this.customer,
      this.company});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
    billingType = json['billing_type'];
    status = json['status'];
    totalRate = json['total_rate'];
    estimatedHours = json['estimated_hours'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    description = json['description'];
    demoUrl = json['demo_url'];
    finishDate = json['finish_date'];
    liveUrl = json['live_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    data['billing_type'] = this.billingType;
    data['status'] = this.status;
    data['total_rate'] = this.totalRate;
    data['estimated_hours'] = this.estimatedHours;
    data['start_date'] = this.startDate;
    data['deadline'] = this.deadline;
    data['description'] = this.description;
    data['demo_url'] = this.demoUrl;
    data['finish_date'] = this.finishDate;
    data['live_url'] = this.liveUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
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
  List<Null>? websites;
  String? primaryAddress;
  dynamic profileImage;
  dynamic dob;
  dynamic gstin;
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
  List< dynamic>? customerToCustomFields;

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
      this.subStatus,
      this.customerToCustomFields});

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
    if (json['customerToCustomFields'] != null) {
      customerToCustomFields = <Null>[];
      json['customerToCustomFields'].forEach((v) {
        customerToCustomFields!.add((v));
      });
    }
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
    if (this.customerToCustomFields != null) {
      data['customerToCustomFields'] =
          this.customerToCustomFields!.map((v) => ()).toList();
    }
    return data;
  }
}

class Company {
  String? id;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  int? countryCode;
  String? contactPersonName;
  String? contactPersonNumber;
  int? cCountryCode;
  String? address;
  dynamic website;
  dynamic gst;
  dynamic logo;
  int? lat;
  int? lng;

  Company(
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
      this.lng});

  Company.fromJson(Map<String, dynamic> json) {
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
      this.parent,
      this.roleList,
      this.department,
      this.mailjetSender,
      this.smtpSender});

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
      json['role_list'].forEach((v) {
        roleList!.add(new RoleList.fromJson(v));
      });
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
