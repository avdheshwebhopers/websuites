import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../Utils/utils.dart';
import '../../../../../data/models/requestModels/leadactivity/daily_sales_reports/daily_sales_reports.dart';
import '../../../../../data/repositories/repositories.dart';



class DailySalesReportsViewModel extends GetxController{

  final _api = Repositories();
  RxBool loading = false.obs;
  // Initialize the LeadActivityResponseModel with the given values

  Future<void>dailySalesReports(BuildContext context)async{
    final dailySalesReportRequestModel = DailySalesReportRequestModel(
      dateRange: DateRanges(
        from: "2024-10-24 00:00:00.000",
        to: "2024-10-24 23:59:59.999",
      ),
      limit: 15,
      page: 1,
      userId: "",
    );
    _api.dailySalesReportList(dailySalesReportRequestModel.toJson()).then((response) {
      // Successfully fetched the leads
      if (response.items != null && response.items!.isNotEmpty) {
        for (var item in response.items!) {
          // Print or handle each lead item here
          print('Lead activity ID: ${item.id}');
          print('Lead activity Deal Sales Name: ${item.email}');
        }
        Utils.snackbarSuccess('Lead Activity Daily Sale Reports successfully');
      } else {
        Utils.snackbarFailed('No leads found');
      }
    }).onError((error, stackTrace) {
      // Handle any error here
      Utils.snackbarFailed('Failed to fetch leads');
      if (kDebugMode) {
        print('Error: $error');
      }
    });

  }








}