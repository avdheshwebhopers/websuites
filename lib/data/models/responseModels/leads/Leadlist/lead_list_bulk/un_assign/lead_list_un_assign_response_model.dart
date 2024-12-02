class LeadListBulkUnAssignResponseModel {
  String? data;
  bool? success;

  LeadListBulkUnAssignResponseModel({this.data, this.success});

  LeadListBulkUnAssignResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['success'] = this.success;
    return data;
  }
}