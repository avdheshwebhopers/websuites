

import '../customer_master_activtaion_setting_response_model.dart';

class ActivationSettingCreateResponseModel {
  bool? isSentCustomer;
  Service? service;
  Service? mailTo;
  List<CcUsers>? ccUsers;
  Service? createdBy;
  String? id;
  String? createdAt;
  String? updatedAt;

  ActivationSettingCreateResponseModel(
      {this.isSentCustomer,
        this.service,
        this.mailTo,
        this.ccUsers,
        this.createdBy,
        this.id,
        this.createdAt,
        this.updatedAt});

  ActivationSettingCreateResponseModel.fromJson(Map<String, dynamic> json) {
    isSentCustomer = json['is_sent_customer'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    mailTo =
    json['mail_to'] != null ? new Service.fromJson(json['mail_to']) : null;
    if (json['cc_users'] != null) {
      ccUsers = <CcUsers>[];
      json['cc_users'].forEach((v) {
        ccUsers!.add(CcUsers.fromJson(v));
      });
    }
    createdBy = json['created_by'] != null
        ? new Service.fromJson(json['created_by'])
        : null;
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_sent_customer'] = this.isSentCustomer;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.mailTo != null) {
      data['mail_to'] = this.mailTo!.toJson();
    }
    if (this.ccUsers != null) {
      data['cc_users'] = this.ccUsers!.map((v) =>()).toList();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Service {
  String? id;

  Service({this.id});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}


