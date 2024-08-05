class CustomersPaymentReminderResponseModel {
  List<Items>? items;
  Meta? meta;
  String? user_key;

  CustomersPaymentReminderResponseModel({this.items, this.meta, this.user_key});

  CustomersPaymentReminderResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    user_key = json['user_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = user_key;
    return data;
  }
}

class Items {
  String? id;
  int? amount;
  String? cheque_date;
  String? cheque_number;
  String? cheque;
  String? reminder_date;
  String? status;
  String? created_at;
  Orders? orders;
  Product? product;
  Customer? reminder_to;
  Customer? created_by;

  Items(
      {this.id,
      this.amount,
      this.cheque_date,
      this.cheque_number,
      this.cheque,
      this.reminder_date,
      this.status,
      this.created_at,
      this.orders,
      this.product,
      this.reminder_to,
      this.created_by});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    cheque_date = json['cheque_date'];
    cheque_number = json['cheque_number'];
    cheque = json['cheque'];
    reminder_date = json['reminder_date'];
    status = json['status'];
    created_at = json['created_at'];
    orders =
        json['orders'] != null ? Orders.fromJson(json['orders']) : null;
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    reminder_to = json['reminder_to'] != null
        ? Customer.fromJson(json['reminder_to'])
        : null;
    created_by = json['created_by'] != null
        ? Customer.fromJson(json['created_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['cheque_date'] = cheque_date;
    data['cheque_number'] = cheque_number;
    data['cheque'] = cheque;
    data['reminder_date'] = reminder_date;
    data['status'] = status;
    data['created_at'] = created_at;
    if (orders != null) {
      data['orders'] = orders!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (reminder_to != null) {
      data['reminder_to'] = reminder_to!.toJson();
    }
    if (created_by != null) {
      data['created_by'] = created_by!.toJson();
    }
    return data;
  }
}

class Orders {
  String? id;
  int? order_number;
  Customer? customer;
  Company? company;

  Orders({this.id, this.order_number, this.customer, this.company});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order_number = json['order_number'];
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = order_number;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? first_name;
  String? last_name;

  Customer({this.id, this.first_name, this.last_name});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    return data;
  }
}

class Product {
  String? id;
  String? name;
  ProductCategory? productCategory;
  ProductCategory? brand;

  Product({this.id, this.name, this.productCategory, this.brand});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productCategory = json['product_category'] != null
        ? ProductCategory.fromJson(json['product_category'])
        : null;
    brand = json['brand'] != null
        ? ProductCategory.fromJson(json['brand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (productCategory != null) {
      data['product_category'] = productCategory!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    return data;
  }
}

class ProductCategory {
  String? id;
  String? name;

  ProductCategory({this.id, this.name});

  ProductCategory.fromJson(Map<String, dynamic> json) {
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

class Meta {
  int? total;
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;

  Meta(
      {this.total,
      this.currentPage,
      this.itemsPerPage,
      this.totalPages,
      this.totalItems,
      this.itemCount});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    return data;
  }
}
