class CustomerDetailViewOrderResponseModel {
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
  Null? deletedAt;
  Null? deleteRemark;
  Null? zohoSalesorderId;
  CreatedBy? createdBy;
  Division? division;
  Company? company;
  List<OrderProducts>? orderProducts;
  List<Payments>? payments;
  List<Null>? credituse;

  CustomerDetailViewOrderResponseModel(
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
      this.division,
      this.company,
      this.orderProducts,
      this.payments,
      this.credituse});

  CustomerDetailViewOrderResponseModel.fromJson(Map<String, dynamic> json) {
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
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    if (json['order_products'] != null) {
      orderProducts = <OrderProducts>[];
      json['order_products'].forEach((v) {
        orderProducts!.add(new OrderProducts.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
    if (json['credituse'] != null) {
      credituse = <Null>[];
      json['credituse'].forEach((v) {
        credituse!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['gst_fees'] = this.gstFees;
    data['tds_percentage'] = this.tdsPercentage;
    data['amount'] = this.amount;
    data['tds_amount'] = this.tdsAmount;
    data['total_amount'] = this.totalAmount;
    data['payabale_amount'] = this.payabaleAmount;
    data['performa_invoice'] = this.performaInvoice;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['delete_remark'] = this.deleteRemark;
    data['zoho_salesorder_id'] = this.zohoSalesorderId;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.orderProducts != null) {
      data['order_products'] =
          this.orderProducts!.map((v) => v.toJson()).toList();
    }
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    if (this.credituse != null) {
      data['credituse'] = this.credituse!.map((v) => ()).toList();
    }
    return data;
  }
  static List<CustomerDetailViewOrderResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerDetailViewOrderResponseModel.fromJson(json)).toList();
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

class Division {
  String? id;
  String? name;

  Division({this.id, this.name});

  Division.fromJson(Map<String, dynamic> json) {
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
  String? gstInfo;
  int? total;
  int? quantity;
  int? duration;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Product? product;
  List<Payments>? payments;

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
      this.payments});

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
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
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
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}

class Product {
  String? id;
  String? productType;
  Null? serviceType;
  String? name;
  String? description;
  int? mrp;
  int? salePrice;
  int? quantity;
  int? duration;
  String? downloadLink;
  String? packing;
  bool? status;
  bool? isTaxable;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  bool? distributorshipOnly;
  String? zohoItemId;
  bool? projectActivationDisabled;

  Product(
      {this.id,
      this.productType,
      this.serviceType,
      this.name,
      this.description,
      this.mrp,
      this.salePrice,
      this.quantity,
      this.duration,
      this.downloadLink,
      this.packing,
      this.status,
      this.isTaxable,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.distributorshipOnly,
      this.zohoItemId,
      this.projectActivationDisabled});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    serviceType = json['service_type'];
    name = json['name'];
    description = json['description'];
    mrp = json['mrp'];
    salePrice = json['sale_price'];
    quantity = json['quantity'];
    duration = json['duration'];
    downloadLink = json['download_link'];
    packing = json['packing'];
    status = json['status'];
    isTaxable = json['is_taxable'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    distributorshipOnly = json['distributorshipOnly'];
    zohoItemId = json['zoho_item_id'];
    projectActivationDisabled = json['project_activation_disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_type'] = this.productType;
    data['service_type'] = this.serviceType;
    data['name'] = this.name;
    data['description'] = this.description;
    data['mrp'] = this.mrp;
    data['sale_price'] = this.salePrice;
    data['quantity'] = this.quantity;
    data['duration'] = this.duration;
    data['download_link'] = this.downloadLink;
    data['packing'] = this.packing;
    data['status'] = this.status;
    data['is_taxable'] = this.isTaxable;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['distributorshipOnly'] = this.distributorshipOnly;
    data['zoho_item_id'] = this.zohoItemId;
    data['project_activation_disabled'] = this.projectActivationDisabled;
    return data;
  }
}

class Payments {
  String? id;
  int? amount;
  int? gstAndFees;
  String? paymentMode;
  String? paymentType;
  String? txnId;
  int? chequeNumber;
  Null? chequeDate;
  String? uploadDocument;
  Null? invoice;
  String? information;
  bool? isFresh;
  String? status;
  String? remark;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
      this.deletedAt});

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
    return data;
  }
}
