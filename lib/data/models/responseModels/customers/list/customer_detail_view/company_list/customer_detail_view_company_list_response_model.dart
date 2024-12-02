class CustomerDetailViewCompanyListResponseModel {
  String? id;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  int? countryCode;
  String? contactPersonName;
  String? contactPersonNumber;
  int? cCountryCode;
  String? address;
  Null website;
  Null gst;
  Null logo;
  int? lat;
  int? lng;
  Pincode? pincode;
  District? district;
  City? city;
  State? state;
  Country? country;
  List<Null>? children;

  CustomerDetailViewCompanyListResponseModel(
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
        this.lat,
        this.lng,
        this.pincode,
        this.district,
        this.city,
        this.state,
        this.country,
        this.children});

  CustomerDetailViewCompanyListResponseModel.fromJson(
      Map<String, dynamic> json) {
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
    lat = json['lat'];
    lng = json['lng'];
    pincode =
    json['pincode'] != null ? new Pincode.fromJson(json['pincode']) : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    state = json['state'] != null ? new State.fromJson(json['state']) : null;
    country =
    json['country'] != null ? new Country.fromJson(json['country']) : null;
    if (json['children'] != null) {
      children = <Null>[];
      json['children'].forEach((v) {
        children!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['country_code'] = this.countryCode;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_number'] = this.contactPersonNumber;
    data['c_country_code'] = this.cCountryCode;
    data['address'] = this.address;
    data['website'] = this.website;
    data['gst'] = this.gst;
    data['logo'] = this.logo;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    if (this.pincode != null) {
      data['pincode'] = this.pincode!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    if (this.children != null) {
      data['children'] = children!.map((v) => ()).toList();
    }
    return data;
  }
  static List<CustomerDetailViewCompanyListResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerDetailViewCompanyListResponseModel.fromJson(json)).toList();
  }


}

class Pincode {
  String? id;
  String? code;
  Null lat;
  Null lng;
  String? createdAt;
  String? updatedAt;

  Pincode(
      {this.id, this.code, this.lat, this.lng, this.createdAt, this.updatedAt});

  Pincode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    lat = json['lat'];
    lng = json['lng'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class District {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  District({this.id, this.name, this.createdAt, this.updatedAt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class City {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  City({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

  State(
      {this.id,
        this.name,
        this.code,
        this.status,
        this.createdAt,
        this.updatedAt});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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