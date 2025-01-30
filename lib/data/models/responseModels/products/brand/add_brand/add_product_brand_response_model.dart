class AddProductBrandResponseModel {
  String? name;
  String? description;
  Division? division;
  String? id;
  String? createdAt;
  String? updatedAt;

  AddProductBrandResponseModel(
      {this.name,
        this.description,
        this.division,
        this.id,
        this.createdAt,
        this.updatedAt});

  AddProductBrandResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Division {
  String? id;
  String? name;
  String? status;
  String? mobileNo;
  String? contactPerson;
  String? email;
  String? address;
  String? logo;
  String? createdAt;
  String? updatedAt;
  Null? zohoOrganizationId;
  Null? zohoTaxExemptionId;

  Division(
      {this.id,
        this.name,
        this.status,
        this.mobileNo,
        this.contactPerson,
        this.email,
        this.address,
        this.logo,
        this.createdAt,
        this.updatedAt,
        this.zohoOrganizationId,
        this.zohoTaxExemptionId});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    mobileNo = json['mobile_no'];
    contactPerson = json['contact_person'];
    email = json['email'];
    address = json['address'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    zohoOrganizationId = json['zoho_organization_id'];
    zohoTaxExemptionId = json['zoho_tax_exemption_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['mobile_no'] = this.mobileNo;
    data['contact_person'] = this.contactPerson;
    data['email'] = this.email;
    data['address'] = this.address;
    data['logo'] = this.logo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['zoho_organization_id'] = this.zohoOrganizationId;
    data['zoho_tax_exemption_id'] = this.zohoTaxExemptionId;
    return data;
  }
}