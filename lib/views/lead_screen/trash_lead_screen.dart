import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import '../../Resources/all_strings/all_strings.dart';
import '../../Resources/all_textStyles/all_textStyles.dart';

import '../../utils/components/app_colors.dart';
import '../../utils/components/cards/trash_lead_screen_card/trash_lead_screen_card.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import '../../view_models/controllers/save_token/save_token.dart';

class TrashLeadScreen extends StatefulWidget {
  const TrashLeadScreen({super.key});

  @override
  State<TrashLeadScreen> createState() => _TrashLeadScreenState();
}

class _TrashLeadScreenState extends State<TrashLeadScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

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
        userName = first_name;
        userEmail = email;
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
        drawer: CustomDrawer(
            userName: '$userName',
            phoneNumber: '$userEmail',
            version: '1.0.10'),
        body: Stack(
          children: [
            const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    TrashLeadScreenCard(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreenCard(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreenCard(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreenCard(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                    TrashLeadScreenCard(
                        title: 'The Yoga Quarter',
                        email: 'info@theyogaquarter.co'),
                  ],
                ),
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
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  AllTextStyles.w700_17(color: AllColors.blackColor, context, AllStrings.TrashLead_trashLeads),

                  Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 14,
                    color: AllColors.lightGrey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                AllTextStyles.w400_14(color: AllColors.lightGrey, context, AllStrings.TrashLead_Filter),
                ],
              ),
            ),

          ],
        )
    );
  }
}
