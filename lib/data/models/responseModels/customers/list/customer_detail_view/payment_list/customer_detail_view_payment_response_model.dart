class CustomerDetailViewPaymentResponseModel {
  String? id;
  int? amount;
  int? gstAndFees;
  String? paymentMode;
  String? paymentType;
  String? txnId;
  int? chequeNumber;
  Null? chequeDate;
  String? uploadDocument;
  Null? invoice;
  String? information;
  bool? isFresh;
  String? status;
  Null? remark;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  CustomerDetailViewPaymentResponseModel(
      {this.id,
        this.amount,
        this.gstAndFees,
        this.paymentMode,
        this.paymentType,
        this.txnId,
        this.chequeNumber,
        this.chequeDate,
        this.uploadDocument,
        this.invoice,
        this.information,
        this.isFresh,
        this.status,
        this.remark,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  CustomerDetailViewPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
    gstAndFees = json['gst_and_fees'];
    paymentMode = json['payment_mode'];
    paymentType = json['payment_type'];
    txnId = json['txn_id'];
    chequeNumber = json['cheque_number'];
    chequeDate = json['cheque_date'];
    uploadDocument = json['upload_document'];
    invoice = json['invoice'];
    information = json['information'];
    isFresh = json['is_fresh'];
    status = json['status'];
    remark = json['remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
    data['gst_and_fees'] = this.gstAndFees;
    data['payment_mode'] = this.paymentMode;
    data['payment_type'] = this.paymentType;
    data['txn_id'] = this.txnId;
    data['cheque_number'] = this.chequeNumber;
    data['cheque_date'] = this.chequeDate;
    data['upload_document'] = this.uploadDocument;
    data['invoice'] = this.invoice;
    data['information'] = this.information;
    data['is_fresh'] = this.isFresh;
    data['status'] = this.status;
    data['remark'] = this.remark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
  static List<CustomerDetailViewPaymentResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerDetailViewPaymentResponseModel.fromJson(json)).toList();
  }

}