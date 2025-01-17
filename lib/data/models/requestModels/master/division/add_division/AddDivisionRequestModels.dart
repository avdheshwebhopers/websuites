class AddDivisionRequestModels {
  String? name;
  String? mobileNo;
  String? contactPerson;
  String? email;
  String? address;
  String? logo;

  AddDivisionRequestModels(
      {this.name,
        this.mobileNo,
        this.contactPerson,
        this.email,
        this.address,
        this.logo});

  AddDivisionRequestModels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNo = json['mobile_no'];
    contactPerson = json['contact_person'];
    email = json['email'];
    address = json['address'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobile_no'] = this.mobileNo;
    data['contact_person'] = this.contactPerson;
    data['email'] = this.email;
    data['address'] = this.address;
    data['logo'] = this.logo;
    return data;
  }
}
