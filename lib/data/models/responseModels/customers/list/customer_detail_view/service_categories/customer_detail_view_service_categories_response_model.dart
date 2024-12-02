class CustomerListServiceCategoriesResponseModel {
  String? image;
  String? category;
  String? product;
  String? categoryId;
  String? productId;

  CustomerListServiceCategoriesResponseModel(
      {this.image,
        this.category,
        this.product,
        this.categoryId,
        this.productId});

  CustomerListServiceCategoriesResponseModel.fromJson(
      Map<String, dynamic> json) {
    image = json['image'];
    category = json['category'];
    product = json['product'];
    categoryId = json['categoryId'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['category'] = this.category;
    data['product'] = this.product;
    data['categoryId'] = this.categoryId;
    data['productId'] = this.productId;
    return data;
  }
  static List<CustomerListServiceCategoriesResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => CustomerListServiceCategoriesResponseModel.fromJson(json)).toList();
  }
}