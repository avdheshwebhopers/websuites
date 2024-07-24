import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../Data/repositories/repositories.dart';
import '../../../Utils/utils.dart';

class UserlistViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;


  Future<void>UserList(BuildContext, context)async{
    loading.value = true;

    _api.UserlistApi().then((value){

      if(value.id != null){
      Utils.SnackbarSuccess('Id fetched');
      loading.value = false;

      }else{
        Utils.SnackbarFailed('ID not fetched');
      }

    }).onError((error, stackTrace) {
      if (kDebugMode){
        print(error.toString());
      }
    });

  }
}

// class UserlistViewModel extends GetxController {
//   final _api = LoginRepository();
//   RxBool loading = false.obs;
//
//   UserlistRequestModel data = UserlistRequestModel();
//
//   Future<void> UserListApi() async {
//     loading.value = true;
//     try {
//       final value = await _api.UserlistApi(data);
//
//       if (value.id != null) {
//
//         Utils.SnackbarSuccess('Id fetched');
//       } else {
//         Utils.SnackbarFailed('ID not fetched');
//       }
//
//       loading.value = false;
//     } catch (error, stackTrace) {
//       if (kDebugMode) {
//         print(error.toString());
//       }
//     }
//   }
// }
