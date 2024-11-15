class DeleteListRequestModel {
  final int page;
  final int limit;
  final String? search;

  const DeleteListRequestModel({
    this.page = 1,
    this.limit = 15,
    this.search,
  });

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    if (search != null) 'search': search,
  };
}