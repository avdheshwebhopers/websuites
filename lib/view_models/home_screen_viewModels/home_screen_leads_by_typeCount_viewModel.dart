import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Data/models/Response_model/Dashboard_Screen/DB_lead_by_type_Count_ResponseModel.dart';
import '../../../Data/repositories/repositories.dart';
import '../../../Data/response/status.dart';

class HomeScreenLeadsByTypeCountViewModel extends GetxController{
  final _api = Repositories();
  // RxBool Loading = false.obs;
  final rxStatus = Status.LOADING.obs;
  final Db_LeadTypeCountModel = Dashboard_Leads_By_Type_Count_Response_Model().obs;
  RxString error = ''.obs;


  void setLeadTypeCount (Dashboard_Leads_By_Type_Count_Response_Model _value) => Db_LeadTypeCountModel.value = _value;
  void setRxStatus (Status _value) =>  rxStatus.value = _value;
  void setError (String _value) =>  error.value = _value;




  Future <void> DBLeadsByTypeCount(context) async {
    // Loading.value = true;
    setRxStatus(Status.LOADING);

    _api.DB_LeadsTypeCountApi().then((value) {
      setLeadTypeCount(value);
      // if(value.id!= null){
      //   Utils.SnackbarSuccess('Id leadByCount');
      // }else{
      //   Utils.SnackbarFailed('ID leadByCount');
      // }
      // Loading.value = false;
      setRxStatus(Status.COMPLETED);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxStatus(Status.ERROR);
      if (kDebugMode){
        print(error.toString());
      }
    });

  }
}