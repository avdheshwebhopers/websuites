class ProjectsListResponseModel {
  List<Items>? items;
  Meta? meta;
  String? user_key;

  ProjectsListResponseModel ({
    this.user_key,
    this.meta,
    this.items
});

  ProjectsListResponseModel.fromJson(Map<String, dynamic> json) {
    if(json['items'] != null) {
      items = <Items> [];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']): null;
    user_key = json['user_key'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(items != null) {
      data['items'] = items !. map((v) => v.toJson()).toList();
    }
    if(meta != null) {
      data['meta'] = meta !. toJson();
    }
    data['user_key'] = user_key;
    return data;
  }
}

class Items {
  String? id;
  String? project_name;
  String? billing_type;
  String? status;
  int? total_rate;
  int? estimated_hours;
  String? start_date;
  String? deadline;
  String? description;
  String? demo_url;
  String? live_url;
  String? created_at;
  String? updated_at;
  Customer? customer;
  List<Members>? members;
  List<Tags>? tags;

  Items({
    this.id,
    this.project_name,
    this.billing_type,
    this.status,
    this.total_rate,
    this.estimated_hours,
    this.start_date,
    this.deadline,
    this.description,
    this.demo_url,
    this.live_url,
    this.created_at,
    this.updated_at,
    this.customer,
    this.members,
    this.tags
});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    project_name = json['project_name'];
    billing_type = json['billing_type'];
    status = json['status'];
    total_rate = json['total_rate'];
    estimated_hours = json['estimated_hours'];
    start_date = json['start_date'];
    deadline = json['deadline'];
    description = json['description'];
    demo_url = json['demo_url'];
    live_url = json['live_url'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    customer = json['customer'] != null ? Customer.fromJson(json['customer']): null;
    if(json['Members'] != null) {
      members = <Members> [];
      json['customer'].forEach((v){
        members !.add(Members.fromJson(v));
      });
    }
    if(json['tags'] != null) {
      tags = <Tags> [];
      json['customer'].forEach((v){
        tags !.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['project_name'] = project_name;
    data['billing_type'] = billing_type;
    data['status'] = status;
    data['total_rate'] = total_rate;
    data['estimated_hours'] = estimated_hours;
    data['start_date'] = start_date;
    data['deadline'] = deadline;
    data['description'] = description;
    data['demo_url'] = demo_url;
    data['live_url'] = live_url;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    if(customer != null) {
      data['customer'] = customer !.toJson();
    }
    if(members != null) {
      data['members'] = members !.map((v) => toJson()).toList();
    }
    if(tags != null){
      data['tags'] = tags !.map((v) => toJson()).toList();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? company_name;
  String? first_name;
  String? last_name;
  String? primary_email;
  int? country_code;
  String? primary_contact;
  String? organization;
  String? primary_address;
  String? profile_image;
  String? dob;
  String? about_client;
  String? other_information;
  int? lat;
  int? lng;
  String? created_at;
  String? updated_at;
  String? delete_at;
  String? delete_remark;
  String? zoho_contact_id;
  String? status;
  String? subStatus;

  Customer ({
    this.id,
    this.company_name,
    this.first_name,
    this.last_name,
    this.primary_email,
    this.country_code,
    this.primary_contact,
    this.organization,
    this.primary_address,
    this.profile_image,
    this.dob,
    this.about_client,
    this.other_information,
    this.lat,
    this.lng,
    this.created_at,
    this.updated_at,
    this.delete_at,
    this.delete_remark,
    this.zoho_contact_id,
    this.status,
    this.subStatus
});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    primary_email = json['primary_email'];
    country_code = json['country_code'];
    primary_contact = json['primary_contact'];
    profile_image = json['profile_image'];
    dob = json['dob'];
    about_client = json['about_client'];
    other_information = json['other_information'];
    lat = json['lat'];
    lng = json['lng'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    delete_at = json['delete_at'];
    delete_remark = json['delete_remark'];
    zoho_contact_id = json['zoho_contact_id'];
    status = json['status'];
    subStatus = json['subStatus'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['company_name'] = company_name;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['primary_email'] = primary_email;
    data['country_code'] = country_code;
    data['primary_contact'] = primary_contact;
    data['dob'] = dob;
    data['about_client'] = about_client;
    data['other_information'] = other_information;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['delete_at'] = delete_at;
    data['delete_remark'] = delete_remark;
    data['zoho_contact_id'] = zoho_contact_id;
    data['status'] = status;
    data['subStatus'] = subStatus;
    return data;
  }
}

class Members {
  String? id;
  String? first_name;
  String? last_name;
  String? email;
  String? mobile;
  String? address;
  String? bio;
  String? profile_pic;
  String? password;
  bool? status;
  String? remember_token;
  String? remember_token_time;
  bool? isdefault;
  String? created_at;
  String? updated_at;
  String? device_id;
  bool? tracking;
  String? crm_category;
  bool? mobile_app;
  bool? superSettings;

  Members({
    this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.mobile,
    this.address,
    this.bio,
    this.profile_pic,
    this.password,
    this.status,
    this.remember_token,
    this.remember_token_time,
    this.isdefault,
    this.created_at,
    this.updated_at,
    this.device_id,
    this.tracking,
    this.crm_category,
    this.mobile_app,
    this.superSettings
});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    bio = json['bio'];
    profile_pic = json['profile_pic'];
    password = json['password'];
    status = json['status'];
    remember_token = json['remember_token'];
    remember_token_time = json['remember_token_time'];
    isdefault = json['isdefault'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    device_id = json['device_id'];
    tracking = json['tracking'];
    crm_category = json['crm_category'];
    mobile_app = json['mobile_app'];
    superSettings = json['superSettings'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    data['bio'] = bio;
    data['profile_pic'] = profile_pic;
    data['password'] = password;
    data['status'] = status;
    data['remember_token'] = remember_token;
    data['remember_token_time'] = remember_token_time;
    data['isdefault'] = isdefault;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['device_id'] = device_id;
    data['tracking'] = tracking;
    data['crm_category'] = crm_category;
    data['mobile_app'] = mobile_app;
    data['superSettings'] = superSettings;
    return data;
  }
}

class Tags {
  String? id;
  String? name;
  String? created_at;
  String? updated_at;

  Tags({
    this.id,
    this.name,
    this.created_at,
    this.updated_at
});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? itemsPerPage;
  int? totalPages;
  int? totalItems;
  int? itemCount;

  Meta({
    this.currentPage,
    this.itemsPerPage,
    this.totalPages,
    this.totalItems,
    this.itemCount
});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    itemsPerPage = json['itemsPerPage'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    itemCount = json['itemCount'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    return data;
  }
}