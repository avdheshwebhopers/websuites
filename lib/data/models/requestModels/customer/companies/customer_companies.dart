class CustomerCompaniesRequestModel {
  CustomerCompaniesRequestModel({
    required this.limit,
    required this.page,
  });

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'page': page,
    };
  }
}
