class CitySearchRequestModel {
  final String search;

  CitySearchRequestModel({required this.search});
  // Convert the model to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'search': search,
    };
  }

  // Factory method to create an instance from JSON if needed
  factory CitySearchRequestModel.fromJson(Map<String, dynamic> json) {
    return CitySearchRequestModel(
      search: json['search'],
    );
  }
}
