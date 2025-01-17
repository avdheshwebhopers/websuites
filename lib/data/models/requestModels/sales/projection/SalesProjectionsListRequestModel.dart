class SalesProjectionsListRequestModel {
  SalesProjectionsListRequestModel({
    required this.createdBy,
    required this.status,
    required this.dateRange,
    required this.isOpen,
    required this.productCategory,
  });

  final String? createdBy;
  final String? status;
  final String? dateRange;
  final bool? isOpen;
  final String? productCategory;

  Map<String, dynamic> toJson() {
    return {
      'created_by': createdBy,
      'status': status,
      'date_range': dateRange,
      'isOpen': isOpen,
      'product_category': productCategory,
    };
  }
}
