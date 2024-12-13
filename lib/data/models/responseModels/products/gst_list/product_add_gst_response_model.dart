class AddGstResponseModel {
  int? status;
  int? igst;
  int? cgst;
  int? sgst;
  String? name;
  String? id;
  String? createdAt;
  String? updatedAt;

  AddGstResponseModel(
      {this.status,
        this.igst,
        this.cgst,
        this.sgst,
        this.name,
        this.id,
        this.createdAt,
        this.updatedAt});

  AddGstResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    igst = json['igst'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    name = json['name'];
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['igst'] = this.igst;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    data['name'] = this.name;
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}