class UserListResponseModel {
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
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
  String? deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;
  Department? department;
  Parent? parent;
  List<RoleList>? roleList;

  UserListResponseModel

  ({this.id,
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
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.deviceId,
    this.tracking,
    this.crmCategory,
    this.mobileApp,
    this.superSettings,
    this.department,
    this.parent,
    this.roleList
  }
  );
  UserListResponseModel.fromJson(
      Map<String, dynamic> json) {
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
    isDefault = json['default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deviceId = json['device_id'];
    tracking = json['tracking'];
    crmCategory = json['crm_category'];
    mobileApp = json['mobile_app'];
    superSettings = json['superSettings'];
    department = json['department'] != null ? Department.fromJson(json['department']) : null;
    parent = json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    if (json['role_list'] != null) {
      roleList = <RoleList>[];
      json['role_list'].forEach((v) { roleList!.add(RoleList.fromJson(v)); });
    }
  }

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
    data['default'] = isDefault;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['device_id'] = deviceId;
    data['tracking'] = tracking;
    data['crm_category'] = crmCategory;
    data['mobile_app'] = mobileApp;
    data['superSettings'] = superSettings;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (parent != null) {data['parent'] = parent!.toJson();
    }
    if (roleList != null) {
      data['role_list'] = roleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Department {
  String? id;
  String? name;
  String? description;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;

  Department({this.id, this.name, this.description, this.isDefault, this.createdAt, this.updatedAt});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isDefault = json['default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['default'] = isDefault;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Parent {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  Null address;
  Null bio;
  Null profilePic;
  String? password;
  bool? status;
  Null rememberToken;
  Null rememberTokenTime;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
  Null deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;

  Parent({this.id,
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
    this.isDefault,
    this.createdAt,
    this.updatedAt,
    this.deviceId,
    this.tracking,
    this.crmCategory,
    this.mobileApp,
    this.superSettings});

  Parent.fromJson(Map<String, dynamic> json) {
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
    isDefault = json['default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deviceId = json['device_id'];
    tracking = json['tracking'];
    crmCategory = json['crm_category'];
    mobileApp = json['mobile_app'];
    superSettings = json['superSettings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;data['first_name'] = firstName;
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
    data['default'] = isDefault;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['device_id'] = deviceId;
    data['tracking'] = tracking;
    data['crm_category'] = crmCategory;
    data['mobile_app'] = mobileApp;
    data['superSettings'] = superSettings;
    return data;
  }
}

class RoleList {
  String? id;
  String? name;
  String? description;
  bool? isDefault;

  RoleList({this.id, this.name, this.description, this.isDefault});

  RoleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isDefault = json['default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['default'] = isDefault;
    return data;
  }
}