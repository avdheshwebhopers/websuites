import '../../customers/orderProducts/customer_order_products_response_model.dart' as customerModels;
import '../../customers/orderProducts/customer_order_products_response_model.dart';
import '../../leads/lead_activity/lead_activity_list/lead_activity_list.dart' as leadModels;
import '../../leads/lead_activity/lead_activity_list/lead_activity_list.dart';

class SalesProjectionsListResponseModel {
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
  String? customer; // Change this to String? or a specific model
  customerModels.CreatedBy? createdBy; // Use the prefix for clarity

  SalesProjectionsListResponseModel({
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

  SalesProjectionsListResponseModel.fromJson(Map<String, dynamic> json) {
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
    customer = json['customer'] != null ? json['customer'] : null; // Handle customer correctly
    createdBy = json['created_by'] != null
        ? customerModels.CreatedBy.fromJson(json['created_by']) // Use the prefix here
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
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
    data['customer'] = customer; // Handle customer correctly
    if (createdBy != null) {
      data['created_by'] = createdBy!.toJson(); // Use the prefix here if needed
    }
    return data;
  }
}