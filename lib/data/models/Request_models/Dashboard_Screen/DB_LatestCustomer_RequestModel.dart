import '../../Response_model/LoginResponseModel.dart';

class DbLatestCustomerRequestModel{
  List<Items>? items;
  Meta? meta;
  Null user_key;


  DbLatestCustomerRequestModel({
    this.items,
    this.meta,
    this.user_key
  });

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    if(items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if(meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['user_key'] = user_key;
    return data;
  }
}
class Items {
  String? id;
  String? company_name;
  String? first_name;
  String? last_name;
  String? primary_email;
  int? country_code;
  int? primary_contact;
  String? organization;
  String? primary_address;
  Null profile_image;
  String? dob;
  String? about_client;
  String? other_information;
  int? lat;
  int? lng;
  String? created_at;
  String? updated_at;
  String? deleted_at;
  String? deleted_remark;
  String? zoho_contact_id;
  List<Companies>? companies;
  List<CustomerAssigned>? customer_assigned;

  Items({
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
    this.deleted_at,
    this.deleted_remark,
    this.zoho_contact_id,
    this.companies,
    this.customer_assigned,
});

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['company_name'] = company_name;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['primary_email'] = primary_email;
    data['country_code'] = country_code;
    data['primary_contact'] = primary_contact;
    data['organization'] = organization;
    data['primary_address'] = primary_address;
    data['profile_image'] = profile_image;
    data['dob'] = dob;
    data['about_client'] = about_client;
    data['other_information'] = other_information;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    data['deleted_remark'] = deleted_remark;
    data['zoho_contact_id'] = zoho_contact_id;
    if(companies != null) {
      data['companies'] = companies !.map((v) => v.toJson()).toList();
    }
    if(customer_assigned != null) {
      data['customer_assigned'] = customer_assigned !.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies{
  String? id;
  String? company_name;

  Companies({
    this.id,
    this.company_name,
});

  Map<String,dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = company_name;
    return data;
  }
}

class CustomerAssigned{
  String? id;
  int? status;
  String? created_at;
  List<User>? user;

  CustomerAssigned({
    this.id,
    this.status,
    this.created_at,
    this.user
});

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['status'] = status;
    data['created_at'] = created_at;
    if(user != null) {
      data['user'] = user !.map((v) => v.toJson()).toList();
    }
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

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['currentPage'] = currentPage;
    data['itemsPerPage'] = itemsPerPage;
    data['totalPages'] = totalPages;
    data['totalItems'] = totalItems;
    data['itemCount'] = itemCount;
    return data;
  }


}









