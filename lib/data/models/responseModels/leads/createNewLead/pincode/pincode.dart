class PinCodeModelResponseModel {
  String? id;
  String? code;
  District? district;

  PinCodeModelResponseModel({this.id, this.code, this.district});

  PinCodeModelResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    if (district != null) {
      data['district'] = district!.toJson();
    }
    return data;
  }
}

class District {
  String? id;
  String? name;
  State? state;

  District({this.id, this.name, this.state});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'] != null ? State.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (state != null) {
      data['state'] = state!.toJson();
    }
    return data;
  }
}

class State {
  String? id;
  String? name;
  Country? country;

  State({this.id, this.name, this.country});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}

class Country {
  String? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
