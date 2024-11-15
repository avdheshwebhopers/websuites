import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:websuites/data/models/requestModels/lead/activity/team_leads/team_leads.dart';
import '../../../../Utils/utils.dart';
import '../../../../data/models/responseModels/leads/lead_activity/team_leads/team_leads.dart';
import '../../../../data/repositories/repositories.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:websuites/data/models/requestModels/lead/activity/team_leads/team_leads.dart';
import 'package:websuites/data/repositories/repositories.dart';
import '../../../../Utils/utils.dart';

class TeamLeadsViewModel extends GetxController {
  final _api = Repositories();
  RxBool loading = false.obs;
  RxList<LeadActivityTeamLeadResponseModel> teamLeads = <LeadActivityTeamLeadResponseModel>[].obs;

  Future<void> fetchTeamLeadsList(BuildContext context) async {
    TeamLeadRequestModel teamLeadRequestModel = TeamLeadRequestModel(
      dateRange: DateRange(
        from: "2024-09-23T18:30:00.000Z",
        to: "2024-10-24T18:30:00.000Z",
      ),
      limit: 15,
      page: 1,
      userId: "",
    );
    loading.value = true;
    try {
      final List<LeadActivityTeamLeadResponseModel> response =
      await _api.leadActivityTeamLead(teamLeadRequestModel.toJson());
      if (response.isNotEmpty) {
        teamLeads.assignAll(response);
        // Utils.snackbarSuccess('Team Leads Fetched Successfully');
      } else {
        // Utils.snackbarFailed('No data found for team leads');
      }
    } catch (error) {
      // Utils.snackbarFailed('Failed to fetch data');
      if (kDebugMode) print(error);
    } finally {
      loading.value = false;
    }
  }
}
