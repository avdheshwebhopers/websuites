class CustomersListResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;

  CustomersListResponseModel({this.items, this.meta, this.userKey});

  CustomersListResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? companyName;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  String? createdAt;
  String? status;
  List<Divisions>? divisions;
  List<Companies>? companies;
  List<dynamic>? customerActivities;
  List<CustomerToCustomFields>? customerToCustomFields;

  Items(
      {this.id,
        this.companyName,
        this.firstName,
        this.lastName,
        this.primaryEmail,
        this.createdAt,
        this.status,
        this.divisions,
        this.companies,
        this.customerActivities,
        this.customerToCustomFields});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    primaryEmail = json['primary_email'];
    createdAt = json['created_at'];
    status = json['status'];
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add(Divisions.fromJson(v));
      });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(Companies.fromJson(v));
      });
    }
    if (json['customer_activities'] != null) {
      customerActivities = [];
      json['customer_activities'].forEach((v) {
        customerActivities!.add(v);
      });
    }
    if (json['customerToCustomFields'] != null) {
      customerToCustomFields = <CustomerToCustomFields>[];
      json['customerToCustomFields'].forEach((v) {
        customerToCustomFields!.add(CustomerToCustomFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['primary_email'] = primaryEmail;
    data['created_at'] = createdAt;
    data['status'] = status;
    if (divisions != null) {
      data['divisions'] = divisions!.map((v) => v.toJson()).toList();
    }
    if (companies != null) {
      data['companies'] = companies!.map((v) => v.toJson()).toList();
    }
    if (customerActivities != null) {
      data['customer_activities'] =
          customerActivities!.map((v) => v.toJson()).toList();
    }
    if (customerToCustomFields != null) {
      data['customerToCustomFields'] =
          customerToCustomFields!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divisions {
  String? id;
  String? name;

  Divisions({this.id, this.name});

  Divisions.fromJson(Map<String, dynamic> json) {
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

class Companies {
  String? id;
  String? companyName;
  String? companyEmail;

  Companies({this.id, this.companyName, this.companyEmail});

  Companies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['company_email'] = companyEmail;
    return data;
  }
}

class CustomerToCustomFields {
  String? id;
  String? fieldName;
  String? value;

  CustomerToCustomFields({this.id, this.fieldName, this.value});

  CustomerToCustomFields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldName = json['field_name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['field_name'] = fieldName;
    data['value'] = value;
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