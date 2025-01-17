
//"LIve URl ke According Response model"



class TargetDetailResponseModel {
  TargetIncentive? targetIncentive;

  TargetDetailResponseModel({this.targetIncentive});

  TargetDetailResponseModel.fromJson(Map<String, dynamic> json) {
    targetIncentive = json['targetIncentive'] != null ? new TargetIncentive.fromJson(json['targetIncentive']) : null;
  }
  //
  //
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.targetIncentive != null) {
      data['targetIncentive'] = this.targetIncentive!.toJson();
    }
    return data;
  }
}

class TargetIncentive {
  String? id;
  String? name;
  String? startDate;
  String? endDate;
  int? saleTarget;
  Team? team;
  String? createdAt;
  String? updatedAt;
  TeamHead? teamHead;
  List<Product>? product;
  List<MinimumProduct>? minimumProduct;

  TargetIncentive({this.id, this.name, this.startDate, this.endDate, this.saleTarget, this.team, this.createdAt, this.updatedAt, this.teamHead, this.product, this.minimumProduct});

  TargetIncentive.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    saleTarget = json['sale_target'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamHead = json['team_head'] != null ? new TeamHead.fromJson(json['team_head']) : null;
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) { product!.add(new Product.fromJson(v)); });
    }
    if (json['minimum_product'] != null) {
      minimumProduct = <MinimumProduct>[];
      json['minimum_product'].forEach((v) { minimumProduct!.add(new MinimumProduct.fromJson(v)); });
    }
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
    if (this.teamHead != null) {
      data['team_head'] = this.teamHead!.toJson();
    }
    if (this.product != null) {
      data['product'] = this.product!.map((v) => v.toJson()).toList();
    }
    if (this.minimumProduct != null) {
      data['minimum_product'] = this.minimumProduct!.map((v) =>()).toList();
    }
    return data;
  }
}

class Team {
  String? id;
  String? bio;
  String? email;
  String? mobile;
  String? address;
  bool? defaultAt;
  List<dynamic>? children;
  String? password;
  String? lastName;
  List<RoleList>? roleList;
  String? createdAt;
  String? firstName;
  String? updatedAt;
  dynamic profilePic;
  dynamic rememberToken;
  dynamic rememberTokenTime;

  Team({this.id, this.bio, this.email, this.mobile, this.address, this.defaultAt, this.children, this.password, this.lastName, this.roleList, this.createdAt, this.firstName, this.updatedAt, this.profilePic, this.rememberToken, this.rememberTokenTime});

Team.fromJson(Map<String, dynamic> json) {
id = json['id'];
bio = json['bio'];
email = json['email'];
mobile = json['mobile'];
address = json['address'];
defaultAt = json['default'];
if (json['children'] != null) {
children = <Null>[];
json['children'].forEach((v) { children!.add((v)); });
}
password = json['password'];
lastName = json['last_name'];
if (json['role_list'] != null) {
roleList = <RoleList>[];
json['role_list'].forEach((v) { roleList!.add(new RoleList.fromJson(v)); });
}
createdAt = json['created_at'];
firstName = json['first_name'];
updatedAt = json['updated_at'];
profilePic = json['profile_pic'];
rememberToken = json['remember_token'];
rememberTokenTime = json['remember_token_time'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['bio'] = this.bio;
data['email'] = this.email;
data['mobile'] = this.mobile;
data['address'] = this.address;
data['default'] = this.defaultAt;
if (this.children != null) {
data['children'] = this.children!.map((v) => ()).toList();
}
data['password'] = this.password;
data['last_name'] = this.lastName;
if (this.roleList != null) {
data['role_list'] = this.roleList!.map((v) => v.toJson()).toList();
}
data['created_at'] = this.createdAt;
data['first_name'] = this.firstName;
data['updated_at'] = this.updatedAt;
data['profile_pic'] = this.profilePic;
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

class TeamHead {
String? id;
String? email;
String? mobile;
List<Null>? children;
String? lastName;
String? firstName;
Key? key;

TeamHead({this.id, this.email, this.mobile, this.children, this.lastName, this.firstName, this.key});

TeamHead.fromJson(Map<String, dynamic> json) {
id = json['id'];
email = json['email'];
mobile = json['mobile'];
if (json['children'] != null) {
children = <Null>[];
json['children'].forEach((v) { children!.add((v)); });
}
lastName = json['last_name'];
firstName = json['first_name'];
key = json['key'] != null ? new Key.fromJson(json['key']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['email'] = this.email;
data['mobile'] = this.mobile;
if (this.children != null) {
data['children'] = this.children!.map((v) => ()).toList();
}
data['last_name'] = this.lastName;
data['first_name'] = this.firstName;
if (this.key != null) {
data['key'] = this.key!.toJson();
}
return data;
}
}

class Key {
String? id;
int? saleTarget;
String? createdAt;
String? updatedAt;
List<AchieveBreakdown>? achieveBreakdown;

Key({this.id, this.saleTarget, this.createdAt, this.updatedAt, this.achieveBreakdown});

Key.fromJson(Map<String, dynamic> json) {
id = json['id'];
saleTarget = json['sale_target'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
if (json['achieve_breakdown'] != null) {
achieveBreakdown = <AchieveBreakdown>[];
json['achieve_breakdown'].forEach((v) { achieveBreakdown!.add(new AchieveBreakdown.fromJson(v)); });
}
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['sale_target'] = this.saleTarget;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
if (this.achieveBreakdown != null) {
data['achieve_breakdown'] = this.achieveBreakdown!.map((v) => v.toJson()).toList();
}
return data;
}
}

class AchieveBreakdown {
String? id;
int? achievePercentage;
int? incentive;
String? incentiveType;
String? createdAt;
String? updatedAt;

AchieveBreakdown({this.id, this.achievePercentage, this.incentive, this.incentiveType, this.createdAt, this.updatedAt});

AchieveBreakdown.fromJson(Map<String, dynamic> json) {
id = json['id'];
achievePercentage = json['achieve_percentage'];
incentive = json['incentive'];
incentiveType = json['incentive_type'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['achieve_percentage'] = this.achievePercentage;
data['incentive'] = this.incentive;
data['incentive_type'] = this.incentiveType;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
return data;
}
}
class MinimumProduct {
  String? id;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  Product? product;

  MinimumProduct({this.id, this.quantity, this.createdAt, this.updatedAt, this.product});

  MinimumProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product = json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
String? id;
String? name;
String? incentiveType;
int? minimumSalePrice;
int? incentive;
bool? isSale;
String? createdAt;
String? updatedAt;
Product? product;

Product({this.id, this.incentiveType, this.minimumSalePrice, this.incentive, this.isSale, this.createdAt, this.updatedAt, this.product,this.name});

Product.fromJson(Map<String, dynamic> json) {
id = json['id'];
incentiveType = json['incentive_type'];
minimumSalePrice = json['minimum_sale_price'];
incentive = json['incentive'];
isSale = json['is_sale'];
name = json['name'];
createdAt = json['created_at'];
updatedAt = json['updated_at'];
product = json['product'] != null ? new Product.fromJson(json['product']) : null;
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = new Map<String, dynamic>();
data['id'] = this.id;
data['name'] = this.name;
data['incentive_type'] = this.incentiveType;
data['minimum_sale_price'] = this.minimumSalePrice;
data['incentive'] = this.incentive;
data['is_sale'] = this.isSale;
data['created_at'] = this.createdAt;
data['updated_at'] = this.updatedAt;
if (this.product != null) {
data['product'] = this.product!.toJson();
}
return data;
}
}



