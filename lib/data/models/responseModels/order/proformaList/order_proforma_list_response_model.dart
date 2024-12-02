class OrderPerformaResponseModel {
  String? id;
  String? name;
  int? performaNumber;
  String? address;
  String? email;
  String? phone;
  String? performa;
  int? gstFees;
  int? tdsPercentage;
  int? amount;
  int? tdsAmount;
  int? totalAmount;
  String? remark;
  String? createdAt;
  String? updatedAt;
  Lead? lead;
  String? customer;
  CreatedBy? createdBy;
  List<Product>? products;

  OrderPerformaResponseModel({
    this.id,
    this.name,
    this.performaNumber,
    this.address,
    this.email,
    this.phone,
    this.performa,
    this.gstFees,
    this.tdsPercentage,
    this.amount,
    this.tdsAmount,
    this.totalAmount,
    this.remark,
    this.createdAt,
    this.updatedAt,
    this.lead,
    this.customer,
    this.createdBy,
    this.products,
  });

  factory OrderPerformaResponseModel.fromJson(Map<String, dynamic> json) {
    return OrderPerformaResponseModel(
      id: json['id'],
      name: json['name'],
      performaNumber: json['performa_number'],
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      performa: json['performa'],
      gstFees: json['gst_fees'],
      tdsPercentage: json['tds_percentage'],
      amount: json['amount'],
      tdsAmount: json['tds_amount'],
      totalAmount: json['total_amount'],
      remark: json['remark'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lead: json['lead'] != null ? Lead.fromJson(json['lead']) : null,
      customer: json['customer'],
      createdBy: json['created_by'] != null ? CreatedBy.fromJson(json['created_by']) : null,
      products: json['products'] != null
          ? (json['products'] as List).map((e) => Product.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'performa_number': performaNumber,
      'address': address,
      'email': email,
      'phone': phone,
      'performa': performa,
      'gst_fees': gstFees,
      'tds_percentage': tdsPercentage,
      'amount': amount,
      'tds_amount': tdsAmount,
      'total_amount': totalAmount,
      'remark': remark,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'lead': lead?.toJson(),
      'customer': customer,
      'created_by': createdBy?.toJson(),
      'products': products?.map((e) => e.toJson()).toList(),
    };
  }
}

class Lead {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? organization;

  Lead({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.organization,
  });

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      organization: json['organization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'organization': organization,
    };
  }
}

class CreatedBy {
  String? id;
  String? firstName;
  String? lastName;

  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
    };
  }
}

class Product {
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
  String? deletedAt;

  Product({
    this.id,
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
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      productType: json['product_type'],
      paymentMode: json['payment_mode'],
      paymentType: json['payment_type'],
      mrp: json['mrp'],
      salePrice: json['sale_price'],
      gst: json['gst'],
      gstPercentage: json['gst_percentage'],
      tdsOption: json['tds_option'],
      tds: json['tds'],
      tdsPercentage: json['tds_percentage'],
      gstInfo: json['gst_info'],
      total: json['total'],
      quantity: json['quantity'],
      duration: json['duration'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_type': productType,
      'payment_mode': paymentMode,
      'payment_type': paymentType,
      'mrp': mrp,
      'sale_price': salePrice,
      'gst': gst,
      'gst_percentage': gstPercentage,
      'tds_option': tdsOption,
      'tds': tds,
      'tds_percentage': tdsPercentage,
      'gst_info': gstInfo,
      'total': total,
      'quantity': quantity,
      'duration': duration,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}