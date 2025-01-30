import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/textStyles/text_styles.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../utils/components/buttons/common_button.dart';
import '../../../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../../../utils/responsive/bodies/responsive scaffold.dart';

import '../../Responsive/Custom_Drawer.dart';
import '../../viewModels/saveToken/save_token.dart';
import '../../data/models/controller.dart';
import '../../data/models/responseModels/login/login_response_model.dart';
import '../components/widgets/navBar/custom_navBar.dart';
import '../responsive/bodies/Responsive.dart';

class MasterScreenUtils {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScreenController _screenController = Get.put(ScreenController());



  static final SaveUserData userPreference = SaveUserData();

  static Future<Map<String, String>> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? firstName = response.user?.firstName;
      String? email = response.user?.email;
      return {'userName': firstName ?? '', 'userEmail': email ?? ''};
    } catch (e) {
      print('Error fetching user data: $e');
      return {'userName': '', 'userEmail': ''};
    }
  }
  static Widget buildCommonScaffold({
    required GlobalKey<ScaffoldState> scaffoldKey,
    required GlobalKey<ScaffoldState> globalKey,
    required String userName,
    required String userEmail,
    required String title,
    String addButtonTitle = '',
    required VoidCallback onAddPressed,
    required Widget body, // This is already defined correctly
    required Obx drawer, // Ensure that drawer is of type Obx
  }) {
    return Scaffold(
      // scaffoldKey: scaffoldKey,
      key: globalKey,
      backgroundColor: AllColors.whiteColor,
      // drawer: CustomDrawer(
      //   userName: userName,
      //   phoneNumber: userEmail,
      //   version: '1.0.12', onTap: (int ) {  },
      //
      //   // onTap: (index) {
      //   //   _screenController.updateIndex(index);
      //   //   if (ResponsiveUtils.isMobile(context)) {
      //   //     _globalKey.currentState?.closeDrawer();
      //   //   }
      //   // },
      //
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomAppBar(
          //   child: Row(
          //     children: [
          //       if (Get.width < 500)
          //         InkWell(
          //           onTap: () =>
          //           // _scaffoldKey.currentState?.openDrawer(),
          //             scaffoldKey.currentState?.openDrawer(),
          //           child: const Icon(Icons.menu_sharp, size: 25),
          //         ),
          //       const SizedBox(width: 10),
          //       TextStyles.w700_16(color: AllColors.blackColor, Get.context!, title),
          //       const Spacer(),
          //       // Only show the button if addButtonTitle is not empty
          //       if (addButtonTitle.isNotEmpty)
          //         CommonButton(title: addButtonTitle, onPress: onAddPressed)
          //     ],
          //   ),
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: body,
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: CustomBottomNavBar(),
    );



  }








  static Widget buildSearchField() {
    return Container(
      height: 40, // Set the height you want for the TextField
      child: TextField(
        style: TextStyle(fontSize: 14), // Adjust font size for text input
        decoration: InputDecoration(
          hintText: Strings.search_department,

          prefixIcon: Icon(Icons.search, color: AllColors.grey, size: 20),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // Reduced vertical padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AllColors.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AllColors.mediumPurple),
          ),
        ),
      ),
    );
  }


  static Widget buildDataTable({
    required BuildContext context,
    required List<DataColumn> columns,
    required List<DataRow> rows,
  }) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Outer scroll view for vertical scrolling
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Inner scroll view for horizontal scrolling
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width > 500
                  ? MediaQuery.of(context).size.width // Full width on larger screens
                  : null, // Auto width on smaller screens
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 2), // Shadow position
                  ),
                ],
              ),
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(Color(0xFFFAFAFA)),
                columns: columns,
                rows: rows,
              ),
            ),
          ),
        ),
      ),
    );
  }




}