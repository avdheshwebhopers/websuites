class AddProductResponseModel {
  String? productType;
  String? name;
  String? description;
  int? quantity;
  int? duration;
  String? downloadLink;
  String? packing;
  bool? status;
  bool? isTaxable;
  ProductCategory? productCategory;
  Brand? brand;
  Brand? division;
  dynamic gst;
  dynamic serviceType;
  dynamic zohoItemId;
  String? id;
  int? mrp;
  int? salePrice;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  bool? distributorshipOnly;
  bool? projectActivationDisabled;

  AddProductResponseModel(
      {this.productType,
        this.name,
        this.description,
        this.quantity,
        this.duration,
        this.downloadLink,
        this.packing,
        this.status,
        this.isTaxable,
        this.productCategory,
        this.brand,
        this.division,
        this.gst,
        this.serviceType,
        this.zohoItemId,
        this.id,
        this.mrp,
        this.salePrice,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.distributorshipOnly,
        this.projectActivationDisabled});

  AddProductResponseModel.fromJson(Map<String, dynamic> json) {
    productType = json['product_type'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    duration = json['duration'];
    downloadLink = json['download_link'];
    packing = json['packing'];
    status = json['status'];
    isTaxable = json['is_taxable'];
    productCategory = json['product_category'] != null
        ? new ProductCategory.fromJson(json['product_category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    division =
    json['division'] != null ? new Brand.fromJson(json['division']) : null;
    gst = json['gst'];
    serviceType = json['service_type'];
    zohoItemId = json['zoho_item_id'];
    id = json['id'];
    mrp = json['mrp'];
    salePrice = json['sale_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    distributorshipOnly = json['distributorshipOnly'];
    projectActivationDisabled = json['project_activation_disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_type'] = this.productType;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['duration'] = this.duration;
    data['download_link'] = this.downloadLink;
    data['packing'] = this.packing;
    data['status'] = this.status;
    data['is_taxable'] = this.isTaxable;
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    data['gst'] = this.gst;
    data['service_type'] = this.serviceType;
    data['zoho_item_id'] = this.zohoItemId;
    data['id'] = this.id;
    data['mrp'] = this.mrp;
    data['sale_price'] = this.salePrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['distributorshipOnly'] = this.distributorshipOnly;
    data['project_activation_disabled'] = this.projectActivationDisabled;
    return data;
  }
}

class ProductCategory {
  String? id;
  String? name;
  String? description;
  dynamic image;
  String? createdAt;
  String? updatedAt;

  ProductCategory(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  String? id;
  Brand({this.id});
  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}