import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Utils/Utils.dart';
import '../../../data/repository/Repositories.dart';

class DbLatestTaskViewModel extends GetxController{
  final _api = Repositories();
  RxBool Loading = false.obs;


  Future <void> DBLatestTask(context) async {
    Loading.value = true;

    // Dashboard_Leads_By_Type_Count_Request_Model data = Dashboard_Leads_By_Type_Count_Request_Model();

    _api.DB_LatestTaskApi().then((value) {



      if(value.items!= null){
        Utils.SnackbarSuccess('latestTask fetched');
      }else{
        Utils.SnackbarFailed('latestTask not fetched');
      }
      Loading.value = false;
    }).onError((error, stackTrace){
      if (kDebugMode){
        print(error.toString());
      }
    });

  }
}