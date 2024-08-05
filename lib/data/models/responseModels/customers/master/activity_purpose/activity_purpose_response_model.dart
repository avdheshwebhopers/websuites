class ActivityPurposeResponseModel {
  String? id;
  String? type;
  String? name;
  bool? status;
  String? created_at;
  String? updated_at;
  String? deleted_at;

  ActivityPurposeResponseModel({
    this.id,
    this.type,
    this.name,
    this.status,
    this.created_at,
    this.updated_at,
    this.deleted_at
});

  ActivityPurposeResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    deleted_at = json['deleted_at'];
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['deleted_at'] = deleted_at;
    return data;
  }
}