import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import '../../../resources/image_strings/image_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/text_styles/text_styles.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_15h.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_22h.dart';
import '../../../view_models/save_token/save_token.dart';
import '../create_newLead/widgets/create_new_lead_screen_card/create_new_lead_screen_card.dart';

class SearchGoogleLeads extends StatefulWidget {
  const SearchGoogleLeads({super.key});

  @override
  State<SearchGoogleLeads> createState() => _SearchGoogleLeadsState();
}

class _SearchGoogleLeadsState extends State<SearchGoogleLeads> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String? userEmail = "";

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });
    } catch (e) {
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        backgroundColor: AllColors.whiteColor,

        drawer:
        CustomDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.12'),

        body:
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 130, left: 30, right: 20),
              child: Image.asset(
                ImageStrings.World_Map,
                scale: 1,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Center(
                    child:
                  TextStyles.w700_16(color: AllColors.vividPurple, context, Strings.SearchGoogle_FindActive1),
                  ),
                  Center(
                    child:
                  TextStyles.w700_16(color: AllColors.vividPurple, context, Strings.SearchGoogle_FindActive2),
                  ),
                  SizedBox22h(),
                  TextStyles.w500_14_Black(context, Strings.SearchGoogle_SearchLead),

                  CreateNewLeadScreenCard(hintText: Strings.SearchGoogle_Search),
                  SizedBox15h(),

                  TextStyles.w500_14_Black(context, Strings.SearchGoogle_ByLocation),

                  CreateNewLeadScreenCard(hintText: Strings.SearchGoogle_EnterLocation),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: Get.height / 24,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                          color: AllColors.mediumPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child:
                          TextStyles.w500_14_White(context, Strings.SearchGoogle_Search2),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            //====================================================================
            //CUSTOM APP BAR

            CustomAppBar(
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        _globalKey.currentState?.openDrawer();
                      },
                      child: Icon(
                        Icons.menu_sharp,
                        size: 25,
                        color: AllColors.blackColor,
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:
                   TextStyles.w700_16(color: AllColors.blackColor, context, Strings.SearchGoogle_searchGoogleLeads)
                  )
                ],
              ),
            ),
          ],
        )
    );
  }
}
