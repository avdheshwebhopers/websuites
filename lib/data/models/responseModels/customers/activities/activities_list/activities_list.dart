class CustomerActivityListResponseModel {
  CustomerActivityListResponseModel({
    required this.items,
    required this.meta,
    required this.userKey,
  });

  final List<Item> items;
  final Meta? meta;
  final dynamic userKey;

  factory CustomerActivityListResponseModel.fromJson(Map<String, dynamic> json){
    return CustomerActivityListResponseModel(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      userKey: json["user_key"],
    );
  }
}

class Item {
  Item({
    required this.id,
    required this.activity,
    required this.remark,
    required this.reminder,
    required this.reminderStatus,
    required this.meetingWith,
    required this.meetingWithName,
    required this.meetingWithPhone,
    required this.dateContacted,
    required this.services,
    required this.lat,
    required this.lng,
    required this.remoteLocation,
    required this.ccTo,
    required this.informedToCustomer,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.callDuration,
    required this.recordFile,
    required this.callActivtyDescription,
    required this.customer,
    required this.subActivity,
    required this.customerType,
    required this.screenshot,
    required this.visitedWith,
    required this.createdBy,
    required this.reminderTo,
  });

  final String? id;
  final String? activity;
  final String? remark;
  final dynamic reminder;
  final bool? reminderStatus;  // Correct field for reminder status
  final String? meetingWith;
  final String? meetingWithName;
  final String? meetingWithPhone;
  final dynamic dateContacted;
  final dynamic services;
  final String? lat;
  final String? lng;
  final dynamic remoteLocation;
  final dynamic ccTo;
  final bool? informedToCustomer;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final int? callDuration;
  final dynamic recordFile;
  final String? callActivtyDescription;
  final Customer? customer;
  final SubActivity? subActivity;
  final dynamic customerType;
  final dynamic screenshot;
  final CreatedBy? visitedWith;
  final CreatedBy? createdBy;
  final CreatedBy? reminderTo;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      activity: json["activity"],
      remark: json["remark"],
      reminder: json["reminder"],
      reminderStatus: json["reminder_status"],
      meetingWith: json["meeting_with"],
      meetingWithName: json["meeting_with_name"],
      meetingWithPhone: json["meeting_with_phone"],
      dateContacted: json["date_contacted"],
      services: json["services"],
      lat: json["lat"],
      lng: json["lng"],
      remoteLocation: json["remote_location"],
      ccTo: json["cc_to"],
      informedToCustomer: json["informed_to_customer"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      callDuration: json["call_duration"],
      recordFile: json["record_file"],
      callActivtyDescription: json["call_activty_description"],
      customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
      subActivity: json["sub_activity"] == null ? null : SubActivity.fromJson(json["sub_activity"]),
      customerType: json["customer_type"],
      screenshot: json["screenshot"],
      visitedWith: json["visited_with"] == null ? null : CreatedBy.fromJson(json["visited_with"]),
      createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
      reminderTo: json["reminder_to"] == null ? null : CreatedBy.fromJson(json["reminder_to"]),
    );
  }
}


class CreatedBy {
  CreatedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String? id;
  final String? firstName;
  final String? lastName;

  factory CreatedBy.fromJson(Map<String, dynamic> json){
    return CreatedBy(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
    );
  }

}

class Customer {
  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.primaryEmail,
    required this.countryCode,
    required this.primaryContact,
    required this.organization,
    required this.websites,
    required this.primaryAddress,
    required this.profileImage,
    required this.dob,
    required this.gstin,
    required this.aboutClient,
    required this.otherInformation,
    required this.lat,
    required this.lng,
    required this.joinedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.deleteRemark,
    required this.zohoContactId,
    required this.status,
    required this.subStatus,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? primaryEmail;
  final int? countryCode;
  final String? primaryContact;
  final String? organization;
  final List<String> websites;
  final String? primaryAddress;
  final dynamic profileImage;
  final dynamic dob;
  final String? gstin;
  final String? aboutClient;
  final String? otherInformation;
  final double? lat;
  final double? lng;
  final dynamic joinedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final dynamic deleteRemark;
  final dynamic zohoContactId;
  final String? status;
  final dynamic subStatus;

  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      primaryEmail: json["primary_email"],
      countryCode: json["country_code"],
      primaryContact: json["primary_contact"],
      organization: json["organization"],
      websites: json["websites"] == null ? [] : List<String>.from(json["websites"]!.map((x) => x)),
      primaryAddress: json["primary_address"],
      profileImage: json["profile_image"],
      dob: json["dob"],
      gstin: json["gstin"],
      aboutClient: json["about_client"],
      otherInformation: json["other_information"],
      lat: json["lat"],
      lng: json["lng"],
      joinedAt: json["joined_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      deleteRemark: json["delete_remark"],
      zohoContactId: json["zoho_contact_id"],
      status: json["status"],
      subStatus: json["subStatus"],
    );
  }

}

class SubActivity {
  SubActivity({
    required this.id,
    required this.type,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final String? id;
  final String? type;
  final String? name;
  final bool? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory SubActivity.fromJson(Map<String, dynamic> json){
    return SubActivity(
      id: json["id"],
      type: json["type"],
      name: json["name"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
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
