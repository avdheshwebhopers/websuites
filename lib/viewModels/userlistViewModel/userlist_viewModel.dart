import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Utils/utils.dart';
import '../../data/repositories/repositories.dart';

class UserListViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> userList(context)async{
    loading.value = true;

    _api.userListApi().then((value){

      if(value.id != null){
        print(value.id);
      Utils.snackbarSuccess('Id fetched');
      loading.value = false;

      }else{
        Utils.snackbarFailed('ID not fetched');
      }

    }).onError((error, stackTrace) {
      if (kDebugMode){
        print(error.toString());
      }
    }
    );
  }
}