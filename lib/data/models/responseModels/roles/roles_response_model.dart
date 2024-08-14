class RolesResponseModel {
  String? id;
  String? name;
  String? description;
  bool? isdefault;
  List<Users>? users;

  RolesResponseModel({
    this.id,
    this.name,
    this.description,
    this.isdefault,
    this.users
});

  RolesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isdefault = json['isdefault'];
    if(json['users'] != users) {
      users = <Users> [];
      json['users'].forEach((v) {
        users !. add(Users.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['isdefault'] = isdefault;
    if(users != null){
      data['users'] = users !.map((v) => toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? id;
  String? first_name;
  String? last_name;

  Users({
    this.id,
    this.first_name,
    this.last_name
});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    return data;
  }
}