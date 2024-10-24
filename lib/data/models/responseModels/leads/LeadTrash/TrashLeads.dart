class LeadTrashResponseModel {
  LeadTrashResponseModel({
    required this.items,
    required this.meta,
  });

  final List<Item> items;
  final Meta? meta;

  factory LeadTrashResponseModel.fromJson(Map<String, dynamic> json){
    return LeadTrashResponseModel(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Item {
  Item({
    required this.id,
    required this.score,
    required this.firstName,
    required this.lastName,
    required this.countryCode,
    required this.mobile,
    required this.mobileWithCountrycode,
    required this.email,
    required this.organization,
    required this.description,
    required this.address,
    required this.city,
    required this.state,
    required this.flag,
    required this.importCustomData,
    required this.queryTime,
    required this.queryType,
    required this.refId,
    required this.leadBuyerEmail,
    required this.leadBuyerName,
    required this.label,
    required this.note,
    required this.gstin,
    required this.websites,
    required this.deleteRemark,
    required this.deadRemark,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.oldLead,
    required this.isOldLead,
    required this.facebookLeadgenId,
    required this.latestEnquiryDate,
    required this.leadStatus,
    required this.type,
    required this.deletedBy,
  });

  final String? id;
  final int? score;
  final String? firstName;
  final String? lastName;
  final int? countryCode;
  final String? mobile;
  final String? mobileWithCountrycode;
  final String? email;
  final String? organization;
  final String? description;
  final String? address;
  final String? city;
  final String? state;
  final int? flag;
  final ImportCustomData? importCustomData;
  final DateTime? queryTime;
  final String? queryType;
  final String? refId;
  final dynamic leadBuyerEmail;
  final dynamic leadBuyerName;
  final dynamic label;
  final dynamic note;
  final String? gstin;
  final List<dynamic> websites;
  final String? deleteRemark;
  final dynamic deadRemark;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? oldLead;
  final bool? isOldLead;
  final dynamic facebookLeadgenId;
  final DateTime? latestEnquiryDate;
  final String? leadStatus;
  final Type? type;
  final DeletedBy? deletedBy;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      score: json["score"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      countryCode: json["country_code"],
      mobile: json["mobile"],
      mobileWithCountrycode: json["mobile_with_countrycode"],
      email: json["email"],
      organization: json["organization"],
      description: json["description"],
      address: json["address"],
      city: json["city"],
      state: json["state"],
      flag: json["flag"],
      importCustomData: json["import_custom_data"] == null ? null : ImportCustomData.fromJson(json["import_custom_data"]),
      queryTime: DateTime.tryParse(json["query_time"] ?? ""),
      queryType: json["query_type"],
      refId: json["ref_id"],
      leadBuyerEmail: json["lead_buyer_email"],
      leadBuyerName: json["lead_buyer_name"],
      label: json["label"],
      note: json["note"],
      gstin: json["gstin"],
      websites: json["websites"] == null ? [] : List<dynamic>.from(json["websites"]!.map((x) => x)),
      deleteRemark: json["delete_remark"],
      deadRemark: json["dead_remark"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: DateTime.tryParse(json["deleted_at"] ?? ""),
      oldLead: json["old_lead"],
      isOldLead: json["isOldLead"],
      facebookLeadgenId: json["facebookLeadgenId"],
      latestEnquiryDate: DateTime.tryParse(json["latest_enquiry_date"] ?? ""),
      leadStatus: json["leadStatus"],
      type: json["type"] == null ? null : Type.fromJson(json["type"]),
      deletedBy: json["deleted_by"] == null ? null : DeletedBy.fromJson(json["deleted_by"]),
    );
  }

}

class DeletedBy {
  DeletedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.bio,
    required this.profilePic,
    required this.password,
    required this.status,
    required this.rememberToken,
    required this.rememberTokenTime,
    required this.deletedByDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.deviceId,
    required this.tracking,
    required this.crmCategory,
    required this.mobileApp,
    required this.superSettings,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? address;
  final String? bio;
  final String? profilePic;
  final String? password;
  final bool? status;
  final String? rememberToken;
  final dynamic rememberTokenTime;
  final bool? deletedByDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deviceId;
  final bool? tracking;
  final String? crmCategory;
  final bool? mobileApp;
  final bool? superSettings;

  factory DeletedBy.fromJson(Map<String, dynamic> json){
    return DeletedBy(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobile: json["mobile"],
      address: json["address"],
      bio: json["bio"],
      profilePic: json["profile_pic"],
      password: json["password"],
      status: json["status"],
      rememberToken: json["remember_token"],
      rememberTokenTime: json["remember_token_time"],
      deletedByDefault: json["default"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deviceId: json["device_id"],
      tracking: json["tracking"],
      crmCategory: json["crm_category"],
      mobileApp: json["mobile_app"],
      superSettings: json["superSettings"],
    );
  }

}

class ImportCustomData {
  ImportCustomData({
    required this.divisions,
    required this.services,
    required this.data,
  });

  final List<String> divisions;
  final List<String> services;
  final List<Datum> data;

  factory ImportCustomData.fromJson(Map<String, dynamic> json){
    return ImportCustomData(
      divisions: json["divisions"] == null ? [] : List<String>.from(json["divisions"]!.map((x) => x)),
      services: json["services"] == null ? [] : List<String>.from(json["services"]!.map((x) => x)),
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }

}

class Datum {
  Datum({
    required this.gstNumber,
    required this.drugLicense,
    required this.websiteLink,
    required this.indType,
    required this.industry,
    required this.designation,
    required this.pincode,
    required this.companyName,
  });

  final String? gstNumber;
  final dynamic drugLicense;
  final String? websiteLink;
  final String? indType;
  final String? industry;
  final String? designation;
  final int? pincode;
  final String? companyName;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      gstNumber: json["gst_number"],
      drugLicense: json["drug_license"],
      websiteLink: json["website_link"],
      indType: json["ind_type"],
      industry: json["industry"],
      designation: json["designation"],
      pincode: json["pincode"],
      companyName: json["company_name"],
    );
  }

}

class Type {
  Type({
    required this.id,
    required this.name,
    required this.subTypes,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.activityChartInterval,
    required this.activityChartLabelY,
    required this.activityChartLabelX,
    required this.isReminderRequired,
    required this.removeFromTodo,
    required this.removeFromList,
  });

  final String? id;
  final String? name;
  final dynamic subTypes;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? activityChartInterval;
  final dynamic activityChartLabelY;
  final String? activityChartLabelX;
  final bool? isReminderRequired;
  final bool? removeFromTodo;
  final bool? removeFromList;

  factory Type.fromJson(Map<String, dynamic> json){
    return Type(
      id: json["id"],
      name: json["name"],
      subTypes: json["sub_types"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      activityChartInterval: json["activity_chart_interval"],
      activityChartLabelY: json["activity_chart_label_y"],
      activityChartLabelX: json["activity_chart_label_x"],
      isReminderRequired: json["isReminderRequired"],
      removeFromTodo: json["remove_from_todo"],
      removeFromList: json["remove_from_list"],
    );
  }

}

class Meta {
  Meta({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemCount,
  });

  final int? currentPage;
  final int? itemsPerPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemCount;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      currentPage: json["currentPage"],
      itemsPerPage: json["itemsPerPage"],
      totalPages: json["totalPages"],
      totalItems: json["totalItems"],
      itemCount: json["itemCount"],
    );
  }

}
