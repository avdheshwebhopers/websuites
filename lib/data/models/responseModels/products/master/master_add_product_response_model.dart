class MasterAddProductResponseModel {
  Product? product;
  int? incentive;
  String? incentiveType;
  bool? isSale;
  int? minimumSalePrice;
  String? id;
  String? createdAt;
  String? updatedAt;

  MasterAddProductResponseModel(
      {this.product,
        this.incentive,
        this.incentiveType,
        this.isSale,
        this.minimumSalePrice,
        this.id,
        this.createdAt,
        this.updatedAt});

  MasterAddProductResponseModel.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    incentive = json['incentive'];
    incentiveType = json['incentive_type'];
    isSale = json['is_sale'];
    minimumSalePrice = json['minimum_sale_price'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['incentive'] = this.incentive;
    data['incentive_type'] = this.incentiveType;
    data['is_sale'] = this.isSale;
    data['minimum_sale_price'] = this.minimumSalePrice;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  Null? zohoItemId;
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