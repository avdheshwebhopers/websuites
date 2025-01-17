import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:websuites/views/usersScreen/activity/userlocation/UserLocationScreen.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../data/models/responseModels/userList/activity/UserActivitiesResponseModel.dart';
import '../../../viewModels/userlistViewModel/activities/UserActivitiesViewModel.dart';
import '../../../viewModels/userlistViewModel/userlist_viewModel.dart';

class UserActivityScreen extends StatefulWidget {
  const UserActivityScreen({super.key});

  @override
  State<UserActivityScreen> createState() => _UserActivityScreenState();
}

class _UserActivityScreenState extends State<UserActivityScreen> {
  final UserListViewModel userListViewModel = Get.put(UserListViewModel());
  final UserActivitiesModel userActivitiesModel = Get.put(UserActivitiesModel());

  // Add a variable to store the selected user
  String? selectedUser;

  Widget getBrowserIcon(String? browserName) {
    if (browserName == null) return Icon(Icons.language, color: AllColors.grey, size: 17);

    switch (browserName.toLowerCase()) {
      case 'chrome':
        return Image.asset(
          'assets/images/chrome.png',  // Ensure this image is in your assets
          width: 17,
          height: 17,
        );
      default:
        return Icon(Icons.language, color: AllColors.grey, size: 17);
    }
  }

  @override
  void initState() {
    super.initState();
    // Fetch user activities when the screen is initialized
    userActivitiesModel.usersActivitiesApi();
    userListViewModel.userListApi();  // Make sure user list is fetched too
  }

  // Function to filter activities based on selected user
  List<Items> filterActivitiesByUser(String? userName) {
    if (userName == null || userName.isEmpty) {
      return userActivitiesModel.userActivities;
    }
    return userActivitiesModel.userActivities
        .where((activity) {
      final userFullName = '${activity.user?.firstName ?? ''} ${activity.user?.lastName ?? ''}'.trim();
      return userFullName.contains(userName);
    })
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activities',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: FontFamily.sfPro),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                _showDialogueBox(context);
              },
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Get.width * 0.16),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: AllColors.grey, width: 0.3),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/FilterIcon.png', width: 10, height: 12),
                      SizedBox(width: 5),
                      Text(
                        'Filter',
                        style: TextStyle(
                          color: AllColors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body:
      Obx(() {
        if (userActivitiesModel.loading.value) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator
        }

        if (userActivitiesModel.userActivities.isEmpty) {
          return Center(child: Text("No activities found")); // Show message if no activities
        }

        // Filter activities based on the selected user
        final filteredActivities = filterActivitiesByUser(selectedUser);

        return ListView.builder(
          itemCount: filteredActivities.length,
          itemBuilder: (context, index) {
            Items activity = filteredActivities[index];
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          // Display user name with fallback if null
                          '${activity.user?.firstName ?? ''} ${activity.user?.lastName ?? ''}',
                          style: TextStyle(
                            color: AllColors.blackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: Get.height / 45,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AllColors.lighterOrange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              // Show 'N/A' if deviceType is null, empty string, or whitespace
                              (activity.deviceType?.trim().isEmpty ?? true)
                                  ? 'N/A'
                                  : activity.deviceType!.substring(0, 1).toUpperCase() +
                                  activity.deviceType!.substring(1),
                              style: TextStyle(
                                color: AllColors.vividOrange,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // Display user email or fallback to 'N/A' if null
                          activity.user?.email ?? 'N/A',
                          style: TextStyle(
                            color: AllColors.grey,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Text(
                          // Show 'N/A' if deviceType is null, empty string, or whitespace
                          (activity.deviceDetail?.trim().isEmpty ?? true)
                              ? 'N/A'
                              : activity.deviceDetail!.substring(0, 1).toUpperCase() +
                              activity.deviceDetail!.substring(1),
                          style: TextStyle(
                            color: AllColors.vividBlue,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined, size: 16, color: AllColors.mediumPurple),
                        SizedBox(width: 10),
                        Text(
                          formatDateWithTime(activity.createdAt?.toString() ?? 'N/A'),
                          style: TextStyle(
                            color: AllColors.mediumPurple,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: Get.height / 45,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AllColors.lighterPurple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              activity.ipaddress ?? 'N/A',
                              style: TextStyle(
                                color: AllColors.mediumPurple,
                                fontFamily: FontFamily.sfPro,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                      Image.asset('assets/icons/userLogin.png',height: 16,width: 16,),
                        SizedBox(width: 5),
                        Text(
                          // Display description or fallback to 'N/A' if null
                          activity.description ?? 'N/A',
                          style: TextStyle(
                            color: AllColors.lightGrey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 0.4),
                    Row(
                      children: [
                        getBrowserIcon(activity.browserName), // New browser icon
                        SizedBox(width: 5),
                        Text(
                          // Show 'N/A' if deviceType is null, empty string, or whitespace
                          (activity.browserName?.trim().isEmpty ?? true)
                              ? 'N/A'
                              : activity.browserName!.substring(0, 1).toUpperCase() +
                              activity.browserName!.substring(1),
                          style: TextStyle(
                            color: AllColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapScreen(
                                  latitude: double.tryParse(activity.lat ?? '0.0') ?? 0.0,
                                  longitude: double.tryParse(activity.lng ?? '0.0') ?? 0.0,
                                  username:('${activity.user?.firstName ?? ''} ${activity.user?.lastName ?? ''}')
                                ),
                              ),
                            );
                          },
                          icon: Image.asset('assets/icons/location.png', height: 18, width: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _showDialogueBox(BuildContext context) {
    List<String> userNames = userListViewModel.userList
        .map((user) => '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim())
        .where((name) => name.isNotEmpty) // Remove empty names
        .toSet() // Remove duplicates
        .toList();

    if (userNames.isEmpty) {
      // If no user names are available, show a message or handle accordingly
      print('No users found.');
      return;
    }

    print('User Names: $userNames');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'By user',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: FontFamily.sfPro,
                      ),
                    ),
                    CreateNewLeadScreenCard(
                      hintText: 'By Users',
                      categories: userNames,  // Pass the userNames list here
                      onChanged: (selectedUser) {
                        print('User selected: $selectedUser');  // Debug log to check if the value is being passed
                        setState(() {
                          this.selectedUser = selectedUser;  // Update selected user
                        });
                      },
                    ),
                    Text(
                      'Select Date',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        fontFamily: FontFamily.sfPro,
                      ),
                    ),
                    // You can add a Date picker widget here if needed
                    CreateNewLeadScreenCard(
                      hintText: 'Select Date',
                      categories: [],  // Empty or date options
                      onChanged: (selectedDate) {
                        print('Selected Date: $selectedDate');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonButton(
                            height: 30,
                            title: 'Save',
                            onPress: () {
                              Get.back();  // Close the dialog
                              // After saving, the activities list will be filtered automatically
                              print('Saved filter for user: $selectedUser');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: Container(
                  height: 28,
                  padding: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.black, size: 14),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}

