class HrmAttendanceResponseModel{
  String? id;
  String? date;
  String? name;
  String? startTime;
  String? endTime;
  String? created_at;
  String? updated_at;

  HrmAttendanceResponseModel({
    this.id,
    this.date,
    this.name,
    this.startTime,
    this.created_at,
    this.endTime,
    this.updated_at
  });

  HrmAttendanceResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    name = json['name'];
    startTime = json['startTime'];
    created_at = json['created_at'];
    endTime = json['endTime'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson (){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['name'] = name;
    data['startTime'] = startTime;
    data['created_at'] = created_at;
    data['endTime'] = endTime;
    data['updated_at'] = updated_at;
    return data;
  }
}