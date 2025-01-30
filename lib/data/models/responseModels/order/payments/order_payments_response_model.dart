class OrderPaymentsResponseModel {
  List<Items>? items;
  Meta? meta;
  String? userKey;

  OrderPaymentsResponseModel({this.items, this.meta, this.userKey});

  OrderPaymentsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    userKey = json['user_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = userKey;
    return data;
  }
}

class Items {
  String? id;
  num? amount;
  num? gst_and_fees;
  String? payment_mode;
  String? payment_type;
  String? txn_id;
  num? cheque_number;
  String? cheque_date;
  String? upload_document;
  String? invoice;
  String? information;
  bool? is_fresh;
  String? status;
  String? remark;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  CreatedBy? created_by;
  Order? order;
  Product? product;
  dynamic status_action_by;

  Items(
      {this.id,
        this.amount,
        this.gst_and_fees,
        this.payment_mode,
        this.payment_type,
        this.txn_id,
        this.cheque_number,
        this.cheque_date,
        this.upload_document,
        this.invoice,
        this.information,
        this.is_fresh,
        this.status,
        this.remark,
        this.created_at,
        this.updated_at,
        this.deleted_at,
        this.created_by,
        this.order,
        this.product,
        this.status_action_by});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    gst_and_fees = json['gst_and_fees'];
    payment_mode = json['payment_mode'];
    payment_type = json['payment_type'];
    txn_id = json['txn_id'];
    cheque_number = json['cheque_number'];
    cheque_date = json['cheque_date'];
    upload_document = json['upload_document'];
    invoice = json['invoice'];
    information = json['information'];
    is_fresh = json['is_fresh'];
    status = json['status'];
    remark = json['remark'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    created_by = json['created_by'] != null
        ? CreatedBy.fromJson(json['created_by'])
        : null;
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
    status_action_by = json['status_action_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['amount'] = amount;
    data['gst_and_fees'] = gst_and_fees;
    data['payment_mode'] = payment_mode;
    data['payment_type'] = payment_type;
    data['txn_id'] = txn_id;
    data['cheque_number'] = cheque_number;
    data['cheque_date'] = cheque_date;
    data['upload_document'] = upload_document;
    data['invoice'] = invoice;
    data['information'] = information;
    data['is_fresh'] = is_fresh;
    data['status'] = status;
    data['remark'] = remark;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    if (created_by != null) {
      data['created_by'] = created_by!.toJson();
    }
    if (order != null) {
      data['order'] = order!.toJson();
    }
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['status_action_by'] = status_action_by;
    return data;
  }
}



class CreatedBy {
  String? id;
  String? first_name;
  String? last_name;
  String? email;
  String? mobile;
  String? address;
  String? bio;
  String? profile_pic;
  String? password;
  bool? status;
  String? remember_token;
  String? remember_token_time;
  bool? isdefault;
  String? created_at;
  String? updated_at;
  String? device_id;
  bool? tracking;
  String? crm_category;
  bool? mobile_app;
  bool? super_settings;

  CreatedBy(
      {this.id,
      this.first_name,
      this.last_name,
      this.email,
      this.mobile,
      this.address,
      this.bio,
      this.profile_pic,
      this.password,
      this.status,
      this.remember_token,
      this.remember_token_time,
      this.isdefault,
      this.created_at,
      this.updated_at,
      this.device_id,
      this.tracking,
      this.crm_category,
      this.mobile_app,
      this.super_settings});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    bio = json['bio'];
    profile_pic = json['profile_pic'];
    password = json['password'];
    status = json['status'];
    remember_token = json['remember_token'];
    remember_token_time = json['remember_token_time'];
    isdefault = json['default'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    device_id = json['device_id'];
    tracking = json['tracking'];
    crm_category = json['crm_category'];
    mobile_app = json['mobile_app'];
    super_settings = json['superSettings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['bio'] = bio;
    data['profile_pic'] = profile_pic;
    data['password'] = password;
    data['status'] = status;
    data['remember_token'] = remember_token;
    data['remember_token_time'] = remember_token_time;
    data['default'] = isdefault;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['device_id'] = device_id;
    data['tracking'] = tracking;
    data['crm_category'] = crm_category;
    data['mobile_app'] = mobile_app;
    data['superSettings'] = super_settings;
    return data;
  }
}

class Order {
  String? id;
  num? orderNumber; // Changed from double? to num?
  num? gstFees; // Changed from double? to num?
  num? tdsPercentage; // Changed from double? to num?
  num? amount; // Changed from double? to num?
  num? tdsAmount; // Changed from double? to num?
  num? totalAmount; // Changed from double? to num?
  num? payableAmount; // Changed from double? to num?
  String? performaInvoice;
  String? status;
  String? remark;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? deleteRemark;
  String? zohoSalesOrderId;
  Customer? customer;
  Company? company;

  Order({
    this.id,
    this.orderNumber,
    this.gstFees,
    this.tdsPercentage,
    this.amount,
    this.tdsAmount,
    this.totalAmount,
    this.payableAmount,
    this.performaInvoice,
    this.status,
    this.remark,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deleteRemark,
    this.zohoSalesOrderId,
    this.customer,
    this.company,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String?,
      orderNumber: json['order_number'] as num?,
      gstFees: json['gst_fees'] as num?,
      tdsPercentage: json['tds_percentage'] as num?,
      amount: json['amount'] as num?,
      tdsAmount: json['tds_amount'] as num?,
      totalAmount: json['total_amount'] as num?,
      payableAmount: json['payabale_amount'] as num?,
      performaInvoice: json['performa_invoice'] as String?,
      status: json['status'] as String?,
      remark: json['remark'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      deleteRemark: json['delete_remark'] as String?,
      zohoSalesOrderId: json['zoho_salesorder_id'] as String?,
      customer: json['customer'] != null
          ? Customer.fromJson(json['customer'])
          : null,
      company: json['company'] != null
          ? Company.fromJson(json['company'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = orderNumber;
    data['gst_fees'] = gstFees;
    data['tds_percentage'] = tdsPercentage;
    data['amount'] = amount;
    data['tds_amount'] = tdsAmount;
    data['total_amount'] = totalAmount;
    data['payabale_amount'] = payableAmount;
    data['performa_invoice'] = performaInvoice;
    data['status'] = status;
    data['remark'] = remark;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['delete_remark'] = deleteRemark;
    data['zoho_salesorder_id'] = zohoSalesOrderId;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }
}


class Customer {
  String? id;
  String? companyName;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  num? countryCode; // Changed from double? to num?
  String? primaryContact;
  String? organization;
  String? primaryAddress;
  String? profileImage;
  String? dob;
  String? aboutClient;
  String? otherInformation;
  num? lat; // Changed from double? to num?
  num? lng; // Changed from double? to num?
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? deleteRemark;
  String? zohoContactId;
  String? status;
  String? subStatus;
  List<Division>? divisions;

  Customer({
    this.id,
    this.companyName,
    this.firstName,
    this.lastName,
    this.primaryEmail,
    this.countryCode,
    this.primaryContact,
    this.organization,
    this.primaryAddress,
    this.profileImage,
    this.dob,
    this.aboutClient,
    this.otherInformation,
    this.lat,
    this.lng,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.deleteRemark,
    this.zohoContactId,
    this.status,
    this.subStatus,
    this.divisions,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] as String?,
      companyName: json['company_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      primaryEmail: json['primary_email'] as String?,
      countryCode: json['country_code'] as num?, // Accepts both int and double
      primaryContact: json['primary_contact'] as String?,
      organization: json['organization'] as String?,
      primaryAddress: json['primary_address'] as String?,
      profileImage: json['profile_image'] as String?,
      dob: json['dob'] as String?,
      aboutClient: json['about_client'] as String?,
      otherInformation: json['other_information'] as String?,
      lat: json['lat'] as num?, // Accepts both int and double
      lng: json['lng'] as num?, // Accepts both int and double
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      deleteRemark: json['delete_remark'] as String?,
      zohoContactId: json['zoho_contact_id'] as String?,
      status: json['status'] as String?,
      subStatus: json['subStatus'] as String?,
      divisions: (json['divisions'] as List<dynamic>?)
          ?.map((v) => Division.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['primary_email'] = primaryEmail;
    data['country_code'] = countryCode;
    data['primary_contact'] = primaryContact;
    data['organization'] = organization;
    data['primary_address'] = primaryAddress;
    data['profile_image'] = profileImage;
    data['dob'] = dob;
    data['about_client'] = aboutClient;
    data['other_information'] = otherInformation;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['delete_remark'] = deleteRemark;
    data['zoho_contact_id'] = zohoContactId;
    data['status'] = status;
    data['subStatus'] = subStatus;
    if (divisions != null) {
      data['divisions'] = divisions!.map((v) => v.toJson()).toList();
    }
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
  String? zohoOrganizationId;
  String? zohoTaxExemptionId;

  Division({
    this.id,
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
    this.zohoTaxExemptionId,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
    id: json['id'],
    name: json['name'],
    status: json['status'],
    mobileNo: json['mobile_no'],
    contactPerson: json['contact_person'],
    email: json['email'],
    address: json['address'],
    logo: json['logo'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    zohoOrganizationId: json['zoho_organization_id'],
    zohoTaxExemptionId: json['zoho_tax_exemption_id'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'status': status,
    'mobile_no': mobileNo,
    'contact_person': contactPerson,
    'email': email,
    'address': address,
    'logo': logo,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'zoho_organization_id': zohoOrganizationId,
    'zoho_tax_exemption_id': zohoTaxExemptionId,
  };
}

class Company {
  String? id;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  num? countryCode;
  String? contactPersonName;
  String? contactPersonNumber;
  num? contactCountryCode;
  String? address;
  String? website;
  String? gst;
  String? logo;
  num? latitude;
  num? longitude;

  Company({
    this.id,
    this.companyName,
    this.companyEmail,
    this.companyPhone,
    this.countryCode,
    this.contactPersonName,
    this.contactPersonNumber,
    this.contactCountryCode,
    this.address,
    this.website,
    this.gst,
    this.logo,
    this.latitude,
    this.longitude,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json['id'],
    companyName: json['company_name'],
    companyEmail: json['company_email'],
    companyPhone: json['company_phone'],
    countryCode: json['country_code'],
    contactPersonName: json['contact_person_name'],
    contactPersonNumber: json['contact_person_number'],
    contactCountryCode: json['c_country_code'],
    address: json['address'],
    website: json['website'],
    gst: json['gst'],
    logo: json['logo'],
    latitude: json['lat'],
    longitude: json['lng'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'company_name': companyName,
    'company_email': companyEmail,
    'company_phone': companyPhone,
    'country_code': countryCode,
    'contact_person_name': contactPersonName,
    'contact_person_number': contactPersonNumber,
    'c_country_code': contactCountryCode,
    'address': address,
    'website': website,
    'gst': gst,
    'logo': logo,
    'lat': latitude,
    'lng': longitude,
  };
}

class Product {
  String? id;
  String? productType;
  String? name;
  String? description;
  num? mrp;
  num? salePrice;
  num? quantity;
  num? duration;
  String? downloadLink;
  String? packing;
  bool? status;
  bool? isTaxable;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? zohoItemId;
  bool? projectActivationDisabled;

  Product({
    this.id,
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
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    productType: json['product_type'],
    name: json['name'],
    description: json['description'],
    mrp: json['mrp'],
    salePrice: json['sale_price'],
    quantity: json['quantity'],
    duration: json['duration'],
    downloadLink: json['download_link'],
    packing: json['packing'],
    status: json['status'],
    isTaxable: json['is_taxable'],
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
    deletedAt: json['deleted_at'],
    zohoItemId: json['zoho_item_id'],
    projectActivationDisabled: json['project_activation_disabled'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_type': productType,
    'name': name,
    'description': description,
    'mrp': mrp,
    'sale_price': salePrice,
    'quantity': quantity,
    'duration': duration,
    'download_link': downloadLink,
    'packing': packing,
    'status': status,
    'is_taxable': isTaxable,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'deleted_at': deletedAt,
    'zoho_item_id': zohoItemId,
    'project_activation_disabled': projectActivationDisabled,
  };
}



class Meta {
  num? currentPage;
  num? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;
  num? totalAmount;
  num? approvedAmount;
  int? cancelledAmount;

  Meta({
    this.currentPage,
    this.itemsPerPage,
    this.totalPages,
    this.totalItems,
    this.itemCount,
    this.totalAmount,
    this.approvedAmount,
    this.cancelledAmount,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json['currentPage'],
    itemsPerPage: json['itemsPerPage'],
    totalPages: json['totalPages'],
    totalItems: json['totalItems'],
    itemCount: json['itemCount'],
    totalAmount: json['totalAmount'],
    approvedAmount: json['approvedAmount'],
    cancelledAmount: json['cancelledAmount'],
  );

  Map<String, dynamic> toJson() => {
    'currentPage': currentPage,
    'itemsPerPage': itemsPerPage,
    'totalPages': totalPages,
    'totalItems': totalItems,
    'itemCount': itemCount,
    'totalAmount': totalAmount,
    'approvedAmount': approvedAmount,
    'cancelledAmount': cancelledAmount,
  };
}









