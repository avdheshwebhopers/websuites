class UpdateProductResponseModel {
  String? id;
  String? productType;
  dynamic serviceType;
  String? name;
  String? description;
  String? mrp;
  String? salePrice;
  int? quantity;
  int? duration;
  String? downloadLink;
  String? packing;
  bool? status;
  bool? isTaxable;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  bool? distributorshipOnly;
  dynamic zohoItemId;
  bool? projectActivationDisabled;
  ProductCategory? productCategory;
  dynamic gst;
  Brand? brand;
  Division? division;

  UpdateProductResponseModel(
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
        this.projectActivationDisabled,
        this.productCategory,
        this.gst,
        this.brand,
        this.division});

  UpdateProductResponseModel.fromJson(Map<String, dynamic> json) {
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
    productCategory = json['product_category'] != null
        ? new ProductCategory.fromJson(json['product_category'])
        : null;
    gst = json['gst'];
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
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
    if (this.productCategory != null) {
      data['product_category'] = this.productCategory!.toJson();
    }
    data['gst'] = this.gst;
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
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
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Brand({this.id, this.name, this.description, this.createdAt, this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Division {
  String? id;
  String? name;
  String? status;
  String? mobileNo;
  String? contactPerson;
  String? email;
  String? address;
  String? logo;
  String? createdAt;
  String? updatedAt;
  dynamic zohoOrganizationId;
  dynamic zohoTaxExemptionId;

  Division(
      {this.id,
        this.name,
        this.status,
        this.mobileNo,
        this.contactPerson,
        this.email,
        this.address,
        this.logo,
        this.createdAt,
        this.updatedAt,
        this.zohoOrganizationId,
        this.zohoTaxExemptionId});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    mobileNo = json['mobile_no'];
    contactPerson = json['contact_person'];
    email = json['email'];
    address = json['address'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    zohoOrganizationId = json['zoho_organization_id'];
    zohoTaxExemptionId = json['zoho_tax_exemption_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['mobile_no'] = this.mobileNo;
    data['contact_person'] = this.contactPerson;
    data['email'] = this.email;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['zoho_organization_id'] = this.zohoOrganizationId;
    data['zoho_tax_exemption_id'] = this.zohoTaxExemptionId;
    return data;
  }
}