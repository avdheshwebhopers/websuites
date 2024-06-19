import '../../../resources/app_urls.dart';
import '../../models/loginResponseModel/login_response_model.dart';

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