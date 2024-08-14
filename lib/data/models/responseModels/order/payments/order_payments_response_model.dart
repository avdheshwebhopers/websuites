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
  double? amount;
  int? gst_and_fees;
  String? payment_mode;
  String? payment_type;
  String? txn_id;
  int? cheque_number;
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
  String? status_action_by;

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
  int? order_number;
  int? gst_fees;
  int? tds_percentage;
  int? amount;
  int? tds_amount;
  int? total_amount;
  int? payabale_amount;
  String? performa_invoice;
  String? status;
  String? remark;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? delete_remark;
  String? zoho_sales_order_id;
  Customer? customer;
  Company? company;

  Order(
      {this.id,
      this.order_number,
      this.gst_fees,
      this.tds_percentage,
      this.amount,
      this.tds_amount,
      this.total_amount,
      this.payabale_amount,
      this.performa_invoice,
      this.status,
      this.remark,
      this.created_at,
      this.updated_at,
      this.deleted_at,
      this.delete_remark,
      this.zoho_sales_order_id,
      this.customer,
      this.company});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order_number = json['order_number'];
    gst_fees = json['gst_fees'];
    tds_percentage = json['tds_percentage'];
    amount = json['amount'];
    tds_amount = json['tds_amount'];
    total_amount = json['total_amount'];
    payabale_amount = json['payabale_amount'];
    performa_invoice = json['performa_invoice'];
    status = json['status'];
    remark = json['remark'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    delete_remark = json['delete_remark'];
    zoho_sales_order_id = json['zoho_salesorder_id'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_number'] = order_number;
    data['gst_fees'] = gst_fees;
    data['tds_percentage'] = tds_percentage;
    data['amount'] = amount;
    data['tds_amount'] = tds_amount;
    data['total_amount'] = total_amount;
    data['payabale_amount'] = payabale_amount;
    data['performa_invoice'] = performa_invoice;
    data['status'] = status;
    data['remark'] = remark;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['delete_remark'] = delete_remark;
    data['zoho_salesorder_id'] = zoho_sales_order_id;
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
  String? company_name;
  String? first_name;
  String? last_name;
  String? primary_email;
  int? country_code;
  String? primary_contact;
  String? organization;
  String? primary_address;
  String? profile_image;
  String? dob;
  String? about_client;
  String? other_information;
  double? lat;
  double? lng;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? delete_remark;
  String? zoho_contact_id;
  String? status;
  String? sub_status;
  List<Divisions>? divisions;

  Customer(
      {this.id,
      this.company_name,
      this.first_name,
      this.last_name,
      this.primary_email,
      this.country_code,
      this.primary_contact,
      this.organization,
      this.primary_address,
      this.profile_image,
      this.dob,
      this.about_client,
      this.other_information,
      this.lat,
      this.lng,
      this.created_at,
      this.updated_at,
      this.deleted_at,
      this.delete_remark,
      this.zoho_contact_id,
      this.status,
      this.sub_status,
      this.divisions});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    primary_email = json['primary_email'];
    country_code = json['country_code'];
    primary_contact = json['primary_contact'];
    organization = json['organization'];
    primary_address = json['primary_address'];
    profile_image = json['profile_image'];
    dob = json['dob'];
    about_client = json['about_client'];
    other_information = json['other_information'];
    lat = json['lat'];
    lng = json['lng'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    delete_remark = json['delete_remark'];
    zoho_contact_id = json['zoho_contact_id'];
    status = json['status'];
    sub_status = json['subStatus'];
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add(Divisions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['primary_email'] = primary_email;
    data['country_code'] = country_code;
    data['primary_contact'] = primary_contact;
    data['organization'] = organization;
    data['primary_address'] = primary_address;
    data['profile_image'] = profile_image;
    data['dob'] = dob;
    data['about_client'] = about_client;
    data['other_information'] = other_information;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['delete_remark'] = delete_remark;
    data['zoho_contact_id'] = zoho_contact_id;
    data['status'] = status;
    data['subStatus'] = sub_status;
    if (divisions != null) {
      data['divisions'] = divisions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Divisions {
  String? id;
  String? name;
  String? status;
  String? mobile_no;
  String? contact_person;
  String? email;
  String? address;
  String? logo;
  String? created_at;
  String? updatedAt;
  String? zohoOrganizationId;
  String? zohoTaxExemptionId;

  Divisions(
      {this.id,
      this.name,
      this.status,
      this.mobile_no,
      this.contact_person,
      this.email,
      this.address,
      this.logo,
      this.created_at,
      this.updatedAt,
      this.zohoOrganizationId,
      this.zohoTaxExemptionId});

  Divisions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    mobile_no = json['mobile_no'];
    contact_person = json['contact_person'];
    email = json['email'];
    address = json['address'];
    logo = json['logo'];
    created_at = json['created_at'];
    updatedAt = json['updated_at'];
    zohoOrganizationId = json['zoho_organization_id'];
    zohoTaxExemptionId = json['zoho_tax_exemption_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['mobile_no'] = mobile_no;
    data['contact_person'] = contact_person;
    data['email'] = email;
    data['address'] = address;
    data['logo'] = logo;
    data['created_at'] = created_at;
    data['updated_at'] = updatedAt;
    data['zoho_organization_id'] = zohoOrganizationId;
    data['zoho_tax_exemption_id'] = zohoTaxExemptionId;
    return data;
  }
}

class Company {
  String? id;
  String? company_name;
  String? company_email;
  String? company_phone;
  int? country_code;
  String? contact_person_name;
  String? contact_person_number;
  int? c_country_code;
  String? address;
  String? website;
  String? gst;
  String? logo;
  int? lat;
  int? lng;

  Company(
      {this.id,
      this.company_name,
      this.company_email,
      this.company_phone,
      this.country_code,
      this.contact_person_name,
      this.contact_person_number,
      this.c_country_code,
      this.address,
      this.website,
      this.gst,
      this.logo,
      this.lat,
      this.lng});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    company_email = json['company_email'];
    company_phone = json['company_phone'];
    country_code = json['country_code'];
    contact_person_name = json['contact_person_name'];
    contact_person_number = json['contact_person_number'];
    c_country_code = json['c_country_code'];
    address = json['address'];
    website = json['website'];
    gst = json['gst'];
    logo = json['logo'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    data['company_email'] = company_email;
    data['company_phone'] = company_phone;
    data['country_code'] = country_code;
    data['contact_person_name'] = contact_person_name;
    data['contact_person_number'] = contact_person_number;
    data['c_country_code'] = c_country_code;
    data['address'] = address;
    data['website'] = website;
    data['gst'] = gst;
    data['logo'] = logo;
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Product {
  String? id;
  String? product_type;
  String? name;
  String? description;
  int? mrp;
  int? sale_price;
  int? quantity;
  int? duration;
  String? download_link;
  String? packing;
  bool? status;
  bool? is_taxable;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? zoho_item_id;
  bool? project_activation_disabled;

  Product(
      {this.id,
      this.product_type,
      this.name,
      this.description,
      this.mrp,
      this.sale_price,
      this.quantity,
      this.duration,
      this.download_link,
      this.packing,
      this.status,
      this.is_taxable,
      this.created_at,
      this.updated_at,
      this.deleted_at,
      this.zoho_item_id,
      this.project_activation_disabled});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product_type = json['product_type'];
    name = json['name'];
    description = json['description'];
    mrp = json['mrp'];
    sale_price = json['sale_price'];
    quantity = json['quantity'];
    duration = json['duration'];
    download_link = json['download_link'];
    packing = json['packing'];
    status = json['status'];
    is_taxable = json['is_taxable'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
    zoho_item_id = json['zoho_item_id'];
    project_activation_disabled = json['project_activation_disabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_type'] = product_type;
    data['name'] = name;
    data['description'] = description;
    data['mrp'] = mrp;
    data['sale_price'] = sale_price;
    data['quantity'] = quantity;
    data['duration'] = duration;
    data['download_link'] = download_link;
    data['packing'] = packing;
    data['status'] = status;
    data['is_taxable'] = is_taxable;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['zoho_item_id'] = zoho_item_id;
    data['project_activation_disabled'] = project_activation_disabled;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;
  double? totalAmount;
  String? approvedAmount;
  String? cancelledAmount;

  Meta(
      {this.currentPage,
      this.itemsPerPage,
      this.totalPages,
      this.totalItems,
      this.itemCount,
      this.totalAmount,
      this.approvedAmount,
      this.cancelledAmount});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
    totalAmount = json['totalAmount'];
    approvedAmount = json['approvedAmount'];
    cancelledAmount = json['cancelledAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    data['totalAmount'] = totalAmount;
    data['approvedAmount'] = approvedAmount;
    data['cancelledAmount'] = cancelledAmount;
    return data;
  }
}
