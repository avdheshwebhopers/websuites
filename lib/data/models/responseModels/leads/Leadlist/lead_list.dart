class LeadListResponseModel {
  List<Items>? items;
  Meta? meta;
  dynamic userKey; // Change from Null to dynamic or String

  LeadListResponseModel({this.items, this.meta, this.userKey});

  LeadListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    userKey = json['user_key']; // Now this can take any value from json
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = userKey; // Will work correctly now
    return data;
  }


}


class Items {
  String? id;
  String? firstName;
  String? lastName;
  String? organization;
  String? description;
  Null deadRemark;
  String? createdAt;
  String? updatedAt;
  String? latestEnquiryDate;
  String? leadStatus;
  Null type;
  Null subType;
  List<Enquiries>? enquiries;
  List<LeadAssigned>? leadAssigned;

  Items(
      {this.id,
        this.firstName,
        this.lastName,
        this.organization,
        this.description,
        this.deadRemark,
        this.createdAt,
        this.updatedAt,
        this.latestEnquiryDate,
        this.leadStatus,
        this.type,
        this.subType,
        this.enquiries,
        this.leadAssigned});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    organization = json['organization'];
    description = json['description'];
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
        enquiries!.add(Enquiries.fromJson(v));
      });
    }
    if (json['lead_assigned'] != null) {
      leadAssigned = <LeadAssigned>[];
      json['lead_assigned'].forEach((v) {
        leadAssigned!.add(LeadAssigned.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['organization'] = organization;
    data['description'] = description;
    data['dead_remark'] = deadRemark;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['latest_enquiry_date'] = latestEnquiryDate;
    data['leadStatus'] = leadStatus;
    data['type'] = type;
    data['sub_type'] = subType;
    if (enquiries != null) {
      data['enquiries'] = enquiries!.map((v) => v.toJson()).toList();
    }
    if (leadAssigned != null) {
      data['lead_assigned'] =
          leadAssigned!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    return data;
  }
}

class LeadAssigned {
  String? id;
  User? user;

  LeadAssigned({this.id, this.user});

  LeadAssigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;

  User({this.id, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
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