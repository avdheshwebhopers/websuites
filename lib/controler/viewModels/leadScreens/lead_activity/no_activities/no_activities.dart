import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../../Utils/utils.dart';
import '../../../../../data/models/requestModels/leadactivity/no_activities/no_activities.dart';
import '../../../../../data/repositories/repositories.dart';


class LeadActivityNoActivityViewModel extends GetxController{
  final _api = Repositories();
  RxBool loading = false.obs;


  Future<void>noActivities(BuildContext context)async{
    NoActivitiesRequestModel noActivitiesRequestModel = NoActivitiesRequestModel(
      activities: [], // Pass your activities data here
      assignedTo: "",
      days: null, // Can be null or an int/String as needed
      isFilterUserWithTeam: true,
      limit: 5,
      page: 1,
    );

    _api.leadNoActivities(noActivitiesRequestModel.toJson()).then((response) {
      // Successfully fetched the leads
      if (response.items != null && response.items!.isNotEmpty) {
        for (var item in response.items!) {
          // Print or handle each lead item here
          print('Lead First: ${item.firstName}');
          print('Lead NO Activity mobile: ${item.mobile}');
        }
        Utils.snackbarSuccess('Lead Activity List fetched successfully');
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