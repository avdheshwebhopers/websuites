class DeleteListResponseModel {
  List<Item>? items;
  Meta? meta;

  DeleteListResponseModel({this.items, this.meta});

  factory DeleteListResponseModel.fromJson(Map<String, dynamic> json) {
    return DeleteListResponseModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => Item.fromJson(item))
          .toList(),
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items?.map((item) => item.toJson()).toList(),
      'meta': meta?.toJson(),
    };
  }
}

class Item {
  String? id;
  int? score;
  String? firstName;
  String? lastName;
  String? countryCode;  // Changed to nullable
  String? mobile;  // Changed to nullable
  String? mobileWithCountryCode;  // Changed to nullable
  String? email;
  String? organization;  // Changed to nullable
  String? description;
  String? address;  // Changed to nullable
  String? city;
  String? state;
  int? flag;  // Changed to nullable
  String? queryTime;
  String? queryType;
  String? refId;
  String? leadBuyerEmail;
  String? leadBuyerName;
  String? label;
  String? note;
  String? gstin;
  List<String>? websites;  // Changed to nullable
  String? deleteRemark;  // Changed to nullable
  String? deadRemark;
  DateTime? createdAt;  // Changed to nullable
  DateTime? updatedAt;  // Changed to nullable
  DateTime? deletedAt;  // Changed to nullable
  String? oldLead;  // Changed to nullable
  bool? isOldLead;  // Changed to nullable
  String? facebookLeadgenId;
  DateTime? latestEnquiryDate;
  String? leadStatus;  // Changed to nullable
  Type? type;
  DeletedBy? deletedBy;  // Changed to nullable

  Item({
    this.id,
    this.score,
    this.firstName,
    this.lastName,
    this.countryCode,
    this.mobile,
    this.mobileWithCountryCode,
    this.email,
    this.organization,
    this.description,
    this.address,
    this.city,
    this.state,
    this.flag,
    this.queryTime,
    this.queryType,
    this.refId,
    this.leadBuyerEmail,
    this.leadBuyerName,
    this.label,
    this.note,
    this.gstin,
    this.websites,
    this.deleteRemark,
    this.deadRemark,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.oldLead,
    this.isOldLead,
    this.facebookLeadgenId,
    this.latestEnquiryDate,
    this.leadStatus,
    this.type,
    this.deletedBy,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id']?.toString(),
      score: json['score'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      countryCode: json['country_code']?.toString(),
      mobile: json['mobile'],
      mobileWithCountryCode: json['mobile_with_countrycode'],
      email: json['email'],
      organization: json['organization'],
      description: json['description'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      flag: json['flag'],
      queryTime: json['query_time'],
      queryType: json['query_type'],
      refId: json['ref_id'],
      leadBuyerEmail: json['lead_buyer_email'],
      leadBuyerName: json['lead_buyer_name'],
      label: json['label'],
      note: json['note'],
      gstin: json['gstin'],
      websites: json['websites'] != null
          ? List<String>.from(json['websites'])
          : [],
      deleteRemark: json['delete_remark'],
      deadRemark: json['dead_remark'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
      oldLead: json['old_lead']?.toString(),
      isOldLead: json['isOldLead'],
      facebookLeadgenId: json['facebookLeadgenId'],
      latestEnquiryDate: json['latest_enquiry_date'] != null
          ? DateTime.parse(json['latest_enquiry_date'])
          : null,
      leadStatus: json['leadStatus'],
      type: json['type'] != null ? Type.fromJson(json['type']) : null,
      deletedBy: json['deleted_by'] != null
          ? DeletedBy.fromJson(json['deleted_by'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'score': score,
      'first_name': firstName,
      'last_name': lastName,
      'country_code': countryCode,
      'mobile': mobile,
      'mobile_with_countrycode': mobileWithCountryCode,
      'email': email,
      'organization': organization,
      'description': description,
      'address': address,
      'city': city,
      'state': state,
      'flag': flag,
      'query_time': queryTime,
      'query_type': queryType,
      'ref_id': refId,
      'lead_buyer_email': leadBuyerEmail,
      'lead_buyer_name': leadBuyerName,
      'label': label,
      'note': note,
      'gstin': gstin,
      'websites': websites,
      'delete_remark': deleteRemark,
      'dead_remark': deadRemark,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'deleted_at': deletedAt?.toIso8601String(),
      'old_lead': oldLead,
      'isOldLead': isOldLead,
      'facebookLeadgenId': facebookLeadgenId,
      'latest_enquiry_date': latestEnquiryDate?.toIso8601String(),
      'leadStatus': leadStatus,
      'type': type?.toJson(),
      'deleted_by': deletedBy?.toJson(),
    };
  }
}
class ImportCustomData {
  List<String>? divisions;
  List<String>? services;
  List<Data>? data;

  ImportCustomData({this.divisions, this.services, this.data});

  factory ImportCustomData.fromJson(Map<String, dynamic> json) {
    return ImportCustomData(
      divisions: List<String>.from(json['divisions'] ?? []),
      services: List<String>.from(json['services'] ?? []),
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Data.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'divisions': divisions,
      'services': services,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class Data {
  String? gstNumber;
  String? drugLicense;
  String? websiteLink;
  String? indType;
  String? industry;
  String? designation;
  String? pincode;
  String? companyName;

  Data({
    this.gstNumber,
    this.drugLicense,
    this.websiteLink,
    this.indType,
    this.industry,
    this.designation,
    this.pincode,
    this.companyName,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      gstNumber: json['gst_number'],
      drugLicense: json['drug_license'],
      websiteLink: json['website_link'],
      indType: json['ind_type'],
      industry: json['industry'],
      designation: json['designation'],
      pincode: json['pincode'],
      companyName: json['company_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gst_number': gstNumber,
      'drug_license': drugLicense,
      'website_link': websiteLink,
      'ind_type': indType,
      'industry': industry,
      'designation': designation,
      'pincode': pincode,
      'company_name': companyName,
    };
  }
}

class Type {
  String? id;
  String? name;
  String? subTypes;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? activityChartInterval;
  String? activityChartLabelX;
  bool? isReminderRequired;
  bool? removeFromTodo;
  bool? removeFromList;

  Type({
    this.id,
    this.name,
    this.subTypes,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.activityChartInterval,
    this.activityChartLabelX,
    this.isReminderRequired,
    this.removeFromTodo,
    this.removeFromList,
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['id'],
      name: json['name'],
      subTypes: json['sub_types'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      activityChartInterval: json['activity_chart_interval'],
      activityChartLabelX: json['activity_chart_label_x'],
      isReminderRequired: json['isReminderRequired'],
      removeFromTodo: json['remove_from_todo'],
      removeFromList: json['remove_from_list'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sub_types': subTypes,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'activity_chart_interval': activityChartInterval,
      'activity_chart_label_x': activityChartLabelX,
      'isReminderRequired': isReminderRequired,
      'remove_from_todo': removeFromTodo,
      'remove_from_list': removeFromList,
    };
  }
}

class DeletedBy {
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
  String? rememberTokenTime;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
  String? deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;

  DeletedBy({
    this.id,
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
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.deviceId,
    this.tracking,
    this.crmCategory,
    this.mobileApp,
    this.superSettings,
  });

  factory DeletedBy.fromJson(Map<String, dynamic> json) {
    return DeletedBy(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      mobile: json['mobile'],
      address: json['address'],
      bio: json['bio'],
      profilePic: json['profile_pic'],
      password: json['password'],
      status: json['status'],
      rememberToken: json['remember_token'],
      rememberTokenTime: json['remember_token_time'],
      isDefault: json['default'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deviceId: json['device_id'],
      tracking: json['tracking'],
      crmCategory: json['crm_category'],
      mobileApp: json['mobile_app'],
      superSettings: json['superSettings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile': mobile,
      'address': address,
      'bio': bio,
      'profile_pic': profilePic,
      'password': password,
      'status': status,
      'remember_token': rememberToken,
      'remember_token_time': rememberTokenTime,
      'default': isDefault,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'device_id': deviceId,
      'tracking': tracking,
      'crm_category': crmCategory,
      'mobile_app': mobileApp,
      'superSettings': superSettings,
    };
  }
}

class Meta {
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;

  Meta({
    this.currentPage,
    this.itemsPerPage,
    this.totalPages,
    this.totalItems,
    this.itemCount,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json['currentPage'],
      itemsPerPage: json['itemsPerPage'],
      totalPages: json['totalPages'],
      totalItems: json['totalItems'],
      itemCount: json['itemCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'itemsPerPage': itemsPerPage,
      'totalPages': totalPages,
      'totalItems': totalItems,
      'itemCount': itemCount,
    };
  }
}