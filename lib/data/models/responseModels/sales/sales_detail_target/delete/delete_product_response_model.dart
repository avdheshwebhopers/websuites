class DeleteProductResponseModel {
  List<Null>? raw;
  int? affected;

  DeleteProductResponseModel({this.raw, this.affected});

  DeleteProductResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['raw'] != null) {
      raw = <Null>[];
      json['raw'].forEach((v) {
        raw!.add((v));
      });
    }
    affected = json['affected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.raw != null) {
      data['raw'] = this.raw!.map((v) => ()).toList();
    }
    data['affected'] = this.affected;
    return data;
  }
}