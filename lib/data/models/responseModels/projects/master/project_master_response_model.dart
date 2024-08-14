class ProjectsMasterResponseModel {
  String? id;
  String? name;
  bool? status;
  String? created_at;
  String? updated_at;

  ProjectsMasterResponseModel ({
    this.id,
    this.name,
    this.status,
    this.updated_at,
    this.created_at
});

  ProjectsMasterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson () {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['updated_at'] = updated_at;
    data['created_at'] = created_at;
    return data;
  }
}