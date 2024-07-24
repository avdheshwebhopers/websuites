

// class DbLatestTaskViewModel extends GetxController{
//   final _api = Repositories();
//   // RxBool Loading = false.obs;
//
//   final Db_latestTaskModel = DbLatestTaskResponseModel().obs;
//   final rxLoginStatus = Status.LOADING.obs;
//
//
//   void setRxStatus (Status _value) =>  rxLoginStatus.value = _value;
//   void setLatestTask (DbLatestTaskResponseModel _value) =>  Db_latestTaskModel.value = _value;
//
//
//   Future <void> DBLatestTask(context) async {
//     // Loading.value = true;
//     // Dashboard_Leads_By_Type_Count_Request_Model data = Dashboard_Leads_By_Type_Count_Request_Model();
//
//     _api.DB_LatestTaskApi().then((value) {
//       setRxStatus(Status.COMPLETED);
//       setLatestTask(value);
//       // if(value.items!= null){
//       //   Utils.SnackbarSuccess('latestTask fetched');
//       // }else{
//       //   Utils.SnackbarFailed('latestTask not fetched');
//       // }
//
//       // Loading.value = false;
//     }).onError((error, stackTrace){
//       setRxStatus(Status.ERROR);
//       if (kDebugMode){
//         print(error.toString());
//       }
//     });
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



import '../../../Data/models/Response_model/Dashboard_Screen/DB_latestTask_ResponseModel.dart';
import '../../../Data/repositories/repositories.dart';

class DbLatestTaskViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;


  final LatestTaskModel = DbLatestTaskResponseModel().obs;
  //final rxStatus = Status.LOADING.obs;

  //void setRxStatus (Status _value) =>  rxStatus.value = _value;
  void setLatestTask (DbLatestTaskResponseModel _value) => LatestTaskModel.value = _value;


  Future<void> Db_LatestTask(BuildContext, context) async {
    loading.value = true;


    _api.DB_LatestTaskApi().then((value) {
      // setRxStatus(Status.COMPLETED);
      setLatestTask(value);
      loading.value = false;

    }).onError((error, stackTrace) {
      // setRxStatus(Status.ERROR);
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }
}
