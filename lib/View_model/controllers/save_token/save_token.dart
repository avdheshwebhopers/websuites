
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/Response_model/LoginResponseModel.dart';


class SaveToken {

  Future<bool> saveToken(String user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('accessToken', user.toString());
    return true;
  }


  Future<LoginResponseModel> getToken() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('accessToken');
    final String? name = sp.getString('first_name');
    final String? lastname = sp.getString('last_name');
    final String? id = sp.getString('id');
    final bool? isOwner = sp.getBool('is_admin');
    return LoginResponseModel(
    accessToken: token.toString(),
        user: User(
          firstName: name.toString(),
          lastName: lastname.toString(),
          id: id.toString(),
          isAdmin: isOwner,
        ));
  }


  Future<bool> removeToken()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}



// class SaveToken {
//
//   Future<void> saveToken(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('token', token);
//     //print(token);
//   }
//
//   Future<String?> getToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }
//
//   Future<void> deleteToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('token');
//   }
// }

// class UserViewModel{
//
//   Future<bool> saveUser(LoginResponseModel user)async{
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('accessToken', user.accessToken.toString());
//     sp.setString('first_name', user.user!.firstName.toString());
//     sp.setString('last_name', user.user!.lastName.toString());
//     sp.setString('id', user.user!.id.toString());
//     sp.setBool('is_admin', user.user!.isAdmin ?? false); // Ensure a default value if it can be null
//     return true;
//   }
//
//   Future<LoginResponseModel> getUser()async{
//
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     final String? token = sp.getString('accessToken');
//     final String? name = sp.getString('first_name');
//     final String? lastname = sp.getString('last_name');
//     final String? id = sp.getString('id');
//     final bool? isOwner = sp.getBool('is_admin');
//
//     return LoginResponseModel(
//         accessToken : token.toString(),
//         user: User(
//           firstName: name.toString(),
//           lastName: lastname.toString(),
//           id: id.toString(),
//           isAdmin: isOwner,
//         ));
//   }
//
//   Future<bool> remove()async{
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.remove('accessToken');
//     return true;
//   }
// }

