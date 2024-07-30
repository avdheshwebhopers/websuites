
import '../../responseModels/user_list.dart';

class UserListRequestModel {
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
  String? deviceId;
  bool? tracking;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;
  Department? department;
  Parent? parent;
  List<RoleList>? roleList;

  UserListRequestModel({
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
    this.deviceId,
    this.tracking,
    this.crmCategory,
    this.mobileApp,
    this.superSettings,
    this.department,
    this.parent,
    this.roleList,
  });

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
    data['device_id'] = deviceId;
    data['tracking'] = tracking;
    data['crm_category'] = crmCategory;
    data['mobile_app'] = mobileApp;
    data['superSettings'] = superSettings;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    if (roleList != null) {
      data['role_list'] = roleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}