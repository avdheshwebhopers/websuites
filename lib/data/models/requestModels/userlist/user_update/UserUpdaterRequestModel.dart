class UserUpdaterRequestModel {
  String? password;
  String? cpassword;
  String? mobile;
  String? email;
  String? lastName;
  String? department;
  String? firstName;
  String? parent;
  List<String>? roleList;

  UserUpdaterRequestModel({
    this.password,
    this.cpassword,
    this.mobile,
    this.email,
    this.lastName,
    this.department,
    this.firstName,
    this.parent,
    this.roleList,
  });

  UserUpdaterRequestModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    cpassword = json['cpassword'];
    mobile = json['mobile'];
    email = json['email'];
    lastName = json['last_name'];
    department = json['department'];
    firstName = json['first_name'];
    parent = json['parent'];
    roleList = json['role_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['password'] = this.password;
    data['cpassword'] = this.cpassword;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['last_name'] = this.lastName;
    data['department'] = this.department;
    data['first_name'] = this.firstName;
    data['parent'] = this.parent;
    data['role_list'] = this.roleList;
    return data;
  }
}