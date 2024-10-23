import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/leadScreens/trashLead/widgets/trashLeadCard/trash_lead_card.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../viewModels/leadScreens/trashLeads/deleteList/delete_list_viewModel.dart';
import '../../../viewModels/leadScreens/trashLeads/leadTypes/lead_type_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';

class TrashLeadScreen extends StatefulWidget {
  const TrashLeadScreen({super.key});

  @override
  State<TrashLeadScreen> createState() => _TrashLeadScreenState();
}

class _TrashLeadScreenState extends State<TrashLeadScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final DeleteListViewModel _customFieldsController = Get.put(DeleteListViewModel());
  final LeadTypeViewModel _leadTypeController = Get.put(LeadTypeViewModel());




  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();


    _customFieldsController.deleteList(context);
    // _leadTypeController.leadTypes(context);

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
                      height: 135,
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
                      child: const Icon(
                        Icons.menu_sharp,
                        size: 25,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  TextStyles.w700_17(color: AllColors.blackColor, context, Strings.trashLeads),

                  const Spacer(),
                  Icon(
                    Icons.filter_list_outlined,
                    size: 14,
                    color: AllColors.lightGrey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                TextStyles.w400_14(color: AllColors.lightGrey, context, Strings.filter),
                ],
              ),
            ),

          ],
        )
    );
  }
}
