class OrderActivitiesResponseModel {
  Meta? meta;
  List<Products>? products;

  OrderActivitiesResponseModel({this.meta, this.products});

  OrderActivitiesResponseModel.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? currentPage;
  int? totalOrderCount;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;
  double? totalSalePrice;

  Meta({
    this.currentPage,
    this.totalOrderCount,
    this.itemsPerPage,
    this.totalPages,
    this.totalItems,
    this.itemCount,
    this.totalSalePrice,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalOrderCount = json['totalOrderCount'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
    totalSalePrice = json['totalSalePrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['totalOrderCount'] = totalOrderCount;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    data['totalSalePrice'] = totalSalePrice;
    return data;
  }
}

class Products {
  String? productId;
  String? productProductType;
  String? productName;
  String? productDescription;
  int? productMrp;
  int? productSalePrice;
  int? productQuantity;
  int? productDuration;
  String? productDownloadLink;
  String? productPacking;
  int? productStatus;
  int? productIsTaxable;
  String? productCreatedAt;
  String? productUpdatedAt;
  String? productDeletedAt;
  String? productZohoItemId;
  String? orderCount;
  int? salePriceSum;

  Products({
    this.productId,
    this.productProductType,
    this.productName,
    this.productDescription,
    this.productMrp,
    this.productSalePrice,
    this.productQuantity,
    this.productDuration,
    this.productDownloadLink,
    this.productPacking,
    this.productStatus,
    this.productIsTaxable,
    this.productCreatedAt,
    this.productUpdatedAt,
    this.productDeletedAt,
    this.productZohoItemId,
    this.orderCount,
    this.salePriceSum,
  });

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productProductType = json['product_product_type'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productMrp = json['product_mrp'];
    productSalePrice = json['product_sale_price'];
    productQuantity = json['product_quantity'];
    productDuration = json['product_duration'];
    productDownloadLink = json['product_download_link'];
    productPacking = json['product_packing'];
    productStatus = json['product_status'];
    productIsTaxable = json['product_is_taxable'];
    productCreatedAt = json['product_created_at'];
    productUpdatedAt = json['product_updated_at'];
    productDeletedAt = json['product_deleted_at'];
    productZohoItemId = json['product_zoho_item_id'];
    orderCount = json['order_count'];
    salePriceSum = json['sale_price_sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_product_type'] = productProductType;
    data['product_name'] = productName;
    data['product_description'] = productDescription;
    data['product_mrp'] = productMrp;
    data['product_sale_price'] = productSalePrice;
    data['product_quantity'] = productQuantity;
    data['product_duration'] = productDuration;
    data['product_download_link'] = productDownloadLink;
    data['product_packing'] = productPacking;
    data['product_status'] = productStatus;
    data['product_is_taxable'] = productIsTaxable;
    data['product_created_at'] = productCreatedAt;
    data['product_updated_at'] = productUpdatedAt;
    data['product_deleted_at'] = productDeletedAt;
    data['product_zoho_item_id'] = productZohoItemId;
    data['order_count'] = orderCount;
    data['sale_price_sum'] = salePriceSum;
    return data;
  }
}
