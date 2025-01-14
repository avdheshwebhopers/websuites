class RoleListEditRequestModel {
  String? name;
  String? description;

  RoleListEditRequestModel({this.name, this.description});

  RoleListEditRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}