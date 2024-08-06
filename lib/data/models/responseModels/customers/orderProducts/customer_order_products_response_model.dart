class CustomerOrderProductsResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;

  CustomerOrderProductsResponseModel({
    this.items,
    this.meta,
    this.userKey
  });

  CustomerOrderProductsResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? product_type;
  String? payment_mode;
  String? payment_type;
  int? mrp;
  int? sale_price;
  int? gst;
  int? gst_percentage;
  String? tds_option;
  int? tds;
  int? tds_percentage;
  String? gst_info;
  int? total;
  int? quantity;
  int? duration;
  String? status;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  Product? product;
  List<Services>? services;
  Order? order;

  Items(
      {this.id,
        this.product_type,
        this.payment_mode,
        this.payment_type,
        this.mrp,
        this.sale_price,
        this.gst,
        this.gst_percentage,
        this.tds_option,
        this.tds,
        this.tds_percentage,
        this.gst_info,
        this.total,
        this.quantity,
        this.duration,
        this.status,
        this.created_at,
        this.updated_at,
        this.deleted_at,
        this.product,
        this.services,
        this.order
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product_type = json['product_type'];
    payment_mode = json['payment_mode'];
    payment_type = json['payment_type'];
    mrp = json['mrp'];
    sale_price = json['sale_price'];
    gst = json['gst'];
    gst_percentage = json['gst_percentage'];
    tds_option = json['tds_option'];
    tds = json['tds'];
    tds_percentage = json['tds_percentage'];
    gst_info = json['gst_info'];
    total = json['total'];
    quantity = json['quantity'];
    duration = json['duration'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = product_type;
    data['payment_mode'] = payment_mode;
    data['payment_type'] = payment_type;
    data['mrp'] = mrp;
    data['sale_price'] = sale_price;
    data['gst'] = gst;
    data['gst_percentage'] = gst_percentage;
    data['tds_option'] = tds_option;
    data['tds'] = tds;
    data['tds_percentage'] = tds_percentage;
    data['gst_info'] = gst_info;
    data['total'] = total;
    data['quantity'] = quantity;
    data['duration'] = duration;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? product_type;
  String? name;
  ProductCategory? product_category;

  Product({this.id, this.product_type, this.name, this.product_category});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product_type = json['product_type'];
    name = json['name'];
    product_category = json['product_category'] != null
        ? ProductCategory.fromJson(json['product_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = product_type;
    data['name'] = name;
    if (product_category != null) {
      data['product_category'] = product_category!.toJson();
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

class Services {
  String? id;
  String? start_date;
  String? end_date;
  String? remark;
  String? reminder_before_expire;
  bool? status;
  String? quit_reason;
  String? quit_date;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  bool? isDisposed;

  Services(
      {this.id,
        this.start_date,
        this.end_date,
        this.remark,
        this.reminder_before_expire,
        this.status,
        this.quit_reason,
        this.quit_date,
        this.created_at,
        this.updated_at,
        this.deleted_at,
        this.isDisposed});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start_date = json['start_date'];
    end_date = json['end_date'];
    remark = json['remark'];
    reminder_before_expire = json['reminder_before_expire'];
    status = json['status'];
    quit_reason = json['quit_reason'];
    quit_date = json['quit_date'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    isDisposed = json['isDisposed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = start_date;
    data['end_date'] = end_date;
    data['remark'] = remark;
    data['reminder_before_expire'] = reminder_before_expire;
    data['status'] = status;
    data['quit_reason'] = quit_reason;
    data['quit_date'] = quit_date;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['isDisposed'] = isDisposed;
    return data;
  }
}

class Order {
  int? order_number;
  String? status;
  CreatedBy? created_by;
  Company? company;
  Customer? customer;

  Order(
      {this.order_number,
        this.status,
        this.created_by,
        this.company,
        this.customer
      });

  Order.fromJson(Map<String, dynamic> json) {
    order_number = json['order_number'];
    status = json['status'];
    created_by = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    company =
    json['company'] != null ? Company.fromJson(json['company']) : null;
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_number'] = order_number;
    data['status'] = status;
    if (created_by != null) {
      data['created_by'] = created_by!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class CreatedBy {
  String? id;
  String? first_name;
  String? last_name;

  CreatedBy({this.id, this.first_name, this.last_name});

  CreatedBy.fromJson(Map<String, dynamic> json) {
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
  String? company_name;

  Company({this.id, this.company_name});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    return data;
  }
}

class Customer {
  String? id;

  Customer({this.id});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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