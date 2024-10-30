class LeadNoActivitiesResponseModel {
  List<Items>? items;
  Meta? meta;

  LeadNoActivitiesResponseModel({this.items, this.meta});

  LeadNoActivitiesResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
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
  Null firstName;
  Null lastName;
  String? mobile;
  String? email;
  LastCall? lastCall;
  Null lastMeeting;

  Items(
      {this.id,
        this.firstName,
        this.lastName,
        this.mobile,
        this.email,
        this.lastCall,
        this.lastMeeting});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    email = json['email'];
    lastCall = json['lastCall'] != null
        ? new LastCall.fromJson(json['lastCall'])
        : null;
    lastMeeting = json['lastMeeting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['mobile'] = mobile;
    data['email'] = email;
    if (lastCall != null) {
      data['lastCall'] = lastCall!.toJson();
    }
    data['lastMeeting'] = lastMeeting;
    return data;
  }
}

class LastCall {
  String? id;
  String? remark;
  String? createdAt;
  CreatedBy? createdBy;

  LastCall({this.id, this.remark, this.createdAt, this.createdBy});

  LastCall.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    remark = json['remark'];
    createdAt = json['created_at'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['remark'] = remark;
    data['created_at'] = createdAt;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
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