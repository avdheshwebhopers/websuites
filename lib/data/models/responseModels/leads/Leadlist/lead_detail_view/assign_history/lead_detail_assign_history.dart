class LeadDetailAssignHistoryResponseModel {
  String? id;
  int? status;
  String? createdAt;
  User? user;
  dynamic assignedBy;
  Department? department;

  LeadDetailAssignHistoryResponseModel(
      {this.id,
        this.status,
        this.createdAt,
        this.user,
        this.assignedBy,
        this.department});

  LeadDetailAssignHistoryResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['created_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    assignedBy = json['assigned_by'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['assigned_by'] = this.assignedBy;
    if (this.department != null) {
      data['department'] = this.department!.toJson();
    }
    return data;
  }
  static List<LeadDetailAssignHistoryResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) =>LeadDetailAssignHistoryResponseModel.fromJson(json)).toList();
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;

  User({this.id, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
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

class Department {
  String? id;
  String? name;

  Department({this.id, this.name});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }


}