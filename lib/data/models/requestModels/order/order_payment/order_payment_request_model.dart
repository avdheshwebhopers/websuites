class OrderPaymentRequestModel {
  String? createdBy;
  String? customerId;
  DateRange? dateRange;
  String? divisionId;
  int limit;
  int page;
  String? paymentMode;
  String? paymentType;
  String? product;
  String search;
  String? status;

  OrderPaymentRequestModel({
    this.createdBy,
    this.customerId,
    this.dateRange,
    this.divisionId,
    required this.limit,
    required this.page,
    this.paymentMode,
    this.paymentType,
    this.product,
    this.search = "",
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'created_by': createdBy,
      'customerId': customerId,
      'date_range': dateRange?.toJson(),
      'divisionId': divisionId,
      'limit': limit,
      'page': page,
      'payment_mode': paymentMode,
      'payment_type': paymentType,
      'product': product,
      'search': search,
      'status': status,
    };
  }
}

class DateRange {
  String from;
  String to;

  DateRange({required this.from, required this.to});

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
