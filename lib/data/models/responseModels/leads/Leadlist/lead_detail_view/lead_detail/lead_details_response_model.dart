class LeadDetailResponseModel {
  String? id;
  int? score;
  String? firstName;
  String? lastName;
  int? countryCode;
  String? mobile;
  String? mobileWithCountrycode;
  String? email;
  String? organization;
  String? description;
  String? address;
  Null city;
  Null state;
  int? flag;
  Null importCustomData;
  Null queryTime;
  String? queryType;
  Null refId;
  Null leadBuyerEmail;
  Null leadBuyerName;
  Null label;
  Null note;
  String? gstin;
  List<Null>? websites;
  Null deleteRemark;
  Null deadRemark;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;
  String? oldLead;
  bool? isOldLead;
  Null facebookLeadgenId;
  String? latestEnquiryDate;
  String? leadStatus;
  Source? source;
  Contact? contact;
  List<Null>? enquiries;
  List<SecondaryEmails>? secondaryEmails;
  List<SecondaryMobiles>? secondaryMobiles;
  Pincode? pincode;
  District? district;
  District? leadCity;
  District? leadState;
  District? leadCountry;
  Type? type;
  Null subType;
  Null status;
  List<Divisions>? divisions;
  List<ProductCategory>? productCategories;
  Null customer;
  Null leadParent;
  List<Null>? projections;
  Null createdBy;
  List<LeadToCustomFields>? leadToCustomFields;
  List<LeadAssigned>? leadAssigned;

  LeadDetailResponseModel(
      {this.id,
        this.score,
        this.firstName,
        this.lastName,
        this.countryCode,
        this.mobile,
        this.mobileWithCountrycode,
        this.email,
        this.organization,
        this.description,
        this.address,
        this.city,
        this.state,
        this.flag,
        this.importCustomData,
        this.queryTime,
        this.queryType,
        this.refId,
        this.leadBuyerEmail,
        this.leadBuyerName,
        this.label,
        this.note,
        this.gstin,
        this.websites,
        this.deleteRemark,
        this.deadRemark,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.oldLead,
        this.isOldLead,
        this.facebookLeadgenId,
        this.latestEnquiryDate,
        this.leadStatus,
        this.source,
        this.contact,
        this.enquiries,
        this.secondaryEmails,
        this.secondaryMobiles,
        this.pincode,
        this.district,
        this.leadCity,
        this.leadState,
        this.leadCountry,
        this.type,
        this.subType,
        this.status,
        this.divisions,
        this.productCategories,
        this.customer,
        this.leadParent,
        this.projections,
        this.createdBy,
        this.leadToCustomFields,
        this.leadAssigned});

  LeadDetailResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    score = json['score'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    mobileWithCountrycode = json['mobile_with_countrycode'];
    email = json['email'];
    organization = json['organization'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    flag = json['flag'];
    importCustomData = json['import_custom_data'];
    queryTime = json['query_time'];
    queryType = json['query_type'];
    refId = json['ref_id'];
    leadBuyerEmail = json['lead_buyer_email'];
    leadBuyerName = json['lead_buyer_name'];
    label = json['label'];
    note = json['note'];
    gstin = json['gstin'];
    if (json['websites'] != null) {
      websites = <Null>[];
      json['websites'].forEach((v) {
        websites!.add((v));
      });
    }
    deleteRemark = json['delete_remark'];
    deadRemark = json['dead_remark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    oldLead = json['old_lead'];
    isOldLead = json['isOldLead'];
    facebookLeadgenId = json['facebookLeadgenId'];
    latestEnquiryDate = json['latest_enquiry_date'];
    leadStatus = json['leadStatus'];
    source =
    json['source'] != null ? new Source.fromJson(json['source']) : null;
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    if (json['enquiries'] != null) {
      enquiries = <Null>[];
      json['enquiries'].forEach((v) {
        enquiries!.add((v));
      });
    }
    if (json['secondary_emails'] != null) {
      secondaryEmails = <SecondaryEmails>[];
      json['secondary_emails'].forEach((v) {
        secondaryEmails!.add(new SecondaryEmails.fromJson(v));
      });
    }
    if (json['secondary_mobiles'] != null) {
      secondaryMobiles = <SecondaryMobiles>[];
      json['secondary_mobiles'].forEach((v) {
        secondaryMobiles!.add(new SecondaryMobiles.fromJson(v));
      });
    }
    pincode =
    json['pincode'] != null ? new Pincode.fromJson(json['pincode']) : null;
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    leadCity = json['lead_city'] != null
        ? new District.fromJson(json['lead_city'])
        : null;
    leadState = json['lead_state'] != null
        ? new District.fromJson(json['lead_state'])
        : null;
    leadCountry = json['lead_country'] != null
        ? new District.fromJson(json['lead_country'])
        : null;
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    subType = json['sub_type'];
    status = json['status'];
    if (json['divisions'] != null) {
      divisions = <Divisions>[];
      json['divisions'].forEach((v) {
        divisions!.add(new Divisions.fromJson(v));
      });
    }
    if (json['productCategories'] != null) {
      productCategories = <ProductCategory>[];
      json['productCategories'].forEach((v) {
        productCategories!.add(new ProductCategory.fromJson(v));
      });
    }
    customer = json['customer'];
    leadParent = json['lead_parent'];
    if (json['projections'] != null) {
      projections = <Null>[];
      json['projections'].forEach((v) {
        projections!.add((v));
      });
    }
    createdBy = json['created_by'];
    if (json['leadToCustomFields'] != null) {
      leadToCustomFields = <LeadToCustomFields>[];
      json['leadToCustomFields'].forEach((v) {
        leadToCustomFields!.add(new LeadToCustomFields.fromJson(v));
      });
    }
    if (json['lead_assigned'] != null) {
      leadAssigned = <LeadAssigned>[];
      json['lead_assigned'].forEach((v) {
        leadAssigned!.add(new LeadAssigned.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['score'] = this.score;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['country_code'] = this.countryCode;
    data['mobile'] = this.mobile;
    data['mobile_with_countrycode'] = this.mobileWithCountrycode;
    data['email'] = this.email;
    data['organization'] = this.organization;
    data['description'] = this.description;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['flag'] = this.flag;
    data['import_custom_data'] = this.importCustomData;
    data['query_time'] = this.queryTime;
    data['query_type'] = this.queryType;
    data['ref_id'] = this.refId;
    data['lead_buyer_email'] = this.leadBuyerEmail;
    data['lead_buyer_name'] = this.leadBuyerName;
    data['label'] = this.label;
    data['note'] = this.note;
    data['gstin'] = this.gstin;
    if (this.websites != null) {
      data['websites'] = this.websites!.map((v) => ()).toList();
    }
    data['delete_remark'] = this.deleteRemark;
    data['dead_remark'] = this.deadRemark;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['old_lead'] = this.oldLead;
    data['isOldLead'] = this.isOldLead;
    data['facebookLeadgenId'] = this.facebookLeadgenId;
    data['latest_enquiry_date'] = this.latestEnquiryDate;
    data['leadStatus'] = this.leadStatus;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact!.toJson();
    }
    if (this.enquiries != null) {
      data['enquiries'] = this.enquiries!.map((v) =>()).toList();
    }
    if (this.secondaryEmails != null) {
      data['secondary_emails'] =
          this.secondaryEmails!.map((v) => v.toJson()).toList();
    }
    if (this.secondaryMobiles != null) {
      data['secondary_mobiles'] =
          this.secondaryMobiles!.map((v) => v.toJson()).toList();
    }
    if (this.pincode != null) {
      data['pincode'] = this.pincode!.toJson();
    }
    if (this.district != null) {
      data['district'] = this.district!.toJson();
    }
    if (this.leadCity != null) {
      data['lead_city'] = this.leadCity!.toJson();
    }
    if (this.leadState != null) {
      data['lead_state'] = this.leadState!.toJson();
    }
    if (this.leadCountry != null) {
      data['lead_country'] = this.leadCountry!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['sub_type'] = this.subType;
    data['status'] = this.status;
    if (this.divisions != null) {
      data['divisions'] = this.divisions!.map((v) => v.toJson()).toList();
    }
    if (this.productCategories != null) {
      data['productCategories'] =
          this.productCategories!.map((v) => ()).toList();
    }
    data['customer'] = this.customer;
    data['lead_parent'] = this.leadParent;
    if (this.projections != null) {
      data['projections'] = this.projections!.map((v) => ()).toList();
    }
    data['created_by'] = this.createdBy;
    if (this.leadToCustomFields != null) {
      data['leadToCustomFields'] =
          this.leadToCustomFields!.map((v) => v.toJson()).toList();
    }
    if (this.leadAssigned != null) {
      data['lead_assigned'] =
          this.leadAssigned!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Source {
  String? id;
  String? name;
  String? status;
  String? createdAt;
  String? updateAt;

  Source({this.id, this.name, this.status, this.createdAt, this.updateAt});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updateAt = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['update_at'] = this.updateAt;
    return data;
  }
}




class ProductCategory {
  String? id;
  String? name;

  ProductCategory({this.id, this.name});

  // From JSON constructor
  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  // To JSON method
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}



class Contact {
  String? id;
  String? type;
  String? name;
  String? email;
  String? mobile;

  Contact({this.id, this.type, this.name, this.email, this.mobile});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    return data;
  }
}

class SecondaryEmails {
  String? id;
  String? email;
  String? createdAt;
  String? updatedAt;

  SecondaryEmails({this.id, this.email, this.createdAt, this.updatedAt});

  SecondaryEmails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SecondaryMobiles {
  String? id;
  String? mobile;
  String? countryCode;
  String? mobileWithCountrycode;
  String? createdAt;
  String? updatedAt;

  SecondaryMobiles(
      {this.id,
        this.mobile,
        this.countryCode,
        this.mobileWithCountrycode,
        this.createdAt,
        this.updatedAt});

  SecondaryMobiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    mobileWithCountrycode = json['mobile_with_countrycode'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobile'] = this.mobile;
    data['country_code'] = this.countryCode;
    data['mobile_with_countrycode'] = this.mobileWithCountrycode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Pincode {
  String? id;
  String? code;

  Pincode({this.id, this.code});

  Pincode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    return data;
  }
}

class District {
  String? id;
  String? name;

  District({this.id, this.name});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Type {
  String? id;
  String? name;
  bool? isReminderRequired;

  Type({this.id, this.name, this.isReminderRequired});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isReminderRequired = json['isReminderRequired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['isReminderRequired'] = this.isReminderRequired;
    return data;
  }
}

class Divisions {
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
  String? zohoOrganizationId;
  String? zohoTaxExemptionId;

  Divisions(
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

  Divisions.fromJson(Map<String, dynamic> json) {
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

class LeadToCustomFields {
  String? id;
  String? leadId;
  String? customId;
  String? value;
  String? fieldName;
  String? createdAt;
  String? updatedAt;
  Customfields? customfields;

  LeadToCustomFields(
      {this.id,
        this.leadId,
        this.customId,
        this.value,
        this.fieldName,
        this.createdAt,
        this.updatedAt,
        this.customfields});

  LeadToCustomFields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    customId = json['custom_id'];
    value = json['value'];
    fieldName = json['field_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customfields = json['customfields'] != null
        ? new Customfields.fromJson(json['customfields'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['custom_id'] = this.customId;
    data['value'] = this.value;
    data['field_name'] = this.fieldName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customfields != null) {
      data['customfields'] = this.customfields!.toJson();
    }
    return data;
  }
}

class Customfields {
  String? id;
  String? fieldFor;
  String? fieldLabel;
  String? fieldName;
  String? type;
  String? description;
  String? answers;
  String? pattern;
  int? maxValue;
  bool? required;
  bool? requiredForCustomer;
  String? defaultValue;
  bool? multiple;
  String? createdAt;
  String? updatedAt;

  Customfields(
      {this.id,
        this.fieldFor,
        this.fieldLabel,
        this.fieldName,
        this.type,
        this.description,
        this.answers,
        this.pattern,
        this.maxValue,
        this.required,
        this.requiredForCustomer,
        this.defaultValue,
        this.multiple,
        this.createdAt,
        this.updatedAt});

  Customfields.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldFor = json['field_for'];
    fieldLabel = json['field_label'];
    fieldName = json['field_name'];
    type = json['type'];
    description = json['description'];
    answers = json['answers'];
    pattern = json['pattern'];
    maxValue = json['max_value'];
    required = json['required'];
    requiredForCustomer = json['required_for_customer'];
    defaultValue = json['default_value'];
    multiple = json['multiple'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['field_for'] = this.fieldFor;
    data['field_label'] = this.fieldLabel;
    data['field_name'] = this.fieldName;
    data['type'] = this.type;
    data['description'] = this.description;
    data['answers'] = this.answers;
    data['pattern'] = this.pattern;
    data['max_value'] = this.maxValue;
    data['required'] = this.required;
    data['required_for_customer'] = this.requiredForCustomer;
    data['default_value'] = this.defaultValue;
    data['multiple'] = this.multiple;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LeadAssigned {
  String? id;
  int? status;
  String? createdAt;
  User? user;

  LeadAssigned({this.id, this.status, this.createdAt, this.user});

  LeadAssigned.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  District? department;

  User({this.id, this.firstName, this.lastName, this.department});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    department = json['department'] != null
        ? new District.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
}