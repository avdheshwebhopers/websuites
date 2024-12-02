class CustomerDetailUpdateResponseModel {
  String? id;
  String? companyName;
  String? companyEmail;
  int? companyPhone;
  int? countryCode;
  String? contactPersonName;
  int? contactPersonNumber;
  int? cCountryCode;
  String? address;
  String? website;
  String? gst;
  Null logo;
  Pincode? pincode;
  District? district;
  District? city;
  State? state;
  Country? country;

  CustomerDetailUpdateResponseModel(
      {this.id,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.countryCode,
        this.contactPersonName,
        this.contactPersonNumber,
        this.cCountryCode,
        this.address,
        this.website,
        this.gst,
        this.logo,
        this.pincode,
        this.district,
        this.city,
        this.state,
        this.country});

  CustomerDetailUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    countryCode = json['country_code'];
    contactPersonName = json['contact_person_name'];
    contactPersonNumber = json['contact_person_number'];
    cCountryCode = json['c_country_code'];
    address = json['address'];
    website = json['website'];
    gst = json['gst'];
    logo = json['logo'];
    pincode =
    json['pincode'] != null ? new Pincode.fromJson(json['pincode']) : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    city = json['city'] != null ? new District.fromJson(json['city']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['company_email'] = companyEmail;
    data['company_phone'] = companyPhone;
    data['country_code'] = countryCode;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_number'] = contactPersonNumber;
    data['c_country_code'] = cCountryCode;
    data['address'] = address;
    data['website'] = website;
    data['gst'] = gst;
    data['logo'] = logo;
    if (pincode != null) {
      data['pincode'] = pincode!.toJson();
    }
    if (district != null) {
      data['district'] = district!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (state != null) {
      data['state'] = this.state!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Pincode {
  String? id;
  District? district;

  Pincode({this.id, this.district});

  Pincode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    return data;
  }
}

class District {
  String? id;
  State? state;

  District({this.id, this.state});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (state != null) {
      data['state'] = this.state!.toJson();
    }
    return data;
  }
}

class State {
  String? id;

  State({this.id});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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