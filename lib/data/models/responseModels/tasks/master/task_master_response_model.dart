class TaskMasterResponseModel {
  String? id;
  String? name;
  bool? status;
  String? created_at;
  String? updated_at;

  TaskMasterResponseModel ({
    this.id,
    this.name,
    this.status,
    this.created_at,
    this.updated_at
});

  TaskMasterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}