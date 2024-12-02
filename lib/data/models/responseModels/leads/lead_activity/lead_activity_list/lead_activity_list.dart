class LeadActivityResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;

  LeadActivityResponseModel({this.items, this.meta, this.userKey});

  LeadActivityResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
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
  String? activity;
  String? remark;
  String? reminder;
  bool? reminderStatus;
  String? meetingWith;
  String? meetingWithName;
  String? meetingWithPhone;
  double? lat;
  double? lng;
  String? remoteLocation;
  String? createdAt;
  int? callDuration;
  String? recordFile;
  String? callActivityDescription;
  Lead? lead;
  SubActivity? subActivity;
  String? leadType;
  String? subLeadType;
  String? leadStatus;
  String? visitedWith;
  CreatedBy? createdBy;
  String? whatsappLog;

  Items({
    this.id,
    this.activity,
    this.remark,
    this.reminder,
    this.reminderStatus,
    this.meetingWith,
    this.meetingWithName,
    this.meetingWithPhone,
    this.lat,
    this.lng,
    this.remoteLocation,
    this.createdAt,
    this.callDuration,
    this.recordFile,
    this.callActivityDescription,
    this.lead,
    this.subActivity,
    this.leadType,
    this.subLeadType,
    this.leadStatus,
    this.visitedWith,
    this.createdBy,
    this.whatsappLog,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    activity = json['activity'];
    remark = json['remark'];
    reminder = json['reminder'];
    reminderStatus = json['reminder_status'];
    meetingWith = json['meeting_with'];
    meetingWithName = json['meeting_with_name'];
    meetingWithPhone = json['meeting_with_phone'];
    lat = json['lat'];
    lng = json['lng'];
    remoteLocation = json['remote_location'];
    createdAt = json['created_at'];
    callDuration = json['call_duration'];
    recordFile = json['record_file'];
    callActivityDescription = json['call_activity_description'];
    lead = json['lead'] != null ? Lead.fromJson(json['lead']) : null;
    subActivity = json['sub_activity'] != null
        ? SubActivity.fromJson(json['sub_activity'])
        : null;
    leadType = json['lead_type'];
    subLeadType = json['sub_lead_type'];
    leadStatus = json['lead_status'];
    visitedWith = json['visited_with'];
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    whatsappLog = json['whatsappLog'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['activity'] = activity;
    data['remark'] = remark;
    data['reminder'] = reminder;
    data['reminder_status'] = reminderStatus;
    data['meeting_with'] = meetingWith;
    data['meeting_with_name'] = meetingWithName;
    data['meeting_with_phone'] = meetingWithPhone;
    data['lat'] = lat;
    data['lng'] = lng;
    data['remote_location'] = remoteLocation;
    data['created_at'] = createdAt;
    data['call_duration'] = callDuration;
    data['record_file'] = recordFile;
    data['call_activity_description'] = callActivityDescription;
    if (lead != null) {
      data['lead'] = lead!.toJson();
    }
    if (subActivity != null) {
      data['sub_activity'] = subActivity!.toJson();
    }
    data['lead_type'] = leadType;
    data['sub_lead_type'] = subLeadType;
    data['lead_status'] = leadStatus;
    data['visited_with'] = visitedWith;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    data['whatsappLog'] = whatsappLog;
    return data;
  }
}

class Lead {
  String? id;
  String? firstName;
  String? lastName;
  String? organization;
  List<ProductCategories>? productCategories;

  Lead({this.id, this.firstName, this.lastName, this.organization, this.productCategories});

  Lead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    organization = json['organization'];
    if (json['productCategories'] != null) {
      productCategories = <ProductCategories>[];
      json['productCategories'].forEach((v) {
        productCategories!.add(ProductCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['organization'] = organization;
    if (productCategories != null) {
      data['productCategories'] = productCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCategories {
  String? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  ProductCategories({this.id, this.name, this.description, this.image, this.createdAt, this.updatedAt});

  ProductCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class SubActivity {
  String? id;
  String? name;

  SubActivity({this.id, this.name});

  SubActivity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;

  CreatedBy({this.id, this.firstName, this.lastName});

  CreatedBy.fromJson(Map<String, dynamic> json) {
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

  Meta({this.currentPage, this.itemsPerPage, this.totalPages, this.totalItems, this.itemCount});

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