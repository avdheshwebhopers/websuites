class OrderDetailsResponseModel {
  String? id;
  int? orderNumber;
  int? gstFees;
  int? tdsPercentage;
  int? amount;
  int? tdsAmount;
  int? totalAmount;
  int? payabaleAmount;
  String? performaInvoice;
  String? status;
  String? remark;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic deleteRemark;
  dynamic zohoSalesorderId;
  CreatedBy? createdBy;
  List<OrderProducts>? orderProducts;
  Customer? customer;
  Company? company;
  List<Payments>? payments;
  List<dynamic>? paymentsReminder;
  List<dynamic>? creditDebit;
  List<dynamic>? credituse;
  OrderStatus? orderStatus;
  List<dynamic>? statusHistory;

  OrderDetailsResponseModel(
      {this.id,
        this.orderNumber,
        this.gstFees,
        this.tdsPercentage,
        this.amount,
        this.tdsAmount,
        this.totalAmount,
        this.payabaleAmount,
        this.performaInvoice,
        this.status,
        this.remark,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.deleteRemark,
        this.zohoSalesorderId,
        this.createdBy,
        this.orderProducts,
        this.customer,
        this.company,
        this.payments,
        this.paymentsReminder,
        this.creditDebit,
        this.credituse,
        this.orderStatus,
        this.statusHistory});

  OrderDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    gstFees = json['gst_fees'];
    tdsPercentage = json['tds_percentage'];
    amount = json['amount'];
    tdsAmount = json['tds_amount'];
    totalAmount = json['total_amount'];
    payabaleAmount = json['payabale_amount'];
    performaInvoice = json['performa_invoice'];
    status = json['status'];
    remark = json['remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deleteRemark = json['delete_remark'];
    zohoSalesorderId = json['zoho_salesorder_id'];
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
    if (json['payments_reminder'] != null) {
      paymentsReminder = <Null>[];
      json['payments_reminder'].forEach((v) {
        paymentsReminder!.add((v));
      });
    }
    if (json['credit_debit'] != null) {
      creditDebit = <Null>[];
      json['credit_debit'].forEach((v) {
        creditDebit!.add((v));
      });
    }
    if (json['credituse'] != null) {
      credituse = <Null>[];
      json['credituse'].forEach((v) {
        credituse!.add((v));
      });
    }
    orderStatus = json['order_status'] != null
        ? OrderStatus.fromJson(json['order_status'])
        : null;
    if (json['status_history'] != null) {
      statusHistory = <Null>[];
      json['status_history'].forEach((v) {
        statusHistory!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['gst_fees'] = gstFees;
    data['tds_percentage'] = tdsPercentage;
    data['amount'] = amount;
    data['tds_amount'] = tdsAmount;
    data['total_amount'] = totalAmount;
    data['payabale_amount'] = payabaleAmount;
    data['performa_invoice'] = performaInvoice;
    data['status'] = status;
    data['remark'] = remark;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['delete_remark'] = deleteRemark;
    data['zoho_salesorder_id'] = zohoSalesorderId;
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    if (orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    if (customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    if (paymentsReminder != null) {
      data['payments_reminder'] =
          paymentsReminder!.map((v) => ()).toList();
    }
    if (creditDebit != null) {
      data['credit_debit'] = creditDebit!.map((v) => ()).toList();
    }
    if (credituse != null) {
      data['credituse'] = credituse!.map((v) => ()).toList();
    }
    if (orderStatus != null) {
      data['order_status'] = orderStatus!.toJson();
    }
    if (statusHistory != null) {
      data['status_history'] =
          statusHistory!.map((v) => ()).toList();
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

class OrderProducts {
  String? id;
  String? productType;
  String? paymentMode;
  String? paymentType;
  int? mrp;
  int? salePrice;
  int? gst;
  int? gstPercentage;
  String? tdsOption;
  int? tds;
  int? tdsPercentage;
  Null? gstInfo;
  int? total;
  int? quantity;
  int? duration;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Product? product;
  List<Null>? services;

  OrderProducts(
      {this.id,
        this.productType,
        this.paymentMode,
        this.paymentType,
        this.mrp,
        this.salePrice,
        this.gst,
        this.gstPercentage,
        this.tdsOption,
        this.tds,
        this.tdsPercentage,
        this.gstInfo,
        this.total,
        this.quantity,
        this.duration,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.product,
        this.services});

  OrderProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    paymentMode = json['payment_mode'];
    paymentType = json['payment_type'];
    mrp = json['mrp'];
    salePrice = json['sale_price'];
    gst = json['gst'];
    gstPercentage = json['gst_percentage'];
    tdsOption = json['tds_option'];
    tds = json['tds'];
    tdsPercentage = json['tds_percentage'];
    gstInfo = json['gst_info'];
    total = json['total'];
    quantity = json['quantity'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    if (json['services'] != null) {
      services = <Null>[];
      json['services'].forEach((v) {
        services!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_type'] = this.productType;
    data['payment_mode'] = this.paymentMode;
    data['payment_type'] = this.paymentType;
    data['mrp'] = this.mrp;
    data['sale_price'] = this.salePrice;
    data['gst'] = this.gst;
    data['gst_percentage'] = this.gstPercentage;
    data['tds_option'] = this.tdsOption;
    data['tds'] = this.tds;
    data['tds_percentage'] = this.tdsPercentage;
    data['gst_info'] = this.gstInfo;
    data['total'] = this.total;
    data['quantity'] = this.quantity;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => ()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;

  Product({this.id, this.name});

  Product.fromJson(Map<String, dynamic> json) {
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

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  int? countryCode;
  String? primaryContact;
  String? primaryAddress;

  Customer(
      {this.id,
        this.firstName,
        this.lastName,
        this.primaryEmail,
        this.countryCode,
        this.primaryContact,
        this.primaryAddress});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    primaryEmail = json['primary_email'];
    countryCode = json['country_code'];
    primaryContact = json['primary_contact'];
    primaryAddress = json['primary_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['primary_email'] = this.primaryEmail;
    data['country_code'] = this.countryCode;
    data['primary_contact'] = this.primaryContact;
    data['primary_address'] = this.primaryAddress;
    return data;
  }
}

class Company {
  String? id;
  String? companyName;
  String? website;

  Company({this.id, this.companyName, this.website});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['website'] = this.website;
    return data;
  }
}

class Payments {
  String? id;
  int? amount;
  int? gstAndFees;
  String? paymentMode;
  String? paymentType;
  Null? txnId;
  int? chequeNumber;
  Null? chequeDate;
  String? uploadDocument;
  Null? invoice;
  String? information;
  bool? isFresh;
  String? status;
  Null? remark;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Product? product;

  Payments(
      {this.id,
        this.amount,
        this.gstAndFees,
        this.paymentMode,
        this.paymentType,
        this.txnId,
        this.chequeNumber,
        this.chequeDate,
        this.uploadDocument,
        this.invoice,
        this.information,
        this.isFresh,
        this.status,
        this.remark,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.product});

  Payments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    gstAndFees = json['gst_and_fees'];
    paymentMode = json['payment_mode'];
    paymentType = json['payment_type'];
    txnId = json['txn_id'];
    chequeNumber = json['cheque_number'];
    chequeDate = json['cheque_date'];
    uploadDocument = json['upload_document'];
    invoice = json['invoice'];
    information = json['information'];
    isFresh = json['is_fresh'];
    status = json['status'];
    remark = json['remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['gst_and_fees'] = this.gstAndFees;
    data['payment_mode'] = this.paymentMode;
    data['payment_type'] = this.paymentType;
    data['txn_id'] = this.txnId;
    data['cheque_number'] = this.chequeNumber;
    data['cheque_date'] = this.chequeDate;
    data['upload_document'] = this.uploadDocument;
    data['invoice'] = this.invoice;
    data['information'] = this.information;
    data['is_fresh'] = this.isFresh;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class OrderStatus {
  String? id;
  String? name;
  Null? color;

  OrderStatus({this.id, this.name, this.color});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    return data;
  }
}