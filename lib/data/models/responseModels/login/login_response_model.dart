class LoginResponseModel {
  String? accessToken;
  User? user;

  LoginResponseModel({this.accessToken, this.user});

  /// Factory constructor for creating a `LoginResponseModel` from a JSON map.
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      accessToken: json['accessToken'] as String?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  /// Converts the `LoginResponseModel` instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      if (user != null) 'user': user!.toJson(),
    };
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  bool? isAdmin;
  String? crmCategory;
  bool? mobileApp;
  bool? superSettings;
  bool? isWhatsappEnabled;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.isAdmin,
    this.crmCategory,
    this.mobileApp,
    this.superSettings,
    this.isWhatsappEnabled,
  });

  /// Factory constructor for creating a `User` from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      isAdmin: json['is_admin'] as bool?,
      crmCategory: json['crm_category'] as String?,
      mobileApp: json['mobile_app'] as bool?,
      superSettings: json['superSettings'] as bool?,
      isWhatsappEnabled: json['isWhatsappEnabled'] as bool?,
    );
  }

  /// Converts the `User` instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'is_admin': isAdmin,
      'crm_category': crmCategory,
      'mobile_app': mobileApp,
      'superSettings': superSettings,
      'isWhatsappEnabled': isWhatsappEnabled,
    };
  }
}
