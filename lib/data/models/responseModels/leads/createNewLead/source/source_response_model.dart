class SourceResponseModel {
  String? id;
  String? name;
  String? status;
  String? createdAt;

  SourceResponseModel({
    this.id,
    this.name,
    this.status,
    this.createdAt
  });

  SourceResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}