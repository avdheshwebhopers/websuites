class LeadDetailGenerateProformaResponseModel {
  String? name;
  int? performaNumber;
  String? address;
  String? email;
  int? phone;
  String? remark;
  City? city;
  dynamic company;
  City? createdBy;
  City? lead;
  dynamic customer;
  City? division;
  City? currency;
  dynamic performa;
  String? id;
  int? gstFees;
  int? tdsPercentage;
  int? amount;
  int? tdsAmount;
  int? totalAmount;
  String? createdAt;
  String? updatedAt;

  LeadDetailGenerateProformaResponseModel(
      {this.name,
        this.performaNumber,
        this.address,
        this.email,
        this.phone,
        this.remark,
        this.city,
        this.company,
        this.createdBy,
        this.lead,
        this.customer,
        this.division,
        this.currency,
        this.performa,
        this.id,
        this.gstFees,
        this.tdsPercentage,
        this.amount,
        this.tdsAmount,
        this.totalAmount,
        this.createdAt,
        this.updatedAt});

  LeadDetailGenerateProformaResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    performaNumber = json['performa_number'];
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    remark = json['remark'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    company = json['company'];
    createdBy = json['created_by'] != null
        ? new City.fromJson(json['created_by'])
        : null;
    lead = json['lead'] != null ? new City.fromJson(json['lead']) : null;
    customer = json['customer'];
    division =
    json['division'] != null ? new City.fromJson(json['division']) : null;
    currency =
    json['currency'] != null ? new City.fromJson(json['currency']) : null;
    performa = json['performa'];
    id = json['id'];
    gstFees = json['gst_fees'];
    tdsPercentage = json['tds_percentage'];
    amount = json['amount'];
    tdsAmount = json['tds_amount'];
    totalAmount = json['total_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['performa_number'] = this.performaNumber;
    data['address'] = this.address;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['remark'] = this.remark;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['company'] = this.company;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    if (this.lead != null) {
      data['lead'] = this.lead!.toJson();
    }
    data['customer'] = this.customer;
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.currency != null) {
      data['currency'] = this.currency!.toJson();
    }
    data['performa'] = this.performa;
    data['id'] = this.id;
    data['gst_fees'] = this.gstFees;
    data['tds_percentage'] = this.tdsPercentage;
    data['amount'] = this.amount;
    data['tds_amount'] = this.tdsAmount;
    data['total_amount'] = this.totalAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class City {
  String? id;

  City({this.id});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}