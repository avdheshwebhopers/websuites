class RolesResponseModel {
  RolesResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rolesResponseModelDefault,
    required this.users,
  });

  final String? id;
  final String? name;
  final String? description;
  final bool? rolesResponseModelDefault;
  final List<User> users;

  factory RolesResponseModel.fromJson(Map<String, dynamic> json){
    return RolesResponseModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      rolesResponseModelDefault: json["default"],
      users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    );
  }

}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  final String? id;
  final String? firstName;
  final String? lastName;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
    );
  }

}
