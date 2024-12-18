import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/responseModels/leads/lead_activity/no_activities/no_activities.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/imageStrings/image_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sizedBoxes/sizedBox_15h.dart';
import '../../../utils/components/widgets/sizedBoxes/sizedBox_22h.dart';

import '../../../viewModels/leadScreens/lead_activity/no_activities/no_activities.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class SearchGoogleLeads extends StatefulWidget {
  const SearchGoogleLeads({super.key});

  @override
  State<SearchGoogleLeads> createState() => _SearchGoogleLeadsState();
}

class _SearchGoogleLeadsState extends State<SearchGoogleLeads> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final SaveUserData userPreference = SaveUserData();
  final LeadActivityNoActivityViewModel viewModel = Get.put(LeadActivityNoActivityViewModel());

  String userName = '';
  String? userEmail = "";

  @override
  void initState() {
    super.initState();
    fetchUserData();
    viewModel.fetchNoActivities(context);
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser ();
      setState(() {
        userName = response.user?.firstName?? 'Unknown User';
        userEmail = response.user?.email ?? 'No Email';
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        backgroundColor: AllColors.whiteColor,
        appBar: AppBar(
          title: Text('Search Google Leads'),
        ),
        body:   ListView.builder(
          itemCount: viewModel.items.length,
          itemBuilder: (context, index) {
            final item = viewModel.items[index];

            // Calculate the number of days since the last call
            String daysSinceLastCall = 'Not available';

            // Check if lastCall and createdAt are not null
            if (item.lastCall?.createdAt != null) {
              DateTime? createdAt = DateTime.tryParse(item.lastCall!.createdAt!);

              if (createdAt != null) {
                Duration difference = DateTime.now().difference(createdAt);
                daysSinceLastCall = '${difference.inDays} days';
              } else {
                print('Error parsing date: ${item.lastCall!.createdAt}');
              }
            }

            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(item.firstName ?? 'Not available'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.email ?? 'Not available'),
                    Text(item.mobile ?? 'Not available'),
                    Text(item.lastCall?.remark ?? 'Not available'),
                    Text(item.lastCall?.createdBy?.firstName ?? 'Not available'),
                    Text(daysSinceLastCall), // Display the days count
                    Text(item.lastMeeting ?? 'Not available'),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}