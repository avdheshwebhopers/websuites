
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/responseModels/login/login_response_model.dart';




class SaveUserData {

  Future<LoginResponseModel> saveUser(String token, first_name, email) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('accessToken', token);
    await sp.setString('first_name', first_name);
    await sp.setString('email', email);
    return LoginResponseModel();
  }


  Future<LoginResponseModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('accessToken').toString();
    String? first_name = sp.getString('first_name').toString();
    String? email = sp.getString('email').toString();
    return LoginResponseModel(
    accessToken: token.toString(),
        user: User(
          first_name: first_name.toString(),
          email: email.toString(),
        ));
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}



