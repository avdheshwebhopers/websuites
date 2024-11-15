class DailySalesReportsResponseModel {
  List<Items>? items;
  Meta? meta;

  DailySalesReportsResponseModel({this.items, this.meta});

  DailySalesReportsResponseModel.fromJson(Map<String, dynamic> json) {
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
  Calls? meetings;

  Activities({this.calls, this.meetings});

  Activities.fromJson(Map<String, dynamic> json) {
    calls = json['calls'] != null ? new Calls.fromJson(json['calls']) : null;
    meetings =
    json['meetings'] != null ? new Calls.fromJson(json['meetings']) : null;
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
  Details? details;

  Calls({this.count, this.details});

  Calls.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
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

class Details {
  Answered? answered;
  Answered? notAnswered;
  Answered? wrongNumber;
  Answered? numberBusy;
  Answered? meetingFixed;
  Answered? lookingForJob;

  Details(
      {this.answered,
        this.notAnswered,
        this.wrongNumber,
        this.numberBusy,
        this.meetingFixed,
        this.lookingForJob});

  Details.fromJson(Map<String, dynamic> json) {
    answered = json['Answered'] != null
        ? new Answered.fromJson(json['Answered'])
        : null;
    notAnswered = json['Not Answered'] != null
        ? new Answered.fromJson(json['Not Answered'])
        : null;
    wrongNumber = json['Wrong Number'] != null
        ? new Answered.fromJson(json['Wrong Number'])
        : null;
    numberBusy = json['Number Busy'] != null
        ? new Answered.fromJson(json['Number Busy'])
        : null;
    meetingFixed = json['Meeting Fixed'] != null
        ? new Answered.fromJson(json['Meeting Fixed'])
        : null;
    lookingForJob = json['Looking For Job'] != null
        ? new Answered.fromJson(json['Looking For Job'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.answered != null) {
      data['Answered'] = this.answered!.toJson();
    }
    if (this.notAnswered != null) {
      data['Not Answered'] = this.notAnswered!.toJson();
    }
    if (this.wrongNumber != null) {
      data['Wrong Number'] = this.wrongNumber!.toJson();
    }
    if (this.numberBusy != null) {
      data['Number Busy'] = this.numberBusy!.toJson();
    }
    if (this.meetingFixed != null) {
      data['Meeting Fixed'] = this.meetingFixed!.toJson();
    }
    if (this.lookingForJob != null) {
      data['Looking For Job'] = this.lookingForJob!.toJson();
    }
    return data;
  }
}

class Answered {
  String? id;
  int? count;

  Answered({this.id, this.count});

  Answered.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    return data;
  }
}

// class Details {
//   Answered? virtual;
//   Answered? physical;
//
//   Details({this.virtual, this.physical});
//
//   Details.fromJson(Map<String, dynamic> json) {
//     virtual =
//     json['Virtual'] != null ? new Answered.fromJson(json['Virtual']) : null;
//     physical = json['Physical'] != null
//         ? new Answered.fromJson(json['Physical'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.virtual != null) {
//       data['Virtual'] = this.virtual!.toJson();
//     }
//     if (this.physical != null) {
//       data['Physical'] = this.physical!.toJson();
//     }
//     return data;
//   }
// }

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
