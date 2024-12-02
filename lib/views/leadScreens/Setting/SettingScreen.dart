import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../Responsive/Custom_Drawer.dart';
import '../../../Utils/utils.dart';
import '../../../viewModels/leadScreens/Setting/setting.dart';
import '../../../viewModels/leadScreens/leadMasters/controller.dart';
import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/leads/setting/setting.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/MasterScreen/MasterUtils.dart';

import 'Column_Setting/ColumnSettingScreen.dart';
import 'Fields_Setting/FieldsSettingScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final LeadMasterController controller = Get.put(LeadMasterController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final LeadSettingsViewModel settingsViewModel = Get.put(LeadSettingsViewModel());
  final ScreenController _screenController = Get.put(ScreenController());

  final userName = ''.obs;
  final userEmail = ''.obs;
  final _selectedSetting = 'column'.obs;

  @override
  void initState() {
    super.initState();
    _fetchUserDataAndSettings();
  }

  Future<void> _fetchUserDataAndSettings() async {
    final userData = await MasterScreenUtils.fetchUserData();
    userName.value = userData['userName'] ?? '';
    userEmail.value = userData['userEmail'] ?? '';
    await settingsViewModel.fetchLeadSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return MasterScreenUtils.buildCommonScaffold(
        scaffoldKey: _scaffoldKey,
        globalKey: _globalKey,
        userName: userName.value,
        userEmail: userEmail.value,
        title: Strings.setting,
        // addButtonTitle: _selectedSetting.value == 'column' ? Strings.saveChanges : "Create Fields",
        onAddPressed: () {
          if (_selectedSetting.value == 'column') {
            // Handle save changes
          } else {
            // Handle create fields
          }
        },
        drawer: Obx(
              () => CustomDrawer(
            selectedIndex: 0, // Customize as needed
            onItemSelected: (index) {
              // Handle item selection
            },
            isCollapsed: false,
            onCollapseToggle: () {
              // Handle drawer collapse/expand
            },
            isTabletOrDesktop: screenWidth >= 500,
          ),
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => _selectedSetting.value = 'column',
                  child: Obx(() => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Smaller padding
                    decoration: BoxDecoration(
                      color: _selectedSetting.value == 'column' ? Color(0x1A7367F0) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _selectedSetting.value == 'column' ? Color(0xFF7367F0) : Colors.grey),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/settingmenu.png',
                          height: 14, // Smaller icon size
                          color: _selectedSetting.value == 'column' ? Color(0xFF7367F0) : Colors.black,
                        ),
                        SizedBox(width: 4), // Reduced space between icon and text
                        Text(
                          'Column Setting',
                          style: TextStyle(
                            fontSize: 12, // Smaller text size
                            color: _selectedSetting.value == 'column' ? Color(0xFF7367F0) : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () => _selectedSetting.value = 'row',
                  child: Obx(() => Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Smaller padding
                    decoration: BoxDecoration(
                      color: _selectedSetting.value == 'row' ? Color(0x1A7367F0) : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: _selectedSetting.value == 'row' ? Color(0xFF7367F0) : Colors.grey),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/icons/edit_setting.png',
                          height: 14, // Smaller icon size
                          color: _selectedSetting.value == 'row' ? Color(0xFF7367F0) : Colors.black,
                        ),
                        SizedBox(width: 4), // Reduced space between icon and text
                        Text(
                          'Field Setting',
                          style: TextStyle(
                            fontSize: 12, // Smaller text size
                            color: _selectedSetting.value == 'row' ? Color(0xFF7367F0) : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Obx(() => Text(
                  _selectedSetting.value == 'column'
                      ? "Lead Table Columns Visibility And Filters"
                      : "Lead Standard & Custom Fields",
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                )),
                Spacer(),

                // Obx(() => CommonButton(
                //   title: _selectedSetting.value == 'column' ? Strings.saveChanges : "New Custom Fields",
                //   onPress: () {
                //     if (_selectedSetting.value == 'column') {
                //       // Handle save changes
                //     } else {
                //       // Handle create fields
                //     }
                //   },
                // )),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return _selectedSetting.value == 'column'
                    ? ColumnSettingView(settingsViewModel: settingsViewModel, parentContext: context) // Pass the context here
                    : FieldSettingView();
              }),
            ),
          ],
        )

    );
  }
}
