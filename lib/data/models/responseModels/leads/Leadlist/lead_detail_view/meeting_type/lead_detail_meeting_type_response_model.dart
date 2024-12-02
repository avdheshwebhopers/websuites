class LeadDetailMeetingTypeResponseModel {
  String? id;
  String? type;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LeadDetailMeetingTypeResponseModel(
      {this.id,
        this.type,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  LeadDetailMeetingTypeResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }

  static List<LeadDetailMeetingTypeResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadDetailMeetingTypeResponseModel.fromJson(json)).toList();
  }
}