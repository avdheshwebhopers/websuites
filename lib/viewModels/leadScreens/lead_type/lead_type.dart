import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/repositories/repositories.dart';
class ListLeadTypeViewModel extends GetxController{
  final _api = Repositories();
  RxBool loading = false.obs;

  Future<void> listLeadType (BuildContext context) async {
    loading.value = true;
    _api.leadListLeadType().then((value) {
      print("Value $value");
      if (value.isNotEmpty) { // Check if the list is not empty
        // Iterate through the list or handle each item individually
        for (var division in value) {
          print("LeadType Value ${division.name}");
          if (division.id != null) {
            Utils.snackbarSuccess('Master divisions fetched');
          } else {
            Utils.snackbarFailed('One of the master divisions does not have an ID');
          }
        }
        loading.value = false;
      }

      else{
        Utils.snackbarFailed('master divisions not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
    );
  }

}