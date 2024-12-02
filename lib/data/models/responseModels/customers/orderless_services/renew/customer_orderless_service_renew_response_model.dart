class CustomerOrderlessServiceRenewResponseModel {
  String? startDate;
  String? endDate;
  String? remark;
  String? reminderBeforeExpire;
  Product? product;
  Product? company;
  Product? startBy;
  Product? createdBy;
  Null quitReason;
  Null quitDate;
  String? id;
  bool? status;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  bool? isDisposed;

  CustomerOrderlessServiceRenewResponseModel(
      {this.startDate,
        this.endDate,
        this.remark,
        this.reminderBeforeExpire,
        this.product,
        this.company,
        this.startBy,
        this.createdBy,
        this.quitReason,
        this.quitDate,
        this.id,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.isDisposed});

  CustomerOrderlessServiceRenewResponseModel.fromJson(
      Map<String, dynamic> json) {
    startDate = json['start_date'];
    endDate = json['end_date'];
    remark = json['remark'];
    reminderBeforeExpire = json['reminder_before_expire'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    company =
    json['company'] != null ? new Product.fromJson(json['company']) : null;
    startBy = json['start_by'] != null
        ? new Product.fromJson(json['start_by'])
        : null;
    createdBy = json['created_by'] != null
        ? new Product.fromJson(json['created_by'])
        : null;
    quitReason = json['quit_reason'];
    quitDate = json['quit_date'];
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isDisposed = json['isDisposed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['remark'] = this.remark;
    data['reminder_before_expire'] = this.reminderBeforeExpire;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.startBy != null) {
      data['start_by'] = this.startBy!.toJson();
    }
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['quit_reason'] = this.quitReason;
    data['quit_date'] = this.quitDate;
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['isDisposed'] = this.isDisposed;
    return data;
  }
}

class Product {
  String? id;

  Product({this.id});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}