class LeadDetailAttachmentListResponseModel {
  String? id;
  String? type;
  String? filename;
  String? typeName;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  UploadedBy? uploadedBy;

  LeadDetailAttachmentListResponseModel(
      {this.id,
        this.type,
        this.filename,
        this.typeName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.uploadedBy});

  LeadDetailAttachmentListResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    filename = json['filename'];
    typeName = json['type_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    uploadedBy = json['uploaded_by'] != null
        ? new UploadedBy.fromJson(json['uploaded_by'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['filename'] = this.filename;
    data['type_name'] = this.typeName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.uploadedBy != null) {
      data['uploaded_by'] = this.uploadedBy!.toJson();
    }
    return data;
  }
  static List<LeadDetailAttachmentListResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadDetailAttachmentListResponseModel.fromJson(json)).toList();
  }
}

class UploadedBy {
  String? id;
  String? firstName;
  String? lastName;

  UploadedBy({this.id, this.firstName, this.lastName});

  UploadedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}