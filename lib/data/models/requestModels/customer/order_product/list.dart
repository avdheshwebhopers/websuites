class OrderProductServiceRequestModel {
  OrderProductServiceRequestModel({
    required this.range,
    required this.assignedTo,
    required this.search,
    required this.limit,
    required this.page,
    required this.customerId,
  });

  final dynamic range;
  final String? assignedTo;
  final String? search;
  final int? limit;
  final int? page;
  final String? customerId;

  factory OrderProductServiceRequestModel.fromJson(Map<String, dynamic> json){
    return OrderProductServiceRequestModel(
      range: json["range"],
      assignedTo: json["assigned_to"],
      search: json["search"],
      limit: json["limit"],
      page: json["page"],
      customerId: json["customer_id"],
    );
  }

}
