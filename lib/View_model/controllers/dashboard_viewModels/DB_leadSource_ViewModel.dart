import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../Utils/Utils.dart';
import '../../../data/repository/Repositories.dart';

class Dashboard_LeadSource_ViewModel extends GetxController {
   final _api = Repositories();

   RxBool loading = false.obs;

   Future <void> LeadSource(BuildContext, context) async {
      loading.value = true;

      _api.DB_LeadsSourceApi().then((response) {

         if(response.id != null) {

            Utils.SnackbarSuccess('lead Source Yes');
            loading.value = false;

         }else{
            Utils.SnackbarFailed('lead Source No');

         }
      }).onError((error, stackTrace) {
         if (kDebugMode) {
            print(error.toString());
         }
      });

   }
}