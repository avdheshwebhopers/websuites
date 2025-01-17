class AddMasterProposalRequestModel {
  String? subject;
  String? body;
  String? attachment;

  AddMasterProposalRequestModel({this.subject, this.body, this.attachment});

  AddMasterProposalRequestModel.fromJson(Map<String, dynamic> json) {
    subject = json['subject'];
    body = json['body'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject'] = this.subject;
    data['body'] = this.body;
    data['attachment'] = this.attachment;
    return data;
  }
}
