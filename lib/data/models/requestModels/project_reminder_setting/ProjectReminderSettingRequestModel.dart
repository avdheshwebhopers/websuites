class ProjectReminderSetting {
  List<Dates>? dates;
  String? project;
  List<String>? users;

  ProjectReminderSetting({this.dates, this.project, this.users});

  ProjectReminderSetting.fromJson(Map<String, dynamic> json) {
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    project = json['project'];
    users = json['users'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['project'] = this.project;
    data['users'] = this.users;
    return data;
  }
}

class Dates {
  String? day;
  String? month;

  Dates({this.day, this.month});

  Dates.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['month'] = this.month;
    return data;
  }
}
