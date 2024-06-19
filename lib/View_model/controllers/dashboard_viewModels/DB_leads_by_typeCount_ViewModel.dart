import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Utils/Utils.dart';
import '../../../data/repository/Repositories.dart';

class DashboardLeadsByTypeCountViewModel extends GetxController{
  final _api = Repositories();
  RxBool Loading = false.obs;


  Future <void> DBLeadsByTypeCount(context) async {
    Loading.value = true;

    // Dashboard_Leads_By_Type_Count_Request_Model data = Dashboard_Leads_By_Type_Count_Request_Model();

    _api.DB_LeadsTypeCountApi().then((value) {



      if(value.id!= null){
        Utils.SnackbarSuccess('Id leadByCount');
      }else{
        Utils.SnackbarFailed('ID leadByCount');
      }
      Loading.value = false;
    }).onError((error, stackTrace){
      if (kDebugMode){
        print(error.toString());
      }
    });

  }
}