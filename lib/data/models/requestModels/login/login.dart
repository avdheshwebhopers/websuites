class LoginRequestedModel {
  String? email;
  String? password;
  String? deviceId;

  LoginRequestedModel({
    this.email,
    this.password,
    this.deviceId,
  });

  // Factory constructor to create a User from a JSON map
  factory LoginRequestedModel.fromJson(Map<String, dynamic> json){
    return LoginRequestedModel(
      email: json['email'],
      password: json['password'],
      deviceId: json['device_id'],
    );
  }

  // Method to convert a User instance to a JSON map
  Map<String, dynamic> toJson(){
    return {
      'email': email,
      'password': password,
      'device_id': deviceId,
    };
  }
}