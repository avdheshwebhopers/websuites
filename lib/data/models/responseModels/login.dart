class LoginResponseModel {
  String? accessToken;
  User? user;

  LoginResponseModel({this.accessToken, this.user});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? first_name;
  String? last_name;
  String? email;
  bool? isAdmin;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;
  bool? isWhatsappEnabled;

  User(
      {this.id,
        this.first_name,
        this.last_name,
        this.email,
        this.isAdmin,
        this.crmCategory,
        this.mobileApp,
        this.superSettings,
        this.isWhatsappEnabled});

  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    isAdmin = json['is_admin'];
    crmCategory = json['crm_category'];
    mobileApp = json['mobile_app'];
    superSettings = json['superSettings'];
    isWhatsappEnabled = json['isWhatsappEnabled'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['email'] = email;
    data['is_admin'] = isAdmin;
    data['crm_category'] = crmCategory;
    data['mobile_app'] = mobileApp;
    data['superSettings'] = superSettings;
    data['isWhatsappEnabled'] = isWhatsappEnabled;
    return data;
  }
}