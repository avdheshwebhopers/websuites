class LeadDetailProposalResponseModel {
  String? id;
  String? subject;
  String? body;
  String? attachment;
  bool? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  LeadDetailProposalResponseModel(
      {this.id,
        this.subject,
        this.body,
        this.attachment,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  LeadDetailProposalResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    body = json['body'];
    attachment = json['attachment'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['body'] = this.body;
    data['attachment'] = this.attachment;
    data['status'] = status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
  static List<LeadDetailProposalResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadDetailProposalResponseModel.fromJson(json)).toList();
  }

}