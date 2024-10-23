import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../viewModels/master/divisions/master_divisions_viewModel.dart';
import '../../resources/textStyles/text_styles.dart';
import '../../utils/MasterScreen/MasterUtils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final MasterDivisionsViewModel divisionViewModel = Get.put(MasterDivisionsViewModel());
  String userName = '';
  String userEmail = '';
  String _selectedSetting = 'column'; // Track which setting is selected

  @override
  void initState() {
    super.initState();
    // Uncomment the following line if you want to fetch user data and divisions
    // _fetchUser DataAndDivisions();
  }

  // Future<void> _fetchUser DataAndDivisions() async {
  //   final userData = await MasterScreenUtils.fetchUser Data();
  //   setState(() {
  //     userName = userData['userName'] ?? '';
  //     userEmail = userData['userEmail'] ?? '';
  //   });
  //   await divisionViewModel.masterDivisions(context);
  // }

  @override
  Widget build(BuildContext context) {
    return MasterScreenUtils.buildCommonScaffold(
      scaffoldKey: _scaffoldKey,
      globalKey: _globalKey,
      userName: userName,
      userEmail: userEmail,
      title: Strings.setting,
      addButtonTitle: _selectedSetting == 'column' ? Strings.saveChanges : "Create Fields",
      onAddPressed: () {
        // Handle save changes or create fields action based on the selected setting
        if (_selectedSetting == 'column') {
          // Save changes logic here
        } else {
          // Create fields logic here
        }
      },

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSetting = 'column'; // Update to column setting
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _selectedSetting == 'column' ? Color(0x1A7367F0) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: _selectedSetting == 'column' ? Color(0xFF7367F0) : Colors.black),
                          SizedBox(width: 5),
                          Text(
                            "Column Setting",
                            style: TextStyle(color: _selectedSetting == 'column' ? Color(0xFF7367F0) : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedSetting = 'row'; // Update to row setting
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _selectedSetting == 'row' ? Color(0x1A7367F0) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.edit, color: _selectedSetting == 'row' ? Color(0xFF7367F0) : Colors.black),
                          SizedBox(width: 5),
                          Text(
                            "Field Setting",
                            style: TextStyle(color: _selectedSetting == 'row' ? Color(0xFF7367F0) : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),









          SizedBox(height: 20),
          Row(
            children: [
              Text(
                _selectedSetting == 'column'
                    ? "CUSTOMER TABLE COLUMNS VISIBILITY AND FILTERS"
                    : "Lead Standard Field Bar",
                style: TextStyle(fontSize : 14, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CommonButton(
                title: _selectedSetting == 'column' ? Strings.saveChanges : "New Custom Fields",
                onPress: () {
                  // Handle save changes or create fields action based on the selected setting
                  if (_selectedSetting == 'column') {
                    // Save changes logic here
                  } else {
                    // Create fields logic here
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() {
              if (_selectedSetting == 'column') {
                // Show column setting data
                final divisions = divisionViewModel.divisions;
                return MasterScreenUtils.buildDataTable(
                  context: context,
                  columns: const [
                    DataColumn(label: Text(Strings.column, style: TextStyles.masterScreen)),
                    DataColumn(label: Text(Strings.visible, style: TextStyles.masterScreen)),
                    DataColumn(label: Text(Strings.search_filter, style: TextStyles.masterScreen)),
                    DataColumn(label: Text(Strings.update_perission, style: TextStyles.masterScreen)),

                  ],
                  rows: List.generate(divisions.length, (index) {
                    final division = divisions[index];
                    return DataRow(cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(division.name ?? '', style: TextStyles.namelength)),
                      DataCell(
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0x1F47BD82),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            division.status ?? '',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF47BD82),
                            ),
                          ),
                        ),
                      ),

                      DataCell(IconButton(
                        icon: const Icon(Icons.mode_edit_outline_outlined),
                        onPressed: () {
                          // Handle edit action here
                        },
                      )),
                    ]);
                  }),
                );
              } else {
                // Show row setting data
                return Center(
                  child: Text('Hello'),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}