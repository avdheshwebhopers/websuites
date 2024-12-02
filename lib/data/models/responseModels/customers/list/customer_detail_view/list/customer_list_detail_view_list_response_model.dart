class CustomerListDetailViewListResponseModel {
  String? serviceStatus;
  bool? projectStatus;
  String? id;
  String? firstName;
  String? lastName;
  String? primaryEmail;
  int? countryCode;
  String? primaryContact;
  String? organization;
  List<Null>? websites;
  String? primaryAddress;
  Null? profileImage;
  Null? dob;
  String? gstin;
  String? aboutClient;
  String? otherInformation;
  int? lat;
  int? lng;
  Null? joinedAt;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? deleteRemark;
  Null? zohoContactId;
  String? status;
  Null? subStatus;
  List<CustomerAssigned>? customerAssigned;
  Null? customerType;
  Contact? contact;
  Pincode? pincode;
  District? district;
  District? city;
  District? state;
  District? country;
  List<CustomerToCustomFields>? customerToCustomFields;
  District? source;
  List<Division>? divisions;
  List<Null>? secondaryEmails;
  List<SecondaryMobiles>? secondaryMobiles;
  List<Companies>? companies;
  List<Null>? projects;
  List<Orders>? orders;
  int? customerCredits;

  CustomerListDetailViewListResponseModel({this.serviceStatus, this.projectStatus, this.id, this.firstName, this.lastName, this.primaryEmail, this.countryCode, this.primaryContact, this.organization, this.websites, this.primaryAddress, this.profileImage, this.dob, this.gstin, this.aboutClient, this.otherInformation, this.lat, this.lng, this.joinedAt, this.createdAt, this.updatedAt, this.deletedAt, this.deleteRemark, this.zohoContactId, this.status, this.subStatus, this.customerAssigned, this.customerType, this.contact, this.pincode, this.district, this.city, this.state, this.country, this.customerToCustomFields, this.source, this.divisions, this.secondaryEmails, this.secondaryMobiles, this.companies, this.projects, this.orders, this.customerCredits});

  CustomerListDetailViewListResponseModel.fromJson(Map<String, dynamic> json) {
    serviceStatus = json['serviceStatus'];
    projectStatus = json['projectStatus'];
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
    if (json['customer_assigned'] != null) {
      customerAssigned = <CustomerAssigned>[];
      json['customer_assigned'].forEach((v) { customerAssigned!.add(new CustomerAssigned.fromJson(v)); });
    }
    customerType = json['customer_type'];
    contact = json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    pincode = json['pincode'] != null ? new Pincode.fromJson(json['pincode']) : null;
    district = json['district'] != null ? new District.fromJson(json['district']) : null;
    city = json['city'] != null ? new District.fromJson(json['city']) : null;
    state = json['state'] != null ? new District.fromJson(json['state']) : null;
    country = json['country'] != null ? new District.fromJson(json['country']) : null;
    if (json['customerToCustomFields'] != null) {
      customerToCustomFields = <CustomerToCustomFields>[];
      json['customerToCustomFields'].forEach((v) { customerToCustomFields!.add(new CustomerToCustomFields.fromJson(v)); });
    }
    source = json['source'] != null ? new District.fromJson(json['source']) : null;
    if (json['divisions'] != null) {
      divisions = <Division>[];
      json['divisions'].forEach((v) { divisions!.add(new Division.fromJson(v)); });
    }
    if (json['secondary_emails'] != null) {
      secondaryEmails = <Null>[];
      json['secondary_emails'].forEach((v) { secondaryEmails!.add((v)); });
    }
    if (json['secondary_mobiles'] != null) {
      secondaryMobiles = <SecondaryMobiles>[];
      json['secondary_mobiles'].forEach((v) { secondaryMobiles!.add(new SecondaryMobiles.fromJson(v)); });
    }
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) { companies!.add(new Companies.fromJson(v)); });
    }
    if (json['projects'] != null) {
      projects = <Null>[];
      json['projects'].forEach((v) { projects!.add((v)); });
    }
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) { orders!.add(new Orders.fromJson(v)); });
    }
    customerCredits = json['customerCredits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceStatus'] = this.serviceStatus;
    data['projectStatus'] = this.projectStatus;
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['primary_email'] = this.primaryEmail;
    data['country_code'] = this.countryCode;
    data['primary_contact'] = this.primaryContact;
    data['organization'] = this.organization;
    if (this.websites != null) {
      data['websites'] = this.websites!.map((v) =>()).toList();
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
    if (this.customerAssigned != null) {
      data['customer_assigned'] = this.customerAssigned!.map((v) => v.toJson()).toList();
    }
    data['customer_type'] = this.customerType;
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.pincode != null) {
      data['pincode'] = this.pincode!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.customerToCustomFields != null) {
      data['customerToCustomFields'] = this.customerToCustomFields!.map((v) => v.toJson()).toList();
    }
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.divisions != null) {
      data['divisions'] = this.divisions!.map((v) => ()).toList();
    }
    if (this.secondaryEmails != null) {
      data['secondary_emails'] = this.secondaryEmails!.map((v) => ()).toList();
    }
    if (this.secondaryMobiles != null) {
      data['secondary_mobiles'] = this.secondaryMobiles!.map((v) => v.toJson()).toList();
    }
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => ()).toList();
    }
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['customerCredits'] = this.customerCredits;
    return data;
  }
}





class Division {
  final String id;
  final String name;

  Division({required this.id, required this.name});

  factory Division.fromJson(Map<String, dynamic> json) {
    return Division(
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}







class CustomerAssigned {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  CustomerAssigned({this.id, this.status, this.createdAt, this.updatedAt, this.user});

  CustomerAssigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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
  Null? rememberToken;
  Null? rememberTokenTime;
  bool? defaultAt;
  String? createdAt;
  String? updatedAt;
  String? deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;

  User({this.id, this.firstName, this.lastName, this.email, this.mobile, this.address, this.bio, this.profilePic, this.password, this.status, this.rememberToken, this.rememberTokenTime, this.defaultAt, this.createdAt, this.updatedAt, this.deviceId, this.tracking, this.crmCategory, this.mobileApp, this.superSettings});

User.fromJson(Map<String, dynamic> json) {
id = json['id'];
firstName = json['first_name'];
lastName = json['last_name'];
email = json['email'];
mobile = json['mobile'];
address = json['address'];
bio = json['bio'];
profilePic = json['profile_pic'];
password = json['password'];
status = json['status'];
rememberToken = json['remember_token'];
rememberTokenTime = json['remember_token_time'];
defaultAt = json['default'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
deviceId = json['device_id'];
tracking = json['tracking'];
crmCategory = json['crm_category'];
mobileApp = json['mobile_app'];
superSettings = json['superSettings'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['first_name'] = this.firstName;
data['last_name'] = this.lastName;
data['email'] = this.email;
data['mobile'] = this.mobile;
data['address'] = this.address;
data['bio'] = this.bio;
data['profile_pic'] = this.profilePic;
data['password'] = this.password;
data['status'] = this.status;
data['remember_token'] = this.rememberToken;
data['remember_token_time'] = this.rememberTokenTime;
data['default'] = this.defaultAt;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
data['device_id'] = this.deviceId;
data['tracking'] = this.tracking;
data['crm_category'] = this.crmCategory;
data['mobile_app'] = this.mobileApp;
data['superSettings'] = this.superSettings;
return data;
}
}

class Contact {
String? id;
String? type;
String? name;
String? email;
String? mobile;

Contact({this.id, this.type, this.name, this.email, this.mobile});

Contact.fromJson(Map<String, dynamic> json) {
id = json['id'];
type = json['type'];
name = json['name'];
email = json['email'];
mobile = json['mobile'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['type'] = this.type;
data['name'] = this.name;
data['email'] = this.email;
data['mobile'] = this.mobile;
return data;
}
}

class Pincode {
String? id;
String? code;

Pincode({this.id, this.code});

Pincode.fromJson(Map<String, dynamic> json) {
id = json['id'];
code = json['code'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['code'] = this.code;
return data;
}
}

class District {
String? id;
String? name;

District({this.id, this.name});

District.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
return data;
}
}

class CustomerToCustomFields {
String? id;
String? customerId;
String? customId;
String? fieldName;
String? value;
String? createdAt;
String? updatedAt;
Customfields? customfields;

CustomerToCustomFields({this.id, this.customerId, this.customId, this.fieldName, this.value, this.createdAt, this.updatedAt, this.customfields});

CustomerToCustomFields.fromJson(Map<String, dynamic> json) {
id = json['id'];
customerId = json['customer_id'];
customId = json['custom_id'];
fieldName = json['field_name'];
value = json['value'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
customfields = json['customfields'] != null ? new Customfields.fromJson(json['customfields']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['customer_id'] = this.customerId;
data['custom_id'] = this.customId;
data['field_name'] = this.fieldName;
data['value'] = this.value;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
if (this.customfields != null) {
data['customfields'] = this.customfields!.toJson();
}
return data;
}
}

class Customfields {
String? id;
String? fieldFor;
String? fieldLabel;
String? fieldName;
String? type;
String? description;
String? answers;
String? pattern;
int? maxValue;
bool? required;
bool? requiredForCustomer;
String? defaultValue;
bool? multiple;
String? createdAt;
String? updatedAt;

Customfields({this.id, this.fieldFor, this.fieldLabel, this.fieldName, this.type, this.description, this.answers, this.pattern, this.maxValue, this.required, this.requiredForCustomer, this.defaultValue, this.multiple, this.createdAt, this.updatedAt});

Customfields.fromJson(Map<String, dynamic> json) {
id = json['id'];
fieldFor = json['field_for'];
fieldLabel = json['field_label'];
fieldName = json['field_name'];
type = json['type'];
description = json['description'];
answers = json['answers'];
pattern = json['pattern'];
maxValue = json['max_value'];
required = json['required'];
requiredForCustomer = json['required_for_customer'];
defaultValue = json['default_value'];
multiple = json['multiple'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['field_for'] = this.fieldFor;
data['field_label'] = this.fieldLabel;
data['field_name'] = this.fieldName;
data['type'] = this.type;
data['description'] = this.description;
data['answers'] = this.answers;
data['pattern'] = this.pattern;
data['max_value'] = this.maxValue;
data['required'] = this.required;
data['required_for_customer'] = this.requiredForCustomer;
data['default_value'] = this.defaultValue;
data['multiple'] = this.multiple;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class SecondaryMobiles {
String? id;
String? mobile;
String? countryCode;
String? mobileWithCountrycode;
String? createdAt;
String? updatedAt;

SecondaryMobiles({this.id, this.mobile, this.countryCode, this.mobileWithCountrycode, this.createdAt, this.updatedAt});

SecondaryMobiles.fromJson(Map<String, dynamic> json) {
id = json['id'];
mobile = json['mobile'];
countryCode = json['country_code'];
mobileWithCountrycode = json['mobile_with_countrycode'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['mobile'] = this.mobile;
data['country_code'] = this.countryCode;
data['mobile_with_countrycode'] = this.mobileWithCountrycode;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}

class Companies {
String? id;
String? companyName;
String? companyEmail;
String? companyPhone;
int? countryCode;
String? contactPersonName;
String? contactPersonNumber;
int? cCountryCode;
String? address;
Null? website;
Null? gst;
Null? logo;
int? lat;
int? lng;

Companies({this.id, this.companyName, this.companyEmail, this.companyPhone, this.countryCode, this.contactPersonName, this.contactPersonNumber, this.cCountryCode, this.address, this.website, this.gst, this.logo, this.lat, this.lng});

Companies.fromJson(Map<String, dynamic> json) {
id = json['id'];
companyName = json['company_name'];
companyEmail = json['company_email'];
companyPhone = json['company_phone'];
countryCode = json['country_code'];
contactPersonName = json['contact_person_name'];
contactPersonNumber = json['contact_person_number'];
cCountryCode = json['c_country_code'];
address = json['address'];
website = json['website'];
gst = json['gst'];
logo = json['logo'];
lat = json['lat'];
lng = json['lng'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['company_name'] = this.companyName;
data['company_email'] = this.companyEmail;
data['company_phone'] = this.companyPhone;
data['country_code'] = this.countryCode;
data['contact_person_name'] = this.contactPersonName;
data['contact_person_number'] = this.contactPersonNumber;
data['c_country_code'] = this.cCountryCode;
data['address'] = this.address;
data['website'] = this.website;
data['gst'] = this.gst;
data['logo'] = this.logo;
data['lat'] = this.lat;
data['lng'] = this.lng;
return data;
}
}

class Orders {
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
Null? deletedAt;
Null? deleteRemark;
Null? zohoSalesorderId;
List<OrderProducts>? orderProducts;

Orders({this.id, this.orderNumber, this.gstFees, this.tdsPercentage, this.amount, this.tdsAmount, this.totalAmount, this.payabaleAmount, this.performaInvoice, this.status, this.remark, this.createdAt, this.updatedAt, this.deletedAt, this.deleteRemark, this.zohoSalesorderId, this.orderProducts});

Orders.fromJson(Map<String, dynamic> json) {
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
if (json['order_products'] != null) {
orderProducts = <OrderProducts>[];
json['order_products'].forEach((v) { orderProducts!.add(new OrderProducts.fromJson(v)); });
}
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
if (this.orderProducts != null) {
data['order_products'] = this.orderProducts!.map((v) => v.toJson()).toList();
}
return data;
}
}

class OrderProducts {
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
String? gstInfo;
int? total;
int? quantity;
int? duration;
String? status;
String? createdAt;
String? updatedAt;
Null? deletedAt;
List<Services>? services;

OrderProducts({this.id, this.productType, this.paymentMode, this.paymentType, this.mrp, this.salePrice, this.gst, this.gstPercentage, this.tdsOption, this.tds, this.tdsPercentage, this.gstInfo, this.total, this.quantity, this.duration, this.status, this.createdAt, this.updatedAt, this.deletedAt, this.services});

OrderProducts.fromJson(Map<String, dynamic> json) {
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
if (json['services'] != null) {
services = <Services>[];
json['services'].forEach((v) { services!.add(new Services.fromJson(v)); });
}
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
if (this.services != null) {
data['services'] = this.services!.map((v) => v.toJson()).toList();
}
return data;
}
}

class Services {
String? id;
String? startDate;
String? endDate;
Null? remark;
String? reminderBeforeExpire;
bool? status;
Null? quitReason;
Null? quitDate;
String? createdAt;
String? updatedAt;
Null? deletedAt;
bool? isDisposed;

Services({this.id, this.startDate, this.endDate, this.remark, this.reminderBeforeExpire, this.status, this.quitReason, this.quitDate, this.createdAt, this.updatedAt, this.deletedAt, this.isDisposed});

Services.fromJson(Map<String, dynamic> json) {
id = json['id'];
startDate = json['start_date'];
endDate = json['end_date'];
remark = json['remark'];
reminderBeforeExpire = json['reminder_before_expire'];
status = json['status'];
quitReason = json['quit_reason'];
quitDate = json['quit_date'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
deletedAt = json['deleted_at'];
isDisposed = json['isDisposed'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['start_date'] = this.startDate;
data['end_date'] = this.endDate;
data['remark'] = this.remark;
data['reminder_before_expire'] = this.reminderBeforeExpire;
data['status'] = this.status;
data['quit_reason'] = this.quitReason;
data['quit_date'] = this.quitDate;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
data['deleted_at'] = this.deletedAt;
data['isDisposed'] = this.isDisposed;
return data;
}
}

