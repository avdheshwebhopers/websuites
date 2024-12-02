class CustomerActivityNoActivityResponseModel {
  List<Items>? items;
  Meta? meta;

  CustomerActivityNoActivityResponseModel({this.items, this.meta});

  CustomerActivityNoActivityResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? firstName;
  String? lastName;
  String? primaryEmail;
  String? primaryContact;
  Company? company;
  CustomerType? customerType;
  LastOrder? lastOrder;
  LastCall? lastCall;
  LastCall? lastMeeting;
  List<CustomerAssigned>? customerAssigned;

  Items(
      {this.id,
        this.firstName,
        this.lastName,
        this.primaryEmail,
        this.primaryContact,
        this.company,
        this.customerType,
        this.lastOrder,
        this.lastCall,
        this.lastMeeting,
        this.customerAssigned});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    primaryEmail = json['primary_email'];
    primaryContact = json['primary_contact'];
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    customerType = json['customer_type'] != null
        ? new CustomerType.fromJson(json['customer_type'])
        : null;
    lastOrder = json['lastOrder'] != null
        ? new LastOrder.fromJson(json['lastOrder'])
        : null;
    lastCall = json['lastCall'] != null
        ? new LastCall.fromJson(json['lastCall'])
        : null;
    lastMeeting = json['lastMeeting'] != null
        ? new LastCall.fromJson(json['lastMeeting'])
        : null;
    if (json['customer_assigned'] != null) {
      customerAssigned = <CustomerAssigned>[];
      json['customer_assigned'].forEach((v) {
        customerAssigned!.add(new CustomerAssigned.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['primary_email'] = this.primaryEmail;
    data['primary_contact'] = this.primaryContact;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.customerType != null) {
      data['customer_type'] = this.customerType!.toJson();
    }
    if (this.lastOrder != null) {
      data['lastOrder'] = this.lastOrder!.toJson();
    }
    if (this.lastCall != null) {
      data['lastCall'] = this.lastCall!.toJson();
    }
    if (this.lastMeeting != null) {
      data['lastMeeting'] = this.lastMeeting!.toJson();
    }
    if (this.customerAssigned != null) {
      data['customer_assigned'] =
          this.customerAssigned!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Company {
  String? id;
  String? companyName;

  Company({this.id, this.companyName});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    return data;
  }
}

class CustomerType {
  String? id;
  String? name;

  CustomerType({this.id, this.name});

  CustomerType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class LastOrder {
  String? id;
  int? orderNumber;
  int? amount;
  String? createdAt;
  CreatedBy? createdBy;

  LastOrder(
      {this.id, this.orderNumber, this.amount, this.createdAt, this.createdBy});

  LastOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    amount = json['amount'];
    createdAt = json['created_at'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    return data;
  }
}

class CustomerAssigned {
  String? id;
  CreatedBy? user;

  CustomerAssigned({this.id, this.user});

  CustomerAssigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new CreatedBy.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['itemsPerPage'] = this.itemsPerPage;
    data['totalPages'] = this.totalPages;
    data['totalItems'] = this.totalItems;
    data['itemCount'] = this.itemCount;
    return data;
  }
}