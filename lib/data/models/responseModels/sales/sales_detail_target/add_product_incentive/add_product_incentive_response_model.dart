class AddProductIncentiveResponseModel {
  String? incentiveType;
  int? minimumSalePrice;
  int? incentive;
  bool? isSale;
  TaregtIncentive? taregtIncentive;
  Product? product;
  String? id;
  String? createdAt;
  String? updatedAt;

  AddProductIncentiveResponseModel({this.incentiveType, this.minimumSalePrice, this.incentive, this.isSale, this.taregtIncentive, this.product, this.id, this.createdAt, this.updatedAt});

  AddProductIncentiveResponseModel.fromJson(Map<String, dynamic> json) {
    incentiveType = json['incentive_type'];
    minimumSalePrice = json['minimum_sale_price'];
    incentive = json['incentive'];
    isSale = json['is_sale'];
    taregtIncentive = json['taregt_incentive'] != null ? new TaregtIncentive.fromJson(json['taregt_incentive']) : null;
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['incentive_type'] = this.incentiveType;
    data['minimum_sale_price'] = this.minimumSalePrice;
    data['incentive'] = this.incentive;
    data['is_sale'] = this.isSale;
    if (this.taregtIncentive != null) {
      data['taregt_incentive'] = this.taregtIncentive!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TaregtIncentive {
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  int? saleTarget;
  Team? team;
  String? createdAt;
  String? updatedAt;

  TaregtIncentive({this.id, this.name, this.startDate, this.endDate, this.saleTarget, this.team, this.createdAt, this.updatedAt});

  TaregtIncentive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    saleTarget = json['sale_target'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['sale_target'] = this.saleTarget;
    if (this.team != null) {
      data['team'] = this.team!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Team {
  String? id;
  dynamic bio;
  String? email;
  String? mobile;
  dynamic status;
  dynamic address;
  bool? defaultAt;
  List<Null>? children;
  String? password;
  dynamic tracking;
  String? deviceId;
  String? lastName;
  List<RoleList>? roleList;
  dynamic smsSender;
  String? createdAt;
  String? firstName;
  dynamic mobileApp;
  dynamic smtpSender;
  String? updatedAt;
  dynamic profilePic;
  String? crmCategory;
  dynamic mailjetSender;
  bool? superSettings;
  String? rememberToken;
  String? rememberTokenTime;

  Team({this.id, this.bio, this.email, this.mobile, this.status, this.address, this.defaultAt, this.children, this.password, this.tracking, this.deviceId, this.lastName, this.roleList, this.smsSender, this.createdAt, this.firstName, this.mobileApp, this.smtpSender, this.updatedAt, this.profilePic, this.crmCategory, this.mailjetSender, this.superSettings, this.rememberToken, this.rememberTokenTime});

Team.fromJson(Map<String, dynamic> json) {
id = json['id'];
bio = json['bio'];
email = json['email'];
mobile = json['mobile'];
status = json['status'];
address = json['address'];
defaultAt = json['default'];
if (json['children'] != null) {
children = <Null>[];
json['children'].forEach((v) { children!.add((v)); });
}
password = json['password'];
tracking = json['tracking'];
deviceId = json['device_id'];
lastName = json['last_name'];
if (json['role_list'] != null) {
roleList = <RoleList>[];
json['role_list'].forEach((v) { roleList!.add(new RoleList.fromJson(v)); });
}
smsSender = json['smsSender'];
createdAt = json['created_at'];
firstName = json['first_name'];
mobileApp = json['mobile_app'];
smtpSender = json['smtpSender'];
updatedAt = json['updated_at'];
profilePic = json['profile_pic'];
crmCategory = json['crm_category'];
mailjetSender = json['mailjetSender'];
superSettings = json['superSettings'];
rememberToken = json['remember_token'];
rememberTokenTime = json['remember_token_time'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['bio'] = this.bio;
data['email'] = this.email;
data['mobile'] = this.mobile;
data['status'] = this.status;
data['address'] = this.address;
data['default'] = this.defaultAt;
if (this.children != null) {
data['children'] = this.children!.map((v) => ()).toList();
}
data['password'] = this.password;
data['tracking'] = this.tracking;
data['device_id'] = this.deviceId;
data['last_name'] = this.lastName;
if (this.roleList != null) {
data['role_list'] = this.roleList!.map((v) => v.toJson()).toList();
}
data['smsSender'] = this.smsSender;
data['created_at'] = this.createdAt;
data['first_name'] = this.firstName;
data['mobile_app'] = this.mobileApp;
data['smtpSender'] = this.smtpSender;
data['updated_at'] = this.updatedAt;
data['profile_pic'] = this.profilePic;
data['crm_category'] = this.crmCategory;
data['mailjetSender'] = this.mailjetSender;
data['superSettings'] = this.superSettings;
data['remember_token'] = this.rememberToken;
data['remember_token_time'] = this.rememberTokenTime;
return data;
}
}

class RoleList {
String? id;
String? name;
bool? defaultAt;
String? description;

RoleList({this.id, this.name, this.defaultAt, this.description});

RoleList.fromJson(Map<String, dynamic> json) {
id = json['id'];
name = json['name'];
defaultAt = json['default'];
description = json['description'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['default'] = this.defaultAt;
data['description'] = this.description;
return data;
}
}

class Product {
String? id;
String? productType;
dynamic serviceType;
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
dynamic deletedAt;
bool? distributorshipOnly;
dynamic zohoItemId;
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