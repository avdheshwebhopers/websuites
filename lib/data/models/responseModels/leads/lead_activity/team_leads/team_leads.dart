class LeadActivityTeamLeadResponseModel {
  User? user;
  List<Null>? leadType;
  int? total;

  LeadActivityTeamLeadResponseModel({this.user, this.leadType, this.total});

  LeadActivityTeamLeadResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['lead_type'] != null) {
      leadType = <Null>[];
      json['lead_type'].forEach((v) {
        leadType!.add((v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (leadType != null) {
      data['lead_type'] = leadType!.map((v) => v).toList();
    }
    data['total'] = total;
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;

  User({this.id, this.firstName, this.lastName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    return data;
  }
}