class SalesResponseModel {
  List<Items>? items;
  Meta? meta;

  SalesResponseModel({
    this.items,
    this.meta
  });

  SalesResponseModel.fromJson(Map<String, dynamic> json) {
    if(json['items'] != null) {
      items = <Items> [];
      json['items'].forEach((v){
        items !. add(Items.fromJson(v));
      });
      meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    }
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    if(items != null) {
      data['items'] = items !. map((v) => toJson()).toList();
    }
    if(meta != null) {
      data['meta'] = meta !. toJson();
    }
    return data;
  }
}




class Items {
  String? id;
  String? name;
  String? start_date;
  String? end_date;
  int? sale_target;
  Team? team;
  String? created_at;
  String? updated_at;
  List<Members>? members;
  List<Product>? product;

  Items({
    this.id,
    this.name,
    this.start_date,
    this.end_date,
    this.sale_target,
    this.team,
    this.created_at,
    this.updated_at,
    this.members,
    this.product
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    start_date = json['start_date'];
    end_date = json['end_date'];
    sale_target = json['sale_target'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    if(json['members'] != null) {
      members = <Members> [];
      json['members'].forEach((v){
        members!.add(Members.fromJson(v));
      });
    }
    if(json['product'] != null) {
      product = <Product> [];
      json['product'].forEach((v){
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['start_date'] = start_date;
    data['end_date'] = end_date;
    data['sale_target'] = sale_target;
    if(team != null) {
      data['team'] = team !. toJson();
    }
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    if(members != null) {
      data['members'] = members !. map((v) => toJson()).toList();
    }
    if(product != null) {
      data['product'] = product !. map((v) => toJson()).toList();
    }
    return data;
  }
}

class Team {
  String? id;
  String? bio;
  String? email;
  String? mobile;
  bool? status;
  String? address;
  bool? isdefault;
  List<Children>? children;
  String? password;
  bool? tracking;
  String? device_id;
  String? last_name;
  List<RoleList>? role_list;
  String? sms_sender;
  String? created_at;
  String? first_name;
  String? smtp_sender;
  String? updated_at;
  String? profile_pic;
  String? crm_category;
  MailJetSender? mail_jet_sender;
  String? remember_token;
  String? whatsApp_sender;
  String? remember_token_time;

  Team({
    this.id,
    this.bio,
    this.email,
    this.mobile,
    this.status,
    this.address,
    this.isdefault,
    this.children,
    this.password,
    this.tracking,
    this.device_id,
    this.last_name,
    this.role_list,
    this.sms_sender,
    this.created_at,
    this.updated_at,
    this.first_name,
    this.profile_pic,
    this.crm_category,
    this.mail_jet_sender,
    this.remember_token,
    this.whatsApp_sender,
    this.remember_token_time,
  });

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bio = json['bio'];
    email = json['email'];
    mobile = json['mobile'];
    status = json['status'];
    address = json['address'];
    isdefault = json['isdefault'];
    if(json['children'] != null) {
      children = <Children> [];
      json['children'].forEach((v){
        children !. add(Children.fromJson(v));
      });
    }
    password = json['password'];
    tracking = json['tracking'];
    device_id = json['device_id'];
    last_name = json['last_name'];
    if(json['role_list'] != null) {
      role_list = <RoleList> [];
      json['role_list'].forEach((v){
        role_list !. add(RoleList.fromJson(v));
      });
    }
    sms_sender = json['sms_sender'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    first_name = json['first_name'];
    profile_pic = json['profile_pic'];
    crm_category = json['crmCategory'];
    mail_jet_sender = json['mailJetSender'] != null ? MailJetSender.fromJson(json['mailJetSender']): null;
    remember_token = json['remember_token'];
    whatsApp_sender = json['whatsApp_sender'];
    remember_token_time = json['remember_token_time'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['bio'] = bio;
    data['email'] = email;
    data['mobile'] = mobile;
    data['status'] = status;
    data['address'] = address;
    data['isdefault'] = isdefault;
    if(children != null) {
      data['children'] = children !.map((v) => toJson()).toList();
    }
    data['password'] = password;
    data['tracking'] = tracking;
    data['device_id'] = device_id;
    data['last_name'] = last_name;
    if(role_list != null) {
      data['role_list'] = role_list !.map((v) => toJson()). toList();
    }
    data['sms_sender'] = sms_sender;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['first_name'] = first_name;
    data['profile_pic'] = profile_pic;
    data['crm_category'] = crm_category;
    if(mail_jet_sender != null) {
      data['mail_jet_sender'] = mail_jet_sender !. toJson();
    }
    data['remember_token'] = remember_token;
    data['whatsApp_sender'] = whatsApp_sender;
    data['remember_token_time'] = remember_token_time;
    return data;
  }
}

class MailJetSender {
  String? id;
  String? name;
  String? email;
  bool? status;
  String? provider;
  String? smtp_host;
  String? smtp_port;
  String? created_at;
  String? updated_at;
  String? smtp_password;
  bool? is_default_sender;
  String? mailjet_sender_id;
  String? smtp_authentication;

  MailJetSender({
    this.id,
    this.name,
    this.email,
    this.status,
    this.provider,
    this.smtp_host,
    this.smtp_port,
    this.created_at,
    this.updated_at,
    this.smtp_password,
    this.is_default_sender,
    this.mailjet_sender_id,
    this.smtp_authentication
  });

  MailJetSender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    provider = json['provider'];
    smtp_host = json['smtp_host'];
    smtp_port = json['smtp_port'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    smtp_password = json['smtp_password'];
    is_default_sender = json['is_default_sender'];
    mailjet_sender_id = json['mail'];
    smtp_authentication = json['smtp_authentication'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['status'] = status;
    data['provider'] = provider;
    data['smtp_host'] = smtp_host;
    data['smtp_port'] = smtp_port;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['smtp_password'] = smtp_password;
    data['is_default_sender'] = is_default_sender;
    data['mailjet_sender_id'] = mailjet_sender_id;
    data['smtp_authentication'] = smtp_authentication;
    return data;
  }
}


class RoleList {
  String? id;
  String? name;
  String? isdefault;
  String? description;

  RoleList ({
    this.id,
    this.name,
    this.isdefault,
    this.description
  });

  RoleList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isdefault = json['isdefault'];
    description = json['description'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['isdefault'] = isdefault;
    data['description'] = description;
    return data;
  }
}

class Children {
  String? id;
  String? bio;
  String? email;
  String? mobile;
  bool? status;
  String? address;
  bool? isdefault;
  List<Children>? children;
  String? password;
  bool? tracking;
  String? device_id;
  String? last_name;
  String? created_at;
  String? first_name;
  String? updated_at;
  String? profile_pic;
  String? crm_category;
  String? remember_token;
  String? remember_token_time;

  Children({
    this.id,
    this.bio,
    this.email,
    this.mobile,
    this.status,
    this.address,
    this.isdefault,
    this.children,
    this.password,
    this.tracking,
    this.device_id,
    this.last_name,
    this.created_at,
    this.first_name,
    this.updated_at,
    this.profile_pic,
    this.crm_category,
    this.remember_token,
    this.remember_token_time
  });

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bio = json['bio'];
    email = json['email'];
//     mobile = json['mobile'];
    status = json['status'];
    address = json['address'];
    isdefault = json['isdefault'];
    if(json['children'] != null) {
      children = <Children> [];
      json['children'].forEach((v){
        children !.add(Children.fromJson(v));
      });
    }
    password = json['password'];
    tracking = json['tracking'];
    device_id = json['device_id'];
    last_name = json['last_name'];
    created_at = json['created_at'];
    first_name = json['first_name'];
    updated_at = json['updated_at'];
    profile_pic = json['profile_pic'];
    crm_category = json['crm_category'];
    remember_token = json['remember_token'];
    remember_token_time = json['remember_token_time'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['bio'] = bio;
    data['email'] = email;
    data['mobile'] = mobile;
    data['status'] = status;
    data['address'] = address;
    data['isdefault'] = isdefault;
    if(children != null) {
      data['children'] = children !. map((v) => toJson()). toList();
    }
    data['password'] = password;
    data['tracking'] = tracking;
    data['device_id'] = device_id;
    data['last_name'] = last_name;
    data['created_at'] = created_at;
    data['first_name'] = first_name;
    data['updated_at'] = updated_at;
    data['profile_pic'] = profile_pic;
    data['crm_category'] = crm_category;
    data['remember_token'] = remember_token;
    data['remember_token_time'] = remember_token_time;
    return data;
  }
}

class Members {
  String? id;
  int? sale_target;
  String? created_at;
  String? updated_at;
  List<AchieveBreakdown>? achieve_breakdown;

  Members({
    this.id,
    this.sale_target,
    this.created_at,
    this.updated_at,
    this.achieve_breakdown
  });

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sale_target = json['sale_target'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    if(achieve_breakdown != null) {
      achieve_breakdown = <AchieveBreakdown> [];
      json['achieve_breakdown'].forEach((v){
        achieve_breakdown !. add(AchieveBreakdown.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['sale_target'] = sale_target;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    if(achieve_breakdown != null) {
      data['achieve_breakdown'] = achieve_breakdown !.map((v) => toJson()).toList();
    }
    return data;
  }
}

class AchieveBreakdown {
  String? id;
  int? achieve_percentage;
  int? incentive;
  String? incentive_type;
  String? created_at;
  String? updated_at;

  AchieveBreakdown({
    this.id,
    this.achieve_percentage,
    this.incentive,
    this.created_at,
    this.updated_at
  });

  AchieveBreakdown.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    achieve_percentage = json['achieve_percentage'];
    incentive = json['incentive'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    incentive_type = json['incentive_type'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['achieve_percentage'] = achieve_percentage;
    data['incentive'] = incentive;
    data['incentive_type'] = incentive_type;
    data['updated_at'] = updated_at;
    data['created_at'] = created_at;
    return data;
  }

}
class Product {
  String? id;
  String? name;

  Product({
    this.name,
    this.id
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
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