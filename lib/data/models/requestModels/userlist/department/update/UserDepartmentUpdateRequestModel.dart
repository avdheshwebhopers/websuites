class UserDepartmentUpdateRequestModel {
  String? name;
  String? description;

  UserDepartmentUpdateRequestModel({this.name, this.description});

  UserDepartmentUpdateRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}
