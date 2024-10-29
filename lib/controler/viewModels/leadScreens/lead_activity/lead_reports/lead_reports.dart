import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/models/requestModels/leadactivity/lead_reports/lead_reports.dart';
import '../../../../../data/repositories/repositories.dart';

class LeadActivityLeadReportViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  Future<void> leadReports(BuildContext context) async {
    LeadReportsRequestModel leadReportsRequestModel = LeadReportsRequestModel(
      dateRange: DateRange(
        from: "2024-10-24 00:00:00.000",
        to: "2024-10-24 23:59:59.999",
      ),
      limit: 5,
      page: 1,
      userId: "",
    );
    _api.leadActivityLeadReports(leadReportsRequestModel.toJson()).then((response) {
      // Successfully fetched the leads
      if (response.items != null && response.items!.isNotEmpty) {
        for (var item in response.items!) {
          // Print or handle each lead item here
          print('Lead ID: ${item.name}');
          print('Lead Reports: ${item.activities?.calls?.details?.answered}');
        }
        Utils.snackbarSuccess('Lead Reports List fetched successfully');
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