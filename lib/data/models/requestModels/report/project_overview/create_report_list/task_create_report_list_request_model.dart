class CreateReportListRequestModel {
  final String? title;
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? project;
  final List<String>? ccTo;

  CreateReportListRequestModel({
    this.title,
    this.description,
    this.startDate,
    this.endDate,
    this.project,
    this.ccTo,
  });

  // Convert a RequestModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'start_date': startDate?.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'project': project,
      'cc_to': ccTo,
    };
  }

  // Create a RequestModel instance from a JSON map
  factory CreateReportListRequestModel.fromJson(Map<String, dynamic> json) {
    return CreateReportListRequestModel(
      title: json['title'],
      description: json['description'],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate:
      json['end_date'] != null ? DateTime.parse(json['end_date']) : null,
      project: json['project'],
      ccTo: (json['cc_to'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }
}