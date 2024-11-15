

import 'dart:core';

class CustomerOrderProductRenewResponseModel {
  String? startDate;
  String? endDate;
  String? reminderBeforeExpire;
  OrderProduct? orderProduct;
  StartBy? startBy;
  Null remark;
  Null quitReason;
  Null quitDate;
  String? id;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  bool? isDisposed;

  CustomerOrderProductRenewResponseModel({this.startDate, this.endDate, this.reminderBeforeExpire, this.orderProduct, this.startBy, this.remark, this.quitReason, this.quitDate, this.id, this.status, this.createdAt, this.updatedAt, this.deletedAt, this.isDisposed});

  CustomerOrderProductRenewResponseModel.fromJson(Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    reminderBeforeExpire = json['reminder_before_expire'];
    orderProduct = json['order_product'] != null ? new OrderProduct.fromJson(json['order_product']) : null;
    startBy = json['start_by'] != null ? new StartBy.fromJson(json['start_by']) : null;
    remark = json['remark'];
    quitReason = json['quit_reason'];
    quitDate = json['quit_date'];
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isDisposed = json['isDisposed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['reminder_before_expire'] = this.reminderBeforeExpire;
    if (this.orderProduct != null) {
      data['order_product'] = this.orderProduct!.toJson();
    }
    if (this.startBy != null) {
      data['start_by'] = this.startBy!.toJson();
    }
    data['remark'] = this.remark;
    data['quit_reason'] = this.quitReason;
    data['quit_date'] = this.quitDate;
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['isDisposed'] = this.isDisposed;
    return data;
  }
}

class OrderProduct {
  String? id;
  String? productType;
  String? paymentMode;
  String? paymentType;
  int? mrp;
  int? salePrice;
  int? gst;
  int? gstPercentage;
  String? tdsOption;
  int? tds;
  int? tdsPercentage;
  Null gstInfo;
  int? total;
  int? quantity;
  int? duration;
  String? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Order? order;
  Product? product;

  OrderProduct({this.id, this.productType, this.paymentMode, this.paymentType, this.mrp, this.salePrice, this.gst, this.gstPercentage, this.tdsOption, this.tds, this.tdsPercentage, this.gstInfo, this.total, this.quantity, this.duration, this.status, this.createdAt, this.updatedAt, this.deletedAt, this.order, this.product});

  OrderProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['product_type'];
    paymentMode = json['payment_mode'];
    paymentType = json['payment_type'];
    mrp = json['mrp'];
    salePrice = json['sale_price'];
    gst = json['gst'];
    gstPercentage = json['gst_percentage'];
    tdsOption = json['tds_option'];
    tds = json['tds'];
    tdsPercentage = json['tds_percentage'];
    gstInfo = json['gst_info'];
    total = json['total'];
    quantity = json['quantity'];
    duration = json['duration'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_type'] = this.productType;
    data['payment_mode'] = this.paymentMode;
    data['payment_type'] = this.paymentType;
    data['mrp'] = this.mrp;
    data['sale_price'] = this.salePrice;
    data['gst'] = this.gst;
    data['gst_percentage'] = this.gstPercentage;
    data['tds_option'] = this.tdsOption;
    data['tds'] = this.tds;
    data['tds_percentage'] = this.tdsPercentage;
    data['gst_info'] = this.gstInfo;
    data['total'] = this.total;
    data['quantity'] = this.quantity;
    data['duration'] = this.duration;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Order {
  String? id;
  int? orderNumber;
  int? gstFees;
  int? tdsPercentage;
  int? amount;
  int? tdsAmount;
  int? totalAmount;
  int? payabaleAmount;
  String? performaInvoice;
  String? status;
  String? remark;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Null deleteRemark;
  Null zohoSalesorderId;
  Customer? customer;

  Order({this.id, this.orderNumber, this.gstFees, this.tdsPercentage, this.amount, this.tdsAmount, this.totalAmount, this.payabaleAmount, this.performaInvoice, this.status, this.remark, this.createdAt, this.updatedAt, this.deletedAt, this.deleteRemark, this.zohoSalesorderId, this.customer});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNumber = json['order_number'];
    gstFees = json['gst_fees'];
    tdsPercentage = json['tds_percentage'];
    amount = json['amount'];
    tdsAmount = json['tds_amount'];
    totalAmount = json['total_amount'];
    payabaleAmount = json['payabale_amount'];
    performaInvoice = json['performa_invoice'];
    status = json['status'];
    remark = json['remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deleteRemark = json['delete_remark'];
    zohoSalesorderId = json['zoho_salesorder_id'];
    customer = json['customer'] != null ? new Customer.fromJson(json['customer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_number'] = this.orderNumber;
    data['gst_fees'] = this.gstFees;
    data['tds_percentage'] = this.tdsPercentage;
    data['amount'] = this.amount;
    data['tds_amount'] = this.tdsAmount;
    data['total_amount'] = this.totalAmount;
    data['payabale_amount'] = this.payabaleAmount;
    data['performa_invoice'] = this.performaInvoice;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['delete_remark'] = this.deleteRemark;
    data['zoho_salesorder_id'] = this.zohoSalesorderId;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  int? countryCode;
  String? primaryContact;
  String? organization;
  List<Null>? websites;
  String? primaryAddress;
  Null profileImage;
  String? dob;
  String? gstin;
  String? aboutClient;
  String? otherInformation;
  int? lat;
  int? lng;
  Null joinedAt;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  Null deleteRemark;
  Null zohoContactId;
  String? status;
  Null subStatus;
  List<Null>? customerToCustomFields;

  Customer({this.id, this.firstName, this.lastName, this.primaryEmail, this.countryCode, this.primaryContact, this.organization, this.websites, this.primaryAddress, this.profileImage, this.dob, this.gstin, this.aboutClient, this.otherInformation, this.lat, this.lng, this.joinedAt, this.createdAt, this.updatedAt, this.deletedAt, this.deleteRemark, this.zohoContactId, this.status, this.subStatus, this.customerToCustomFields});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    primaryEmail = json['primary_email'];
    countryCode = json['country_code'];
    primaryContact = json['primary_contact'];
    organization = json['organization'];
    if (json['websites'] != null) {
      websites = <Null>[];
      json['websites'].forEach((v) { websites!.add((v)); });
    }
    primaryAddress = json['primary_address'];
    profileImage = json['profile_image'];
    dob = json['dob'];
    gstin = json['gstin'];
    aboutClient = json['about_client'];
    otherInformation = json['other_information'];
    lat = json['lat'];
    lng = json['lng'];
    joinedAt = json['joined_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    deleteRemark = json['delete_remark'];
    zohoContactId = json['zoho_contact_id'];
    status = json['status'];
    subStatus = json['subStatus'];
    if (json['customerToCustomFields'] != null) {
      customerToCustomFields = <Null>[];
      json['customerToCustomFields'].forEach((v) { customerToCustomFields!.add((v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['primary_email'] = this.primaryEmail;
    data['country_code'] = this.countryCode;
    data['primary_contact'] = this.primaryContact;
    data['organization'] = this.organization;
    if (this.websites != null) {
      data['websites'] = this.websites!.map((v) => v).toList();
    }
    data['primary_address'] = this.primaryAddress;
    data['profile_image'] = this.profileImage;
    data['dob'] = this.dob;
    data['gstin'] = this.gstin;
    data['about_client'] = this.aboutClient;
    data['other_information'] = this.otherInformation;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['joined_at'] = this.joinedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['delete_remark'] = this.deleteRemark;
    data['zoho_contact_id'] = this.zohoContactId;
    data['status'] = this.status;
    data['subStatus'] = this.subStatus;
    if (this.customerToCustomFields != null) {
      data['customerToCustomFields'] = this.customerToCustomFields!.map((v) =>()).toList();
    }
    return data;
  }
}

class Product {
  String? id;
  String? productType;
  Null serviceType;
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
  Null deletedAt;
  bool? distributorshipOnly;
  Null zohoItemId;
  bool? projectActivationDisabled;

  Product({this.id, this.productType, this.serviceType, this.name, this.description, this.mrp, this.salePrice, this.quantity, this.duration, this.downloadLink, this.packing, this.status, this.isTaxable, this.createdAt, this.updatedAt, this.deletedAt, this.distributorshipOnly, this.zohoItemId, this.projectActivationDisabled});

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

class StartBy {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? address;
  String? bio;
  String? profilePic;
  String? password;
  bool? status;
  String? rememberToken;
  String? rememberTokenTime;
  bool? isDefault; // Changed `default` to `isDefault` to avoid using a reserved keyword
  String? createdAt;
  String? updatedAt;
  String? deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool superSettings;
  String? parent;
  List<RoleList>? roleList;
  String? department;
  String? mailjetSender;
  String? smtpSender;

  // Constructor with default values for non-nullable fields
  StartBy({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobile,
    this.address,
    this.bio,
    this.profilePic,
    this.password,
    this.status,
    this.rememberToken,
    this.rememberTokenTime,
    this.isDefault, // Updated variable name
    this.createdAt,
    this.updatedAt,
    this.deviceId,
    this.tracking,
    this.crmCategory,
    this.mobileApp,
    this.superSettings = false, // Default value for non-nullable field
    this.parent,
    this.roleList,
    this.department,
    this.mailjetSender,
    this.smtpSender,
  });

  // Named constructor for JSON deserialization
  StartBy.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        firstName = json['first_name'],
        lastName = json['last_name'],
        email = json['email'],
        mobile = json['mobile'],
        address = json['address'],
        bio = json['bio'],
        profilePic = json['profile_pic'],
        password = json['password'],
        status = json['status'],
        rememberToken = json['remember_token'],
        rememberTokenTime = json['remember_token_time'],
        isDefault = json['default'], // Updated variable name in JSON
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        deviceId = json['device_id'],
        tracking = json['tracking'],
        crmCategory = json['crm_category'],
        mobileApp = json['mobile_app'],
        superSettings = json['superSettings'] ?? false, // Default to false if null
        parent = json['parent'],
        roleList = (json['role_list'] as List?)
            ?.map((v) => RoleList.fromJson(v))
            .toList(),
        department = json['department'],
        mailjetSender = json['mailjetSender'],
        smtpSender = json['smtpSender'];

  // Method to serialize data to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['bio'] = bio;
    data['profile_pic'] = profilePic;
    data['password'] = password;
    data['status'] = status;
    data['remember_token'] = rememberToken;
    data['remember_token_time'] = rememberTokenTime;
    data['default'] = isDefault; // Match JSON field with updated variable name
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['device_id'] = deviceId;
    data['tracking'] = tracking;
    data['crm_category'] = crmCategory;
    data['mobile_app'] = mobileApp;
    data['superSettings'] = superSettings;
    data['parent'] = parent;
    if (roleList != null) {
      data['role_list'] = roleList!.map((v) => v.toJson()).toList();
    }
    data['department'] = department;
    data['mailjetSender'] = mailjetSender;
    data['smtpSender'] = smtpSender;
    return data;
  }
}


class RoleList {
String? id;
String? name;
String? description;
RoleList({this.id, this.name, this.description,});
RoleList.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
description = json['description'];
}
Map<String, dynamic> toJson() {
final Map<String, dynamic> data = Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['description'] = this.description;
return data;
}
}