class ProjectOverViewResponseModel {
  Project? project;
  SendEmailDetail? sendEmailDetail;
  List<Null>? users;
  Tasks? tasks;
  Null? sentActivation;

  ProjectOverViewResponseModel(
      {this.project,
        this.sendEmailDetail,
        this.users,
        this.tasks,
        this.sentActivation});

  ProjectOverViewResponseModel.fromJson(Map<String, dynamic> json) {
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    sendEmailDetail = json['sendEmailDetail'] != null
        ? new SendEmailDetail.fromJson(json['sendEmailDetail'])
        : null;
    if (json['users'] != null) {
      users = <Null>[];
      json['users'].forEach((v) {
        users!.add((v));
      });
    }
    tasks = json['tasks'] != null ? new Tasks.fromJson(json['tasks']) : null;
    sentActivation = json['sentActivation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.sendEmailDetail != null) {
      data['sendEmailDetail'] = this.sendEmailDetail!.toJson();
    }
    if (this.users != null) {
      data['users'] = this.users!.map((v) =>()).toList();
    }
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.toJson();
    }
    data['sentActivation'] = this.sentActivation;
    return data;
  }
}

class Project {
  String? id;
  String? projectName;
  String? billingType;
  String? status;
  int? totalRate;
  int? estimatedHours;
  String? startDate;
  Null? deadline;
  String? description;
  Null? demoUrl;
  Null? finishDate;
  Null? liveUrl;
  String? createdAt;
  String? updatedAt;
  Customer? customer;
  List<Members>? members;
  Company? company;
  List<Tags>? tags;
  List<Null>? projectReportReminders;
  List<Null>? projectReport;

  Project(
      {this.id,
        this.projectName,
        this.billingType,
        this.status,
        this.totalRate,
        this.estimatedHours,
        this.startDate,
        this.deadline,
        this.description,
        this.demoUrl,
        this.finishDate,
        this.liveUrl,
        this.createdAt,
        this.updatedAt,
        this.customer,
        this.members,
        this.company,
        this.tags,
        this.projectReportReminders,
        this.projectReport});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectName = json['project_name'];
    billingType = json['billing_type'];
    status = json['status'];
    totalRate = json['total_rate'];
    estimatedHours = json['estimated_hours'];
    startDate = json['start_date'];
    deadline = json['deadline'];
    description = json['description'];
    demoUrl = json['demo_url'];
    finishDate = json['finish_date'];
    liveUrl = json['live_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    if (json['members'] != null) {
      members = <Members>[];
      json['members'].forEach((v) {
        members!.add(new Members.fromJson(v));
      });
    }
    company =
    json['company'] != null ? new Company.fromJson(json['company']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    if (json['project_report_reminders'] != null) {
      projectReportReminders = <Null>[];
      json['project_report_reminders'].forEach((v) {
        projectReportReminders!.add((v));
      });
    }
    if (json['project_report'] != null) {
      projectReport = <Null>[];
      json['project_report'].forEach((v) {
        projectReport!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_name'] = this.projectName;
    data['billing_type'] = this.billingType;
    data['status'] = this.status;
    data['total_rate'] = this.totalRate;
    data['estimated_hours'] = this.estimatedHours;
    data['start_date'] = this.startDate;
    data['deadline'] = this.deadline;
    data['description'] = this.description;
    data['demo_url'] = this.demoUrl;
    data['finish_date'] = this.finishDate;
    data['live_url'] = this.liveUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.members != null) {
      data['members'] = this.members!.map((v) => v.toJson()).toList();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.projectReportReminders != null) {
      data['project_report_reminders'] =
          this.projectReportReminders!.map((v) => ()).toList();
    }
    if (this.projectReport != null) {
      data['project_report'] =
          this.projectReport!.map((v) => ()).toList();
    }
    return data;
  }
}

class Customer {
  String? id;
  String? firstName;
  String? lastName;

  Customer({this.id, this.firstName, this.lastName});

  Customer.fromJson(Map<String, dynamic> json) {
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

class Members {
  String? id;
  String? firstName;
  String? lastName;
  String? profilePic;

  Members({this.id, this.firstName, this.lastName, this.profilePic});

  Members.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_pic'] = this.profilePic;
    return data;
  }
}

class Company {
  String? id;
  String? companyName;
  String? companyEmail;
  String? companyPhone;
  int? countryCode;
  String? contactPersonName;
  String? contactPersonNumber;
  int? cCountryCode;
  Null? website;
  Null? logo;

  Company(
      {this.id,
        this.companyName,
        this.companyEmail,
        this.companyPhone,
        this.countryCode,
        this.contactPersonName,
        this.contactPersonNumber,
        this.cCountryCode,
        this.website,
        this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    companyEmail = json['company_email'];
    companyPhone = json['company_phone'];
    countryCode = json['country_code'];
    contactPersonName = json['contact_person_name'];
    contactPersonNumber = json['contact_person_number'];
    cCountryCode = json['c_country_code'];
    website = json['website'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_name'] = this.companyName;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['country_code'] = this.countryCode;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_number'] = this.contactPersonNumber;
    data['c_country_code'] = this.cCountryCode;
    data['website'] = this.website;
    data['logo'] = this.logo;
    return data;
  }
}

class Tags {
  String? id;
  String? name;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Tags({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SendEmailDetail {
  List<String>? ccto;

  SendEmailDetail({this.ccto});

  SendEmailDetail.fromJson(Map<String, dynamic> json) {
    ccto = json['ccto'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ccto'] = this.ccto;
    return data;
  }
}

class Tasks {
  List<Standard>? standard;
  Others? others;

  Tasks({this.standard, this.others});

  Tasks.fromJson(Map<String, dynamic> json) {
    if (json['standard'] != null) {
      standard = <Standard>[];
      json['standard'].forEach((v) {
        standard!.add(new Standard.fromJson(v));
      });
    }
    others =
    json['others'] != null ? new Others.fromJson(json['others']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.standard != null) {
      data['standard'] = this.standard!.map((v) => v.toJson()).toList();
    }
    if (this.others != null) {
      data['others'] = this.others!.toJson();
    }
    return data;
  }
}

class Standard {
  String? statusId;
  String? statusName;
  String? statusReference;
  String? statusColor;
  String? tasks;

  Standard(
      {this.statusId,
        this.statusName,
        this.statusReference,
        this.statusColor,
        this.tasks});

  Standard.fromJson(Map<String, dynamic> json) {
    statusId = json['status_id'];
    statusName = json['status_name'];
    statusReference = json['status_reference'];
    statusColor = json['status_color'];
    tasks = json['tasks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_id'] = this.statusId;
    data['status_name'] = this.statusName;
    data['status_reference'] = this.statusReference;
    data['status_color'] = this.statusColor;
    data['tasks'] = this.tasks;
    return data;
  }
}

class Others {
  int? count;
  List<Tasks>? tasks;


  Others({this.count, this.tasks});
  Others.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(new Tasks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.tasks != null) {
      data['tasks'] = this.tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}