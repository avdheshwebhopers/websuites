import '../customer_master_activtaion_setting_response_model.dart';

class ActivationSettingUpdateResponseModel {
  String? id;
  bool? isSentCustomer;
  String? createdAt;
  String? updatedAt;
  MailTo? mailTo;
  List<CcUsers>? ccUsers;

  ActivationSettingUpdateResponseModel(
      {this.id,
        this.isSentCustomer,
        this.createdAt,
        this.updatedAt,
        this.mailTo,
        this.ccUsers});

  ActivationSettingUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSentCustomer = json['is_sent_customer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    mailTo =
    json['mail_to'] != null ? new MailTo.fromJson(json['mail_to']) : null;
    if (json['cc_users'] != null) {
      ccUsers = <CcUsers>[];
      json['cc_users'].forEach((v) {
        ccUsers!.add(new CcUsers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_sent_customer'] = this.isSentCustomer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.mailTo != null) {
      data['mail_to'] = this.mailTo!.toJson();
    }
    if (this.ccUsers != null) {
      data['cc_users'] = this.ccUsers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MailTo {
  String? id;

  MailTo({this.id});

  MailTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}