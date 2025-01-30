import '../../../customers/orderProducts/customer_order_products_response_model.dart';
import '../../../leads/lead_activity/lead_activity_list/lead_activity_list.dart' hide CreatedBy;

class SalesUpdateProjectionListResponseModel {
  String? id;
  int? amount;
  bool? isClosed;
  String? status;
  String? projectionDate;
  String? createdAt;
  String? updatedAt;
  ProductCategory? productCategory;
  Product? product;
  Lead? lead;
  dynamic customer;  // dynamic used as customer can be null or have a type that is unknown
  CreatedBy? createdBy; // This will refer to the one from customer_order_products_response_model.dart

  SalesUpdateProjectionListResponseModel({
    this.id,
    this.amount,
    this.isClosed,
    this.status,
    this.projectionDate,
    this.createdAt,
    this.updatedAt,
    this.productCategory,
    this.product,
    this.lead,
    this.customer,
    this.createdBy,
  });

  SalesUpdateProjectionListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    isClosed = json['isClosed'];
    status = json['status'];
    projectionDate = json['projection_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    productCategory = json['product_category'] != null
        ? ProductCategory.fromJson(json['product_category'])
        : null;
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
    lead = json['lead'] != null ? Lead.fromJson(json['lead']) : null;
    customer = json['customer'];  // Allow dynamic nullability
    createdBy = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by']) // This refers to the one from customer_order_products_response_model.dart
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['isClosed'] = isClosed;
    data['status'] = status;
    data['projection_date'] = projectionDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    if (productCategory != null) {
      data['product_category'] = productCategory!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (lead != null) {
      data['lead'] = lead!.toJson();
    }
    data['customer'] = customer;  // customer can still be null or dynamic
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson();
    }
    return data;
  }

  static List<SalesUpdateProjectionListResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => SalesUpdateProjectionListResponseModel.fromJson(json)).toList();
  }
}