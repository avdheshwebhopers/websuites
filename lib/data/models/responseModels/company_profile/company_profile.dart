class CompanyProfileResponseModel {
  String? id;
  String? name;
  String? primaryPhone;
  String? secondoryPhone;
  String? primaryEmail;
  String? secondoryEmail;
  String? address;
  String? gstin;
  String? ownerName;
  String? contactPerson;
  String? description;
  String? logo;
  Null? link;
  String? companyTermConditions;
  String? invoiceAuthorizedPerson;
  String? invoiceAuthorizedDesignation;
  String? invoiceDigitalSign;
  String? createdAt;
  String? updatedAt;
  City? city;

  CompanyProfileResponseModel(
      {this.id,
        this.name,
        this.primaryPhone,
        this.secondoryPhone,
        this.primaryEmail,
        this.secondoryEmail,
        this.address,
        this.gstin,
        this.ownerName,
        this.contactPerson,
        this.description,
        this.logo,
        this.link,
        this.companyTermConditions,
        this.invoiceAuthorizedPerson,
        this.invoiceAuthorizedDesignation,
        this.invoiceDigitalSign,
        this.createdAt,
        this.updatedAt,
        this.city});

  CompanyProfileResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    primaryPhone = json['primary_phone'];
    secondoryPhone = json['secondory_phone'];
    primaryEmail = json['primary_email'];
    secondoryEmail = json['secondory_email'];
    address = json['address'];
    gstin = json['gstin'];
    ownerName = json['owner_name'];
    contactPerson = json['contact_person'];
    description = json['description'];
    logo = json['logo'];
    link = json['link'];
    companyTermConditions = json['company_term_conditions'];
    invoiceAuthorizedPerson = json['invoice_authorized_person'];
    invoiceAuthorizedDesignation = json['invoice_authorized_designation'];
    invoiceDigitalSign = json['invoice_digital_sign'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['primary_phone'] = primaryPhone;
    data['secondory_phone'] = secondoryPhone;
    data['primary_email'] = primaryEmail;
    data['secondory_email'] = secondoryEmail;
    data['address'] = address;
    data['gstin'] = gstin;
    data['owner_name'] = ownerName;
    data['contact_person'] = contactPerson;
    data['description'] = description;
    data['logo'] = logo;
    data['link'] = link;
    data['company_term_conditions'] = this.companyTermConditions;
    data['invoice_authorized_person'] = this.invoiceAuthorizedPerson;
    data['invoice_authorized_designation'] = this.invoiceAuthorizedDesignation;
    data['invoice_digital_sign'] = this.invoiceDigitalSign;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    return data;
  }

  static List<CompanyProfileResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>CompanyProfileResponseModel.fromJson(json)).toList();
  }
}

class City {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  State? state;

  City(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.state});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    return data;
  }
}

class State {
  String? id;
  String? name;
  String? code;
  String? status;
  String? createdAt;
  String? updatedAt;
  Country? country;

  State(
      {this.id,
        this.name,
        this.code,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.country});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  String? id;
  String? name;
  String? shortName;
  String? native;
  String? phone;
  String? continent;
  String? capital;
  String? currency;
  String? status;
  bool? installStatus;
  String? createdAt;
  String? updatedAt;

  Country(
      {this.id,
        this.name,
        this.shortName,
        this.native,
        this.phone,
        this.continent,
        this.capital,
        this.currency,
        this.status,
        this.installStatus,
        this.createdAt,
        this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    native = json['native'];
    phone = json['phone'];
    continent = json['continent'];
    capital = json['capital'];
    currency = json['currency'];
    status = json['status'];
    installStatus = json['installStatus'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['shortName'] = this.shortName;
    data['native'] = this.native;
    data['phone'] = this.phone;
    data['continent'] = this.continent;
    data['capital'] = this.capital;
    data['currency'] = this.currency;
    data['status'] = this.status;
    data['installStatus'] = this.installStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}