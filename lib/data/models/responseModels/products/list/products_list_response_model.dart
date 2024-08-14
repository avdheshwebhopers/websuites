class ProductsListResponseModel {
  List<Items>? items;
  Meta? meta;

  ProductsListResponseModel({this.items, this.meta});

  ProductsListResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Items {
  String? id;
  String? productType;
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
  String? deletedAt;
  String? zohoItemId;
  bool? projectActivationDisabled;
  ProductCategory? productCategory;
  Brand? brand;
  Gst? gst;
  Division? division;
  List<ProductPrices>? productPrices;
  Inventory? inventory;

  Items(
      {this.id,
        this.productType,
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
        this.zohoItemId,
        this.projectActivationDisabled,
        this.productCategory,
        this.brand,
        this.gst,
        this.division,
        this.productPrices,
        this.inventory
      });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
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
    zohoItemId = json['zoho_item_id'];
    projectActivationDisabled = json['project_activation_disabled'];
    productCategory = json['product_category'] != null
        ? ProductCategory.fromJson(json['product_category'])
        : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    gst = json['gst'] != null ? Gst.fromJson(json['gst']) : null;
    division = json['division'] != null
        ? Division.fromJson(json['division'])
        : null;
    if (json['productPrices'] != null) {
      productPrices = <ProductPrices>[];
      json['productPrices'].forEach((v) {
        productPrices!.add(ProductPrices.fromJson(v));
      });
    }
    inventory = json['inventory'] != null
        ? Inventory.fromJson(json['inventory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = productType;
    data['name'] = name;
    data['description'] = description;
    data['mrp'] = mrp;
    data['sale_price'] = salePrice;
    data['quantity'] = quantity;
    data['duration'] = duration;
    data['download_link'] = downloadLink;
    data['packing'] = packing;
    data['status'] = status;
    data['is_taxable'] = isTaxable;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['zoho_item_id'] = zohoItemId;
    data['project_activation_disabled'] = projectActivationDisabled;
    if (productCategory != null) {
      data['product_category'] = productCategory!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (gst != null) {
      data['gst'] = gst!.toJson();
    }
    if (division != null) {
      data['division'] = division!.toJson();
    }
    if (productPrices != null) {
      data['productPrices'] =
          productPrices!.map((v) => v.toJson()).toList();
    }
    if (inventory != null) {
      data['inventory'] = inventory!.toJson();
    }
    return data;
  }
}

class ProductCategory {
  String? id;
  String? name;
  String? description;
  String? image;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Gst {
  String? id;
  String? name;
  int? sgst;
  int? cgst;
  int? igst;
  int? status;
  String? createdAt;
  String? updatedAt;

  Gst(
      {this.id,
        this.name,
        this.sgst,
        this.cgst,
        this.igst,
        this.status,
        this.createdAt,
        this.updatedAt});

  Gst.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sgst = json['sgst'];
    cgst = json['cgst'];
    igst = json['igst'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['sgst'] = sgst;
    data['cgst'] = cgst;
    data['igst'] = igst;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ProductPrices {
  String? id;
  int? mrp;
  int? salePrice;
  String? createdAt;
  String? updatedAt;
  Currency? currency;

  ProductPrices(
      {this.id,
        this.mrp,
        this.salePrice,
        this.createdAt,
        this.updatedAt,
        this.currency});

  ProductPrices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mrp = json['mrp'];
    salePrice = json['sale_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    currency = json['currency'] != null
        ? Currency.fromJson(json['currency'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mrp'] = mrp;
    data['sale_price'] = salePrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (currency != null) {
      data['currency'] = currency!.toJson();
    }
    return data;
  }
}

class Currency {
  String? id;
  String? name;
  String? code;
  String? symbol;
  String? createdAt;
  String? updatedAt;

  Currency(
      {this.id,
        this.name,
        this.code,
        this.symbol,
        this.createdAt,
        this.updatedAt});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    symbol = json['symbol'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['symbol'] = symbol;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Inventory {
  String? id;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  List<InventoryStocks>? inventoryStocks;

  Inventory(
      {this.id,
        this.quantity,
        this.createdAt,
        this.updatedAt,
        this.inventoryStocks});

  Inventory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['inventoryStocks'] != null) {
      inventoryStocks = <InventoryStocks>[];
      json['inventoryStocks'].forEach((v) {
        inventoryStocks!.add(InventoryStocks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (inventoryStocks != null) {
      data['inventoryStocks'] =
          inventoryStocks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InventoryStocks {
  String? id;
  int? quantity;
  int? price;
  String? batch;
  String? expiryDate;
  String? createdAt;
  String? updatedAt;
  Manufacturer? manufacturer;

  InventoryStocks(
      {this.id,
        this.quantity,
        this.price,
        this.batch,
        this.expiryDate,
        this.createdAt,
        this.updatedAt,
        this.manufacturer});

  InventoryStocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    batch = json['batch'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    manufacturer = json['manufacturer'] != null
        ? Manufacturer.fromJson(json['manufacturer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    data['batch'] = batch;
    data['expiry_date'] = expiryDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (manufacturer != null) {
      data['manufacturer'] = manufacturer!.toJson();
    }
    return data;
  }
}

class Manufacturer {
  String? id;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? createdAt;
  String? updatedAt;

  Manufacturer(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.address,
        this.createdAt,
        this.updatedAt});

  Manufacturer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['email'] = email;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;

  Meta(
      {this.currentPage,
        this.itemsPerPage,
        this.totalPages,
        this.totalItems,
        this.itemCount});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    return data;
  }
}