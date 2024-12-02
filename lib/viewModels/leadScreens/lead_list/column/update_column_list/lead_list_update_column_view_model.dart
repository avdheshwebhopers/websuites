import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../Utils/utils.dart';
import '../../../../../data/models/requestModels/lead/lead_list/column/lead_list_column_list_update_request_model.dart';
import '../../../../../data/repositories/repositories.dart';

class LeadListUpdateColumnViewModel extends GetxController{


  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> leadListColumnUpdate(BuildContext context) async {
    loading.value = true;
    ColumnUpdateRequestModel columnUpdateRequestModel=ColumnUpdateRequestModel(
      leadFieldManagementIds: [
        "4d6e5b86-18d3-459b-ad79-5cbbb01d6a7d",
          "6c61873c-e731-4ea5-b26a-c38c51b4f45a",
      // "16ffaf8a-d4ef-4f60-a5ab-17f3d5c4dace",
      // "193d2e46-0164-4022-94c8-25f783bb2bb5",
      // "610cfb1f-2b75-4bbb-9625-4e0eca7868f6",
      // "6736c286-9c80-433c-ad7d-a17ce9b3fdfe",
      // "a0b44648-4c57-4918-826b-e6087b454997",
      // "b984e063-a893-4857-8533-912c61ed4471",
      // "bc178ee7-221b-4a60-ae4d-d11cceed13b0",
      // "bd7668d5-793b-48ba-8578-0c7424c27185",
      // "c41cba5d-a04d-4850-b0d6-9a966f219d79",
      // "45540f19-c171-43c8-9cda-cf8b7f9297aa",
      // "c2dcd9fc-5192-4034-ad44-04a9d0d18923"
      ]
    );

    _api.leadListColumnListUpdate(columnUpdateRequestModel.toJson()).then((value) {
      if(value.isNotEmpty){
        for (var responseData in value) {
          if (kDebugMode) {
            print("Lead List Update Column List ${responseData.leadField}");
          }
          Utils.snackbarSuccess('Lead List Update Column List data fetch');
        }
        loading.value = false;
      }
      else {
        Utils.snackbarFailed('Lead List Update Column List not fetched');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }




}