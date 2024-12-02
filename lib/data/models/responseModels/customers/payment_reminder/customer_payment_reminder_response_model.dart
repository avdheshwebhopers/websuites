import '../../leads/LeadTrash/TrashLeads.dart';

class CustomerPaymentsReminderResponseModel {
  CustomerPaymentsReminderResponseModel({
    required this.items,
    this.meta,
    this.userKey,
  });

  final List<PaymentReminderItem> items; // Use the renamed class
  final Meta? meta;
  final dynamic userKey;

  factory CustomerPaymentsReminderResponseModel.fromJson(Map<String, dynamic> json) {
    return CustomerPaymentsReminderResponseModel(
      items: json["items"] == null
          ? []
          : List<PaymentReminderItem>.from(json["items"]!.map((x) => PaymentReminderItem.fromJson(x))), // Update here
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      userKey: json["user_key"],
    );
  }
}

class PaymentReminderItem {
  PaymentReminderItem({
    this.id,
    this.amount,
    this.chequeDate,
    this.chequeNumber,
    this.cheque,
    this.reminderDate,
    this.status,
    this.createdAt,
    this.orders,
    this.product,
    this.reminderTo,
    this.createdBy,
  });

  final String? id;
  final int? amount;
  final DateTime? chequeDate;
  final String? chequeNumber;
  final String? cheque;
  final DateTime? reminderDate;
  final String? status;
  final DateTime? createdAt;
  final Orders? orders;
  final Product? product;
  final CreatedBy? reminderTo;
  final CreatedBy? createdBy;

  factory PaymentReminderItem.fromJson(Map<String, dynamic> json) {
    return PaymentReminderItem(
      id: json["id"],
      amount: json["amount"],
      chequeDate: DateTime.tryParse(json["cheque_date"] ?? ""),
      chequeNumber: json["cheque_number"],
      cheque: json["cheque"],
      reminderDate: DateTime.tryParse(json["reminder_date"] ?? ""),
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      orders: json["orders"] == null ? null : Orders.fromJson(json["orders"]),
      product: json["product"] == null ? null : Product.fromJson(json["product"]),
      reminderTo: json["reminder_to"] == null ? null : CreatedBy.fromJson(json["reminder_to"]),
      createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
    );
  }
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
  });

  final String? id;
  final String? firstName;
  final String? lastName;

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
    );
  }
}

class Orders {
  Orders({
    this.id,
    this.orderNumber,
    this.customer,
    this.company,
  });

  final String? id;
  final int? orderNumber;
  final CreatedBy? customer;
  final Company? company;

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      id: json["id"],
      orderNumber: json["order_number"],
      customer: json["customer"] == null ? null : CreatedBy.fromJson(json["customer"]),
      company: json["company"] == null ? null : Company.fromJson(json["company"]),
    );
  }
}

class Company {
  Company({
    this.id,
    this.companyName,
  });

  final String? id;
  final String? companyName;

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"],
      companyName: json["company_name"],
    );
  }
}

class Product {
  Product({
    this.id,
    this.name,
    this.productCategory,
    this.brand,
  });

  final String? id;
  final String? name;
  final Brand? productCategory;
  final Brand? brand;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      productCategory: json["product_category"] == null ? null : Brand.fromJson(json["product_category"]),
      brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    );
  }
}

class Brand {
  Brand({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json["id"],
      name: json["name"],
    );
  }
}

class Meta {
  Meta({
    this.total,
    this.currentPage,
    this.itemsPerPage,
    this.totalPages,
    this.totalItems,
    this.itemCount,
  });

  final int? total;
  final int? currentPage;
  final int? itemsPerPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemCount;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json["total"],
      currentPage: json["currentPage"],
      itemsPerPage: json["itemsPerPage"],
      totalPages: json["totalPages"],
      totalItems: json["totalItems"],
      itemCount: json["itemCount"],
    );
  }
}
