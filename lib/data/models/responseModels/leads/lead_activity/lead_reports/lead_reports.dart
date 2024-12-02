class LeadReportsResponseModel {
  List<Items>? items;
  Meta? meta;

  LeadReportsResponseModel({this.items, this.meta});

  LeadReportsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? email;
  String? mobile;
  Activities? activities;

  Items({this.id, this.name, this.email, this.mobile, this.activities});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    activities = json['activities'] != null
        ? new Activities.fromJson(json['activities'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    if (this.activities != null) {
      data['activities'] = this.activities!.toJson();
    }
    return data;
  }
}

class Activities {
  Calls? calls;
  Meetings? meetings;

  Activities({this.calls, this.meetings});

  Activities.fromJson(Map<String, dynamic> json) {
    calls = json['calls'] != null ? new Calls.fromJson(json['calls']) : null;
    meetings = json['meetings'] != null ? new Meetings.fromJson(json['meetings']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calls != null) {
      data['calls'] = this.calls!.toJson();
    }
    if (this.meetings != null) {
      data['meetings'] = this.meetings!.toJson();
    }
    return data;
  }
}

class Calls {
  int? count;
  CallDetails? details;

  Calls({this.count, this.details});

  Calls.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    details = json['details'] != null ? new CallDetails.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class CallDetails {
  int? answered;
  int? notAnswered;

  CallDetails({this.answered, this.notAnswered});

  CallDetails.fromJson(Map<String, dynamic> json) {
    answered = json['Answered'];
    notAnswered = json['Not Answered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Answered'] = this.answered;
    data['Not Answered'] = this.notAnswered;
    return data;
  }
}

class Meetings {
  int? count;
  MeetingDetails? details;

  Meetings({this.count, this.details});

  Meetings.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    details = json['details'] != null ? new MeetingDetails.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class MeetingDetails {
  int? physical;

  MeetingDetails({this.physical});

  MeetingDetails.fromJson(Map<String, dynamic> json) {
    physical = json['Physical'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Physical'] = this.physical;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalItems'] = this.totalItems;
    data['itemCount'] = this.itemCount;
    data['itemsPerPage'] = this.itemsPerPage;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    return data;
  }
}
