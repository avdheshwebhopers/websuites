class AddTaskTypeResponseModel {
  String? name;
  String? id;
  bool? status;
  String? createdAt;
  String? updatedAt;

  AddTaskTypeResponseModel(
      {this.name, this.id, this.status, this.createdAt, this.updatedAt});

  AddTaskTypeResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}