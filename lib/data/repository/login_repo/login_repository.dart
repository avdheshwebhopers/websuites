class LoginRepository{
  Future<LoginResponseModel> login(dynamic data) async {
    try{
      dynamic response =  await apiServices.postApiResponse(AppUrls.login, data);
      return response = LoginResponseModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
}