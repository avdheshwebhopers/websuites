class MasterCustomizeTypeResponseModel {
  String? displayName;
  String? aliasName;

  MasterCustomizeTypeResponseModel({this.displayName, this.aliasName});

  MasterCustomizeTypeResponseModel.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    aliasName = json['alias_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['alias_name'] = this.aliasName;
    return data;
  }
  static List<MasterCustomizeTypeResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MasterCustomizeTypeResponseModel.fromJson(json)).toList();
  }

}