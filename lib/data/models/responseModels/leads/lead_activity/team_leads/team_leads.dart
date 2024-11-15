class LeadActivityTeamLeadResponseModel {
  User? user;
  List<String>? leadType;  // Changed from List<Null> to List<String>
  int? total;

  LeadActivityTeamLeadResponseModel({this.user, this.leadType, this.total});

  LeadActivityTeamLeadResponseModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;

    // If lead_type exists in the JSON, make sure it's a List<String> instead of List<Null>
    if (json['lead_type'] != null) {
      leadType = List<String>.from(json['lead_type'].map((v) => v.toString())); // Ensures leadType is a list of strings
    }

    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (leadType != null) {
      data['lead_type'] = leadType;  // No need to map since leadType is already List<String>
    }
    data['total'] = total;
    return data;
  }

  static List<LeadActivityTeamLeadResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => LeadActivityTeamLeadResponseModel.fromJson(json)).toList();
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
