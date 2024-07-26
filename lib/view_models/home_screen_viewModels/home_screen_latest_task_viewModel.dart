
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';



import '../../../Data/models/Response_model/Dashboard_Screen/DB_latestTask_ResponseModel.dart';
import '../../../Data/repositories/repositories.dart';

class HomeScreenLatestTaskViewModel extends GetxController {
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
