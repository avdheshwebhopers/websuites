class LeadReportsResponseModel {
  List<Items>? items;
  Meta? meta;

  LeadReportsResponseModel({this.items, this.meta});

  LeadReportsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? mobile;
  Activity? activities;

  Items({this.id, this.name, this.email, this.mobile, this.activities});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    activities = json['activities'] != null
        ? Activity.fromJson(json['activities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    if (activities != null) {
      data['activities'] = activities!.toJson();
    }
    return data;
  }
}

class Activity {
  Calls? calls;
  Calls? meetings;

  Activity({this.calls, this.meetings});

  Activity.fromJson(Map<String, dynamic> json) {
    calls = json['calls'] != null ? Calls.fromJson(json['calls']) : null;
    meetings =
        json['meetings'] != null ? Calls.fromJson(json['meetings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (calls != null) {
      data['calls'] = calls!.toJson();
    }
    if (meetings != null) {
      data['meetings'] = meetings!.toJson();
    }
    return data;
  }
}

class Calls {
  int? count;
  Details? details;

  Calls({this.count, this.details});

  Calls.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}

class Details {
  int? answered;
  int? notAnswered;

  Details({this.answered, this.notAnswered});

  Details.fromJson(Map<String, dynamic> json) {
    answered = json['Answered'];
    notAnswered = json['Not Answered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Answered'] = answered;
    data['Not Answered'] = notAnswered;
    return data;
  }
}

class Detail {
  Detail();

  Detail.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Meta {
  int? totalItems;
  int? itemCount;
  int? itemsPerPage;
  int? totalPages;
  int? currentPage;

  Meta(
      {this.totalItems,
      this.itemCount,
      this.itemsPerPage,
      this.totalPages,
      this.currentPage});

  Meta.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['currentPage'] = currentPage;
    return data;
  }
}

class Activities {
  Calls? calls;
  Calls? meetings;

  Activities({this.calls, this.meetings});

  Activities.fromJson(Map<String, dynamic> json) {
    calls = json['calls'] != null ? Calls.fromJson(json['calls']) : null;
    meetings =
        json['meetings'] != null ? Calls.fromJson(json['meetings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (calls != null) {
      data['calls'] = calls!.toJson();
    }
    if (meetings != null) {
      data['meetings'] = meetings!.toJson();
    }
    return data;
  }
}
