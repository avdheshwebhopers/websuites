class OrderListResponseModel {
  OrderListResponseModel({
    required this.items,
    required this.meta,
    required this.userKey,
  });

  final List<Item> items;
  final Meta? meta;
  final dynamic userKey;

  factory OrderListResponseModel.fromJson(Map<String, dynamic> json){
    return OrderListResponseModel(
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      userKey: json["user_key"],
    );
  }

}

class Customer {
  Customer({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.primaryEmail,
    required this.countryCode,
    required this.primaryContact,
    required this.organization,
    required this.websites,
    required this.primaryAddress,
    required this.profileImage,
    required this.dob,
    required this.gstin,
    required this.aboutClient,
    required this.otherInformation,
    required this.lat,
    required this.lng,
    required this.joinedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.deleteRemark,
    required this.zohoContactId,
    required this.status,
    required this.subStatus,
    required this.source,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? primaryEmail;
  final int? countryCode;
  final String? primaryContact;
  final String? organization;
  final List<String> websites;
  final String? primaryAddress;
  final dynamic profileImage;
  final dynamic dob;
  final String? gstin;
  final String? aboutClient;
  final String? otherInformation;
  final num? lat;  // Changed to `num?` to allow both `int` and `double`
  final num? lng;  // Changed to `num?` to allow both `int` and `double`
  final dynamic joinedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final dynamic deleteRemark;
  final dynamic zohoContactId;
  final String? status;
  final dynamic subStatus;
  final Source? source;

  factory Customer.fromJson(Map<String, dynamic> json){
    return Customer(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      primaryEmail: json["primary_email"],
      countryCode: json["country_code"],
      primaryContact: json["primary_contact"],
      organization: json["organization"],
      websites: json["websites"] == null ? [] : List<String>.from(json["websites"]!.map((x) => x)),
      primaryAddress: json["primary_address"],
      profileImage: json["profile_image"],
      dob: json["dob"],
      gstin: json["gstin"],
      aboutClient: json["about_client"],
      otherInformation: json["other_information"],
      lat: json["lat"],  // Ensure the response value is a valid `num` (either `int` or `double`)
      lng: json["lng"],  // Ensure the response value is a valid `num` (either `int` or `double`)
      joinedAt: json["joined_at"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      deleteRemark: json["delete_remark"],
      zohoContactId: json["zoho_contact_id"],
      status: json["status"],
      subStatus: json["subStatus"],
      source: json["source"] == null ? null : Source.fromJson(json["source"]),
    );
  }
}

class Item {
  Item({
    required this.id,
    required this.orderNumber,
    required this.gstFees,
    required this.tdsPercentage,
    required this.amount,
    required this.tdsAmount,
    required this.totalAmount,
    required this.payabaleAmount,
    required this.performaInvoice,
    required this.status,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.deleteRemark,
    required this.zohoSalesorderId,
    required this.createdBy,
    required this.division,
    required this.company,
    required this.orderProducts,
    required this.payments,
    required this.customer,
    required this.credituse,
  });

  final String? id;
  final int? orderNumber;
  final int? gstFees;
  final int? tdsPercentage;
  final int? amount;
  final int? tdsAmount;
  final int? totalAmount;
  final int? payabaleAmount;
  final String? performaInvoice;
  final String? status;
  final String? remark;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final dynamic deleteRemark;
  final dynamic zohoSalesorderId;
  final CreatedBy? createdBy;
  final Division? division;
  final Company? company;
  final List<OrderProduct> orderProducts;
  final List<Payment> payments;
  final Customer? customer;
  final List<dynamic> credituse;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      id: json["id"],
      orderNumber: json["order_number"],
      gstFees: json["gst_fees"],
      tdsPercentage: json["tds_percentage"],
      amount: json["amount"],
      tdsAmount: json["tds_amount"],
      totalAmount: json["total_amount"],
      payabaleAmount: json["payabale_amount"],
      performaInvoice: json["performa_invoice"],
      status: json["status"],
      remark: json["remark"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      deleteRemark: json["delete_remark"],
      zohoSalesorderId: json["zoho_salesorder_id"],
      createdBy: json["created_by"] == null ? null : CreatedBy.fromJson(json["created_by"]),
      division: json["division"] == null ? null : Division.fromJson(json["division"]),
      company: json["company"] == null ? null : Company.fromJson(json["company"]),
      orderProducts: json["order_products"] == null ? [] : List<OrderProduct>.from(json["order_products"]!.map((x) => OrderProduct.fromJson(x))),
      payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
      customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
      credituse: json["credituse"] == null ? [] : List<dynamic>.from(json["credituse"]!.map((x) => x)),
    );
  }
}

class Company {
  Company({
    required this.id,
    required this.companyName,
    required this.companyEmail,
    required this.companyPhone,
    required this.countryCode,
    required this.contactPersonName,
    required this.contactPersonNumber,
    required this.cCountryCode,
    required this.address,
    required this.website,
    required this.gst,
    required this.logo,
    required this.lat,
    required this.lng,
  });

  final String? id;
  final String? companyName;
  final String? companyEmail;
  final String? companyPhone;
  final int? countryCode;
  final String? contactPersonName;
  final String? contactPersonNumber;
  final int? cCountryCode;
  final String? address;
  final String? website;
  final String? gst;
  final dynamic logo;
  final int? lat;
  final int? lng;

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      id: json["id"],
      companyName: json["company_name"],
      companyEmail: json["company_email"],
      companyPhone: json["company_phone"],
      countryCode: json["country_code"],
      contactPersonName: json["contact_person_name"],
      contactPersonNumber: json["contact_person_number"],
      cCountryCode: json["c_country_code"],
      address: json["address"],
      website: json["website"],
      gst: json["gst"],
      logo: json["logo"],
      lat: json["lat"],
      lng: json["lng"],
    );
  }

}

class CreatedBy {
  CreatedBy({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.address,
    required this.bio,
    required this.profilePic,
    required this.password,
    required this.status,
    required this.rememberToken,
    required this.rememberTokenTime,
    required this.createdByDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.deviceId,
    required this.tracking,
    required this.crmCategory,
    required this.mobileApp,
    required this.superSettings,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobile;
  final String? address;
  final String? bio;
  final String? profilePic;
  final String? password;
  final bool? status;
  final String? rememberToken;
  final dynamic rememberTokenTime;
  final bool? createdByDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deviceId;
  final bool? tracking;
  final String? crmCategory;
  final bool? mobileApp;
  final bool? superSettings;

  factory CreatedBy.fromJson(Map<String, dynamic> json){
    return CreatedBy(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      mobile: json["mobile"],
      address: json["address"],
      bio: json["bio"],
      profilePic: json["profile_pic"],
      password: json["password"],
      status: json["status"],
      rememberToken: json["remember_token"],
      rememberTokenTime: json["remember_token_time"],
      createdByDefault: json["default"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deviceId: json["device_id"],
      tracking: json["tracking"],
      crmCategory: json["crm_category"],
      mobileApp: json["mobile_app"],
      superSettings: json["superSettings"],
    );
  }

}



class Source {
  Source({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json){
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }

}

class Division {
  Division({
    required this.id,
    required this.name,
    required this.status,
    required this.mobileNo,
    required this.contactPerson,
    required this.email,
    required this.address,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
    required this.zohoOrganizationId,
    required this.zohoTaxExemptionId,
  });

  final String? id;
  final String? name;
  final String? status;
  final String? mobileNo;
  final String? contactPerson;
  final String? email;
  final String? address;
  final String? logo;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? zohoOrganizationId;
  final String? zohoTaxExemptionId;

  factory Division.fromJson(Map<String, dynamic> json){
    return Division(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      mobileNo: json["mobile_no"],
      contactPerson: json["contact_person"],
      email: json["email"],
      address: json["address"],
      logo: json["logo"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      zohoOrganizationId: json["zoho_organization_id"],
      zohoTaxExemptionId: json["zoho_tax_exemption_id"],
    );
  }

}

class OrderProduct {
  OrderProduct({
    required this.id,
    required this.productType,
    required this.paymentMode,
    required this.paymentType,
    required this.mrp,
    required this.salePrice,
    required this.gst,
    required this.gstPercentage,
    required this.tdsOption,
    required this.tds,
    required this.tdsPercentage,
    required this.gstInfo,
    required this.total,
    required this.quantity,
    required this.duration,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.product,
    required this.payments,
  });

  final String? id;
  final String? productType;
  final String? paymentMode;
  final String? paymentType;
  final int? mrp;
  final int? salePrice;
  final int? gst;
  final int? gstPercentage;
  final String? tdsOption;
  final int? tds;
  final int? tdsPercentage;
  final String? gstInfo;
  final int? total;
  final int? quantity;
  final int? duration;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final Product? product;
  final List<Payment> payments;

  factory OrderProduct.fromJson(Map<String, dynamic> json){
    return OrderProduct(
      id: json["id"],
      productType: json["product_type"],
      paymentMode: json["payment_mode"],
      paymentType: json["payment_type"],
      mrp: json["mrp"],
      salePrice: json["sale_price"],
      gst: json["gst"],
      gstPercentage: json["gst_percentage"],
      tdsOption: json["tds_option"],
      tds: json["tds"],
      tdsPercentage: json["tds_percentage"],
      gstInfo: json["gst_info"],
      total: json["total"],
      quantity: json["quantity"],
      duration: json["duration"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      product: json["product"] == null ? null : Product.fromJson(json["product"]),
      payments: json["payments"] == null ? [] : List<Payment>.from(json["payments"]!.map((x) => Payment.fromJson(x))),
    );
  }

}

class Payment {
  Payment({
    required this.id,
    required this.amount,
    required this.gstAndFees,
    required this.paymentMode,
    required this.paymentType,
    required this.txnId,
    required this.chequeNumber,
    required this.chequeDate,
    required this.uploadDocument,
    required this.invoice,
    required this.information,
    required this.isFresh,
    required this.status,
    required this.remark,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final String? id;
  final int? amount;
  final int? gstAndFees;
  final String? paymentMode;
  final String? paymentType;
  final String? txnId;
  final int? chequeNumber;
  final DateTime? chequeDate;
  final String? uploadDocument;
  final dynamic invoice;
  final String? information;
  final bool? isFresh;
  final String? status;
  final String? remark;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory Payment.fromJson(Map<String, dynamic> json){
    return Payment(
      id: json["id"],
      amount: json["amount"],
      gstAndFees: json["gst_and_fees"],
      paymentMode: json["payment_mode"],
      paymentType: json["payment_type"],
      txnId: json["txn_id"],
      chequeNumber: json["cheque_number"],
      chequeDate: DateTime.tryParse(json["cheque_date"] ?? ""),
      uploadDocument: json["upload_document"],
      invoice: json["invoice"],
      information: json["information"],
      isFresh: json["is_fresh"],
      status: json["status"],
      remark: json["remark"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
    );
  }

}

class Product {
  Product({
    required this.id,
    required this.productType,
    required this.serviceType,
    required this.name,
    required this.description,
    required this.mrp,
    required this.salePrice,
    required this.quantity,
    required this.duration,
    required this.downloadLink,
    required this.packing,
    required this.status,
    required this.isTaxable,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.distributorshipOnly,
    required this.zohoItemId,
    required this.projectActivationDisabled,
  });

  final String? id;
  final String? productType;
  final dynamic serviceType;
  final String? name;
  final String? description;
  final int? mrp;
  final int? salePrice;
  final int? quantity;
  final int? duration;
  final String? downloadLink;
  final String? packing;
  final bool? status;
  final bool? isTaxable;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final bool? distributorshipOnly;
  final String? zohoItemId;
  final bool? projectActivationDisabled;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json["id"],
      productType: json["product_type"],
      serviceType: json["service_type"],
      name: json["name"],
      description: json["description"],
      mrp: json["mrp"],
      salePrice: json["sale_price"],
      quantity: json["quantity"],
      duration: json["duration"],
      downloadLink: json["download_link"],
      packing: json["packing"],
      status: json["status"],
      isTaxable: json["is_taxable"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      deletedAt: json["deleted_at"],
      distributorshipOnly: json["distributorshipOnly"],
      zohoItemId: json["zoho_item_id"],
      projectActivationDisabled: json["project_activation_disabled"],
    );
  }

}

class Meta {
  Meta({
    required this.currentPage,
    required this.itemsPerPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemCount,
  });

  final int? currentPage;
  final int? itemsPerPage;
  final int? totalPages;
  final int? totalItems;
  final int? itemCount;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      currentPage: json["currentPage"],
      itemsPerPage: json["itemsPerPage"],
      totalPages: json["totalPages"],
      totalItems: json["totalItems"],
      itemCount: json["itemCount"],
    );
  }

}
