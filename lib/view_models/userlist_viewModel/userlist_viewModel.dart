import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Data/repositories/repositories.dart';
import '../../../Utils/utils.dart';

class UserListViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> userList(context)async{
    loading.value = true;

    _api.userListApi().then((value){

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
    }
    );
  }
}