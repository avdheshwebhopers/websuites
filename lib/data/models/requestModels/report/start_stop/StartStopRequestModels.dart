class StartStopRequestModels {
  String? task;
  String? type;

  StartStopRequestModels({this.task, this.type});

  StartStopRequestModels.fromJson(Map<String, dynamic> json) {
    task = json['task'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['task'] = this.task;
    data['type'] = this.type;
    return data;
  }
}
