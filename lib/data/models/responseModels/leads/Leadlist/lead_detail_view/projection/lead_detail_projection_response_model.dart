class LeadDetailProjectionResponseModel {
  int? statusCode;
  String? message;

  LeadDetailProjectionResponseModel({this.statusCode, this.message});

  LeadDetailProjectionResponseModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
