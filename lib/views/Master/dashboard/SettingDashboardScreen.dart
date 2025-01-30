import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import '../../../data/models/requestModels/master/dashboard/save_changes/SettingDashSaveChangesRequestModel.dart';
import '../../../utils/components/buttons/common_button.dart';
import '../../../utils/container/container_Utils/ContainerUtils.dart';
import '../../../viewModels/master/dashboard/SettingDashboardListViewModel.dart';
import '../../../../utils/utils.dart';
import 'graph/GraphPage.dart';
class PieChartController extends GetxController {
  // Observable variable for touchedIndex
  var touchedIndex = (-1).obs;

  // Method to update touchedIndex
  void setTouchedIndex(int index) {
    touchedIndex.value = index;
  }
}

class SettingDashboardScreen extends StatelessWidget {
  const SettingDashboardScreen({super.key});

  // Add a variable to manage the border color


  String formatDashboardName(String name, {bool isDivision = false}) {
    // Remove the word "chart" and any underscores
    name = name.replaceAll('_chart', '').replaceAll('_', ' ');

    // If it's a division, convert to lowercase
    if (isDivision) {
      return name.toLowerCase();
    }

    // Otherwise, return the name as is
    return name;
  }

  @override
  Widget build(BuildContext context) {
    final List<SourceData> data = [
      SourceData(source: "Google", count: 11490, color: AllColors.thinPurple),
      SourceData(source: "Bot", count: 4000, color: Colors.orange.shade200),
      SourceData(source: "DirectCall", count: 8000, color: Colors.blue.shade200),
      SourceData(source: "Website", count: 4500, color: Colors.pink.shade200),
      SourceData(source: "OData", count: 3500, color: Colors.blue.shade100),
      SourceData(source: "Reference", count: 9000, color: Colors.orange.shade100),
      SourceData(source: "Facebook", count: 7500, color: Colors.blue.shade300),
      SourceData(source: "Offline Event", count: 6500, color: Colors.grey.shade400),
      SourceData(source: "Google", count: 8900, color: Colors.blue.shade200),
      SourceData(source: "Bot", count: 10000, color: Colors.orange.shade200),
      SourceData(source: "DirectCall", count: 3800, color: Colors.green.shade200),
      SourceData(source: "Website", count: 7000, color: Colors.pink.shade200),
      SourceData(source: "OData", count: 9500, color: Colors.blue.shade100),
      SourceData(source: "Facebook", count: 2800, color: Colors.blue.shade300),
    ];
    final Rx<Color> borderColor = Colors.grey.shade300.obs;
    final viewModel = Get.put(SettingDashboardListViewModel());
    RxDouble rotation = 0.0.obs;
    final Rx<bool> isListSelected = true.obs;
    final Rx<String> selectedPeriod = 'This month'.obs;

    void rotateIcon() {
      rotation.value -= 360.0;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.fetchMasterSettingList(context);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            Text(
              'DASHBOARD',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.sfPro,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DonutChartPage(
                //     ),
                //   ),
                // );
              },
              icon: Icon(Icons.graphic_eq),
            ),
          ],
        ),
      ),
      body: Obx(() {
        if (viewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        List dashboardNames = viewModel.masterDashboardItems.map((dashboard) {
          bool isDivision =
              dashboard.name?.toLowerCase().contains('division') ?? false;
          return formatDashboardName(dashboard.name ?? 'UNNAMED DASHBOARD',
              isDivision: isDivision);
        }).toList();

        return Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
          child: viewModel.masterDashboardItems.isEmpty
              ? Center(child: Text('NO DASHBOARDS FOUND'))
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: ContainerUtils(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.dashboard_customize_outlined),
                          SizedBox(width: 10),
                          Text(
                            'Dashboard Configuration',
                            style: TextStyle(
                                fontFamily: FontFamily.sfPro,
                                fontWeight: FontWeight.w600,
                                fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Select Role For config',
                        style: TextStyle(
                            fontFamily: FontFamily.sfPro, fontSize: 14),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Change the border color to red when tapped
                          borderColor.value = AllColors.mediumPurple;

                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Container(
                                height: 400,
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'SELECT DIVISION',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: FontFamily.sfPro,
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children:
                                        dashboardNames.map((name) {
                                          return ListTile(
                                            title: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  name,
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.w500,
                                                    fontSize: 16,
                                                    fontFamily:
                                                    FontFamily.sfPro,
                                                  ),
                                                ),
                                                if (viewModel
                                                    .selectedDashboardName
                                                    .value ==
                                                    name)
                                                  Container(
                                                    padding:
                                                    EdgeInsets.all(2),
                                                    decoration:
                                                    BoxDecoration(
                                                      color: Colors
                                                          .transparent,
                                                      border: Border.all(
                                                        color: AllColors
                                                            .mediumPurple,
                                                        width: 1.5,
                                                      ),
                                                      shape:
                                                      BoxShape.circle,
                                                    ),
                                                    child: Container(
                                                      padding:
                                                      EdgeInsets.all(
                                                          2),
                                                      decoration:
                                                      BoxDecoration(
                                                        color: AllColors
                                                            .mediumPurple,
                                                        shape: BoxShape
                                                            .circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.check,
                                                        color:
                                                        Colors.white,
                                                        size: 12,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            onTap: () {
                                              viewModel
                                                  .selectedDashboardName
                                                  .value = name;
                                              var selectedDashboard = viewModel
                                                  .masterDashboardItems
                                                  .firstWhere((dashboard) =>
                                              formatDashboardName(
                                                  dashboard
                                                      .name ??
                                                      'UNNAMED DASHBOARD') ==
                                                  name);
                                              viewModel
                                                  .selectedDashboardCharts
                                                  .value =
                                                  selectedDashboard
                                                      .charts;
                                              viewModel
                                                  .selectedDashboardId
                                                  .value =
                                                  selectedDashboard
                                                      .id; // Set the selected dashboard ID
                                              Navigator.pop(context);
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 9),
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor.value),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Text(
                                formatDashboardName(viewModel
                                    .selectedDashboardName.value ??
                                    'SELECT DASHBOARD'),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.sfPro,
                                ),
                              ),
                              Spacer(),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            'Please Save Your Changes',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              fontFamily: FontFamily.sfPro,
                              color: AllColors.mediumPurple,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.error_outline_rounded,
                            color: AllColors.mediumPurple,
                            size: 18,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              final response =
                              await viewModel.saveCharts();
                              if (response != null) {
                                Utils.snackbarSuccess(response.message ??
                                    'CHART SAVED SUCCESSFULLY');
                              } else {
                                Utils.snackbarFailed(
                                    'FAILED TO SAVE CHART');
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AllColors.whiteColor,
                                border: Border.all(
                                    color: AllColors.darkGreen),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                child: Row(
                                  children: [
                                    Icon(Icons.bookmark_outline_sharp,
                                        color: AllColors.darkGreen),
                                    SizedBox(width: 3),
                                    Text(
                                      'Save Charts',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: AllColors.darkGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              viewModel
                                  .resetCharts(); // Call the resetCharts method
                              rotateIcon(); // Rotate the icon
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border:
                                Border.all(color: AllColors.darkRed),
                                color: AllColors.lightRed,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                child: Row(
                                  children: [
                                    AnimatedRotation(
                                      turns: rotation.value / 360,
                                      duration: Duration(seconds: 1),
                                      child: Icon(
                                        Icons.settings_backup_restore,
                                        color: AllColors.darkRed,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      'Reset Charts',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: AllColors.darkRed,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              if (viewModel.selectedDashboardCharts.value != null)
                Expanded(
                  child: ListView.builder(
                    itemCount:
                    viewModel.selectedDashboardCharts.value!.length,
                    itemBuilder: (context, index) {
                      String chartName = formatDashboardName(viewModel
                          .selectedDashboardCharts.value![index]);

                      return Padding(
                        padding:
                        const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            Container(
                              margin:
                              const EdgeInsets.symmetric(vertical: 8),
                              padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 20,
                                  left: 15,
                                  right: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 4,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        chartName.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: FontFamily.sfPro,
                                        ),
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            viewModel.removeChart(index);
                                          },
                                          child: Image.asset(
                                            'assets/icons/delete.png',
                                            height: 17,
                                            width: 17,
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(thickness: 0.5),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      // GestureDetector(
                                      //   onTap: () {
                                      //     viewModel.removeChart(index);
                                      //   },
                                      //   child: Icon(Icons.delete,
                                      //       color: AllColors.lightRed,
                                      //       size: 30),
                                      // ),

                                      SizedBox(width: 15),
                                    ],
                                  ),
                                  if (index == 0)
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ContainerUtils(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CommonButton(
                                                            height: 35,
                                                            width: 35,
                                                            color: AllColors
                                                                .background_green,
                                                            title: '',
                                                            icon: Icon(
                                                                Icons
                                                                    .arrow_forward_outlined,
                                                                color: AllColors
                                                                    .text__green),
                                                            onPress:
                                                                () {}),
                                                        SizedBox(
                                                            width: 10),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              10),
                                                          child: Text(
                                                            'New',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontSize:
                                                                17,
                                                                fontFamily:
                                                                FontFamily
                                                                    .sfPro),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '+ 0.5%',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize:
                                                              13,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro,
                                                              color: AllColors
                                                                  .text__green),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '58234',
                                                      style: TextStyle(
                                                        fontFamily:
                                                        FontFamily
                                                            .sfPro,
                                                        fontSize: 23,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 15),
                                            Expanded(
                                              child: ContainerUtils(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CommonButton(
                                                            height: 35,
                                                            width: 35,
                                                            color: AllColors
                                                                .background_green,
                                                            title: '',
                                                            icon: Icon(
                                                                Icons
                                                                    .arrow_forward_outlined,
                                                                color: AllColors
                                                                    .text__green),
                                                            onPress:
                                                                () {}),
                                                        SizedBox(
                                                            width: 10),
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              bottom:
                                                              10),
                                                          child: Text(
                                                            'New',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontSize:
                                                                17,
                                                                fontFamily:
                                                                FontFamily
                                                                    .sfPro),
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        Text(
                                                          '+ 0.5%',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w500,
                                                              fontSize:
                                                              13,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro,
                                                              color: AllColors
                                                                  .text__green),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      '58234',
                                                      style: TextStyle(
                                                        fontFamily:
                                                        FontFamily
                                                            .sfPro,
                                                        fontSize: 23,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  if (index == 1)
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 200,
                                            height: 200,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                // Using GetX to observe changes in touchedIndex
                                                GetX<PieChartController>(
                                                  init:
                                                  PieChartController(),
                                                  builder: (controller) {
                                                    return PieChart(
                                                      PieChartData(
                                                        sectionsSpace: 0,
                                                        borderData:
                                                        FlBorderData(
                                                            show:
                                                            false),
                                                        pieTouchData:
                                                        PieTouchData(
                                                          touchCallback:
                                                              (FlTouchEvent
                                                          event,
                                                              pieTouchResponse) {
                                                            if (!event
                                                                .isInterestedForInteractions ||
                                                                pieTouchResponse ==
                                                                    null ||
                                                                pieTouchResponse
                                                                    .touchedSection ==
                                                                    null) {
                                                              // Set touched index to -1 when no section is touched
                                                              controller
                                                                  .setTouchedIndex(
                                                                  -1);
                                                              return;
                                                            }
                                                            // Set touched index based on the touched section
                                                            controller.setTouchedIndex(
                                                                pieTouchResponse
                                                                    .touchedSection!
                                                                    .touchedSectionIndex);
                                                          },
                                                        ),
                                                        sections:
                                                        List.generate(
                                                            4, (i) {
                                                          final isTouched = i ==
                                                              controller
                                                                  .touchedIndex
                                                                  .value;
                                                          final fontSize =
                                                          isTouched
                                                              ? 16.0
                                                              : 16.0;
                                                          final radius =
                                                          isTouched
                                                              ? 45.0
                                                              : 40.0;
                                                          switch (i) {
                                                            case 0: // Blue section
                                                              return PieChartSectionData(
                                                                color: Colors
                                                                    .blue,
                                                                value: 52,
                                                                title:
                                                                '52%',
                                                                radius:
                                                                radius,
                                                                titleStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                  fontSize,
                                                                ),
                                                              );
                                                            case 1: // Red section
                                                              return PieChartSectionData(
                                                                color: Colors
                                                                    .red,
                                                                value: 35,
                                                                title:
                                                                '35%',
                                                                radius:
                                                                radius,
                                                                titleStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                  fontSize,
                                                                ),
                                                              );
                                                            case 2: // Purple section
                                                              return PieChartSectionData(
                                                                color: Colors
                                                                    .purple,
                                                                value: 1,
                                                                title:
                                                                '1%',
                                                                radius:
                                                                radius,
                                                                titleStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                  fontSize,
                                                                ),
                                                              );
                                                            case 3: // Orange section
                                                              return PieChartSectionData(
                                                                color: Colors
                                                                    .orange,
                                                                value: 35,
                                                                title:
                                                                '35%',
                                                                radius:
                                                                radius,
                                                                titleStyle:
                                                                TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                  fontSize,
                                                                ),
                                                              );
                                                            default:
                                                              throw Error();
                                                          }
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                // Center text displaying the total
                                                Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .center,
                                                  children: [
                                                    Text(
                                                      'Total', // Total label
                                                      style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        color:
                                                        Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      '122', // Total value
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        color:
                                                        Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor:
                                                    Colors.blue,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Hot",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontFamily:
                                                        FontFamily
                                                            .sfPro,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor:
                                                    Colors.yellow,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "Cold",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontFamily:
                                                        FontFamily
                                                            .sfPro,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor:
                                                    Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "Dead",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .w500,
                                                        fontFamily:
                                                        FontFamily
                                                            .sfPro,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 7,
                                                    backgroundColor:
                                                    Colors.purple,
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "FollowUp",
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight
                                                            .w400,
                                                        fontFamily:
                                                        FontFamily
                                                            .sfPro,
                                                        fontSize: 16),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  if (index == 2)
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          spacing: 15,
                                          // Space between the children
                                          runSpacing: 10,
                                          // Space between the lines
                                          children: [
                                            Expanded(
                                              child: ContainerUtils(
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor:
                                                      AllColors
                                                          .lightYellow,
                                                      child: Icon(
                                                          Icons
                                                              .date_range,
                                                          color: AllColors
                                                              .vividYellow,
                                                          size: 16),
                                                    ),
                                                    SizedBox(width: 6),
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          'Today',
                                                          style: TextStyle(
                                                              fontSize:
                                                              15.9,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400),
                                                        ),
                                                        Text(
                                                          '4',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize:
                                                              19,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ContainerUtils(
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor:
                                                      AllColors
                                                          .lightRed,
                                                      child: Text(
                                                        '!',
                                                        style: TextStyle(
                                                            fontFamily:
                                                            FontFamily
                                                                .sfPro,
                                                            fontSize: 14,
                                                            color: AllColors
                                                                .darkRed,
                                                            fontWeight:
                                                            FontWeight
                                                                .w700),
                                                      ),
                                                    ),
                                                    SizedBox(width: 6),
                                                    Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          'Missing',
                                                          style: TextStyle(
                                                              fontSize:
                                                              15.9,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400),
                                                        ),
                                                        Text(
                                                          '19500',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize:
                                                              19,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: ContainerUtils(
                                                child: Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor:
                                                      AllColors
                                                          .background_green,
                                                      child: Icon(
                                                          Icons.upcoming,
                                                          color: AllColors
                                                              .text__green,
                                                          size: 16),
                                                    ),
                                                    SizedBox(width: 6),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        Text(
                                                          'UpComing',
                                                          style: TextStyle(
                                                              fontSize:
                                                              15.9,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro,
                                                              fontWeight:
                                                              FontWeight
                                                                  .w400),
                                                        ),
                                                        Text(
                                                          '5',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize:
                                                              19,
                                                              fontFamily:
                                                              FontFamily
                                                                  .sfPro),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Today Reminders List',
                                          style: TextStyle(
                                              fontFamily:
                                              FontFamily.sfPro,
                                              fontSize: 15),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor: AllColors
                                                    .background_green,
                                                child: Text(
                                                  'VM',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .text__green),
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .email_outlined,
                                                      size: 18,
                                                      color: AllColors
                                                          .figmaGrey,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Varun Mittal (Owner)',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          FontFamily
                                                              .sfPro,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '16 October 2024 at 9:23 pm',
                                                  style: TextStyle(
                                                      color: AllColors
                                                          .greyBlack,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 4),
                                              decoration: BoxDecoration(
                                                color:
                                                AllColors.lightYellow,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_outlined,
                                                    size: 14,
                                                    color: AllColors
                                                        .mediumYellow,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                      color: AllColors
                                                          .mediumYellow,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor:
                                                AllColors.myGreen,
                                                child: Text(
                                                  'M',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .whiteColor),
                                                )),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor:
                                                AllColors.lightYellow,
                                                child: Text(
                                                  'ff',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .mediumYellow),
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .email_outlined,
                                                      size: 18,
                                                      color: AllColors
                                                          .figmaGrey,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'frrdf fvdsg',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          FontFamily
                                                              .sfPro,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '16 October 2024 at 12:00 pm',
                                                  style: TextStyle(
                                                      color: AllColors
                                                          .greyBlack,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 4),
                                              decoration: BoxDecoration(
                                                color:
                                                AllColors.lightYellow,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_outlined,
                                                    size: 14,
                                                    color: AllColors
                                                        .mediumYellow,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                      color: AllColors
                                                          .mediumYellow,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor:
                                                AllColors.lightGrey,
                                                child: Text(
                                                  'R',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .whiteColor),
                                                )),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor: AllColors
                                                    .background_green,
                                                child: Text(
                                                  'VM',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .text__green),
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .email_outlined,
                                                      size: 18,
                                                      color: AllColors
                                                          .figmaGrey,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'Varun Mittal (Owner)',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          FontFamily
                                                              .sfPro,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '16 October 2024 at 9:23 pm',
                                                  style: TextStyle(
                                                      color: AllColors
                                                          .greyBlack,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 4),
                                              decoration: BoxDecoration(
                                                color:
                                                AllColors.lightYellow,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_outlined,
                                                    size: 14,
                                                    color: AllColors
                                                        .mediumYellow,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                      color: AllColors
                                                          .mediumYellow,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor:
                                                AllColors.myGreen,
                                                child: Text(
                                                  'M',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .whiteColor),
                                                )),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor: AllColors
                                                    .background_green,
                                                child: Text(
                                                  'ulg',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .text__green),
                                                )),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .email_outlined,
                                                      size: 18,
                                                      color: AllColors
                                                          .figmaGrey,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      'unhandeled lead2',
                                                      style: TextStyle(
                                                          fontFamily:
                                                          FontFamily
                                                              .sfPro,
                                                          fontSize: 16),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '16 October 2024 at 9:23 pm',
                                                  style: TextStyle(
                                                      color: AllColors
                                                          .greyBlack,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight
                                                          .w400),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                              padding:
                                              EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                  vertical: 4),
                                              decoration: BoxDecoration(
                                                color:
                                                AllColors.lightYellow,
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .notifications_outlined,
                                                    size: 14,
                                                    color: AllColors
                                                        .mediumYellow,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                      color: AllColors
                                                          .mediumYellow,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      fontWeight:
                                                      FontWeight.w700,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CircleAvatar(
                                                radius: 16,
                                                backgroundColor: AllColors
                                                    .mediumPurple,
                                                child: Text(
                                                  'D',
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w600,
                                                      fontSize: 13,
                                                      fontFamily:
                                                      FontFamily
                                                          .sfPro,
                                                      color: AllColors
                                                          .whiteColor),
                                                )),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          height: 20,
                                        ),
                                      ],
                                    ),

                                  if (index == 3)
                                    Column(
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Obx(() => GestureDetector(
                                                  onTap: () {
                                                    isListSelected.value = true;
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/Menuthreedot.png',
                                                        height: 17,
                                                        width: 17,
                                                        cacheHeight: 27,
                                                        cacheWidth: 29,
                                                        color: isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'List',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: FontFamily.sfPro,
                                                          fontSize: 19,
                                                          color: isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                SizedBox(width: 10),
                                                Obx(() => GestureDetector(
                                                  onTap: () {
                                                    isListSelected.value = false;
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                          Icons.pie_chart,
                                                          color: !isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                          size: 19
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'Chart',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: FontFamily.sfPro,
                                                          fontSize: 19,
                                                          color: !isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                SizedBox(width: 15),
                                                Obx(() => Container(
                                                  decoration: BoxDecoration(
                                                    color: selectedPeriod.value == 'This month' ? Colors.yellow : Colors.transparent,
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: PopupMenuButton<String>(
                                                    color: Colors.white,
                                                    offset: Offset(0, 40),
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                    ),
                                                    itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        value: 'This month',
                                                        child: Text('This month',),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 'Last 30 Days',
                                                        child: Text('Last 30 Days'),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 'Last 3 months',
                                                        child: Text('Last 3 months'),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 'Last 6 months',
                                                        child: Text('Last 6 months'),
                                                      ),
                                                      PopupMenuItem(
                                                        value: 'Last Year',
                                                        child: Text('Last Year'),
                                                      ),
                                                    ],
                                                    onSelected: (String value) {
                                                      selectedPeriod.value = value;
                                                    },
                                                    child: ContainerUtils(
                                                      borderRadius: BorderRadius.circular(5),
                                                      paddingBottom: 2,
                                                      paddingTop: 2,
                                                      paddingRight: 6,
                                                      paddingLeft: 6,
                                                      backgroundColor: AllColors.mediumPurple,
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            selectedPeriod.value,
                                                            style: TextStyle(
                                                              fontFamily: FontFamily.sfPro,
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.keyboard_arrow_down,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Obx(() {
                                              return isListSelected.value
                                                  ?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('11490', 'Google', AllColors.thinPurple, EdgeInsets.only(right: 5),'Lead'),
                                                      _buildLeadItem('690', 'Bot', Color(0xFFFFE5A3), EdgeInsets.symmetric(horizontal: 5),'Lead'),
                                                      _buildLeadItem('150', 'Direct Call', AllColors.minorPurple, EdgeInsets.only(left: 5),'Lead'),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('6', 'PPC Facebook', AllColors.thinPurple, EdgeInsets.only(right: 5),'Lead'),
                                                      _buildLeadItem('1023', 'Tele Tele Services', Color(0xFFFFE5A3), EdgeInsets.symmetric(horizontal: 5),'Lead'),
                                                      _buildLeadItem('408', 'Old Data', AllColors.minorPurple, EdgeInsets.only(left: 5),'Lead'),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('25', 'Reference', AllColors.thinPurple, EdgeInsets.only(right: 5),'Lead'),
                                                      _buildLeadItem('54', 'JustDial', Color(0xFFFFE5A3), EdgeInsets.symmetric(horizontal: 5),'Lead'),
                                                      _buildLeadItem('51', 'DirectVisit', AllColors.minorPurple, EdgeInsets.only(left: 5),'Lead'),

                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),


                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('8', 'Blog', AllColors.thinPurple, EdgeInsets.only(right: 5),'Lead'),
                                                      _buildLeadItem('8', 'IndiaMart', Color(0xFFFFE5A3), EdgeInsets.symmetric(horizontal: 5),'Lead'),
                                                      _buildLeadItem('3', 'Facebook', AllColors.minorPurple, EdgeInsets.only(left: 5),'Lead'),

                                                    ],
                                                  ),

                                                  SizedBox(height: 10,),


                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('1', 'PPC Google', AllColors.thinPurple, EdgeInsets.only(right: 5),'Lead'),
                                                      _buildLeadItem('2', 'Offline Event', Color(0xFFFFE5A3), EdgeInsets.symmetric(horizontal: 5),'Lead'),
                                                      _buildLeadItem('3', 'Facebook', AllColors.minorPurple, EdgeInsets.only(left: 5),'Lead'),

                                                    ],
                                                  ),

                                                  SizedBox(height: 10),
                                                ],
                                              )

                                                  :
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  AspectRatio(
                                                    aspectRatio: 2.2,
                                                    child: BarChart(
                                                      BarChartData(
                                                        maxY: data.map((e) => e.count.toDouble()).reduce((a, b) => a > b ? a : b) * 1.1,
                                                        minY: 0,
                                                        barGroups: data.asMap().entries.map((entry) {
                                                          int index = entry.key;
                                                          SourceData source = entry.value;
                                                          return BarChartGroupData(
                                                            x: index,
                                                            barRods: [
                                                              BarChartRodData(
                                                                toY: source.count.toDouble(),
                                                                color: source.color,
                                                                width: 20,
                                                                borderRadius: const BorderRadius.only(
                                                                  topLeft: Radius.circular(13),
                                                                  topRight: Radius.circular(13),
                                                                ),
                                                              ),
                                                            ],
                                                            showingTooltipIndicators: [0],
                                                          );
                                                        }).toList(),
                                                        titlesData: FlTitlesData(
                                                          leftTitles: AxisTitles(
                                                            sideTitles: SideTitles(
                                                              showTitles: true,
                                                              reservedSize: 45,
                                                              getTitlesWidget: (double value, TitleMeta meta) {
                                                                return Padding(
                                                                  padding: const EdgeInsets.only(right: 8.0),
                                                                  child: Text(
                                                                    value.toInt().toString(),
                                                                    style: const TextStyle(fontSize: 12, color: Colors.green),
                                                                    textAlign: TextAlign.right,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                                          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                                                          bottomTitles: AxisTitles(
                                                            sideTitles: SideTitles(
                                                              showTitles: true,
                                                              reservedSize: 50,
                                                              getTitlesWidget: (double value, TitleMeta meta) {
                                                                if (value.toInt() < 0 || value.toInt() >= data.length) {
                                                                  return Container();
                                                                }
                                                                return Transform.rotate(
                                                                  angle: -0.4,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(top: 8.0),
                                                                    child: Text(
                                                                      data[value.toInt()].source,
                                                                      style: TextStyle(fontSize: 10, color: AllColors.grey),
                                                                      textAlign: TextAlign.center,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        gridData: FlGridData(
                                                          show: true,
                                                          drawVerticalLine: false,
                                                          drawHorizontalLine: true,
                                                          getDrawingHorizontalLine: (value) {
                                                            return FlLine(
                                                              color: value == 0 ? Colors.black : Colors.transparent,
                                                              strokeWidth: value == 0 ? 1 : 0,
                                                            );
                                                          },
                                                        ),
                                                        borderData: FlBorderData(show: false),
                                                        barTouchData: BarTouchData(
                                                          enabled: true,
                                                          touchTooltipData: BarTouchTooltipData(
                                                            getTooltipColor: (group) => Colors.transparent,
                                                            tooltipPadding: EdgeInsets.zero,
                                                            tooltipMargin: 0,
                                                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                                                              return BarTooltipItem(
                                                                rod.toY.toInt().toString(),
                                                                const TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );




                                            }),
                                          ],
                                        ),

                                      ],
                                    ),
                                  if(index == 4)
                                    Column(
                                      children: [

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Obx(() => GestureDetector(
                                                  onTap: () {
                                                    isListSelected.value = true;
                                                  },
                                                  child: Row(

                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/Menuthreedot.png',
                                                        height: 17,
                                                        width: 17,
                                                        cacheHeight: 27,
                                                        cacheWidth: 29,
                                                        color: isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'List',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: FontFamily.sfPro,
                                                          fontSize: 19,
                                                          color: isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                SizedBox(width: 40),
                                                Obx(() => GestureDetector(
                                                  onTap: () {
                                                    isListSelected.value = false;
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                          Icons.pie_chart,
                                                          color: !isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                          size: 19
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'Chart',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: FontFamily.sfPro,
                                                          fontSize: 19,
                                                          color: !isListSelected.value ? AllColors.mediumPurple : Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                SizedBox(width: 15),

                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            Obx(() {
                                              return isListSelected.value
                                                  ?
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('94', 'Project Not Started', AllColors.thinPurple, EdgeInsets.only(right: 5) ,'Customer'),

                                                      _buildLeadItem('69', 'Project On Hold', AllColors.minorPurple, EdgeInsets.only(left: 5),'Customer'),

                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      _buildLeadItem('337', 'Service Running', AllColors.thinPurple, EdgeInsets.only(right: 5),'Customer'),
                                                      _buildLeadItem('1725', 'No Services', Color(0xFFFFE5A3), EdgeInsets.symmetric(horizontal: 5),'Customer'),


                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Row(
                                                    children: [
                                                      _buildLeadItem('20', 'Project In Progress', AllColors.thinPurple, EdgeInsets.only(right: 5,left: 0),'Customer'),
                                                      _buildLeadItem('20', 'Project In Progress', AllColors.thinPurple, EdgeInsets.symmetric(horizontal: 5),'Custo.'),

                                                    ],
                                                  ),



                                                  SizedBox(height: 10),
                                                ],
                                              )

                                                  :
                                              Column(
                                                children: [
                                                  Center(
                                                    child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        Container(
                                                          width: 320,
                                                          height: 320,
                                                          child:
                                                          PieChart(
                                                            PieChartData(
                                                              sectionsSpace: 0,
                                                              centerSpaceRadius: 80, // This creates the donut hole
                                                              sections: [
                                                                PieChartSectionData(
                                                                  value: 71,
                                                                  color: Colors.purple,
                                                                  title: '71%',
                                                                  titleStyle: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                  radius: 60,
                                                                  showTitle: true,
                                                                ),
                                                                PieChartSectionData(
                                                                  value: 3,
                                                                  color: Colors.blue,
                                                                  title: '3%',
                                                                  titleStyle: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                  radius: 60,
                                                                  showTitle: true,
                                                                ),
                                                                PieChartSectionData(
                                                                  value: 8,
                                                                  color: Colors.orange,
                                                                  title: '8%',
                                                                  titleStyle: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                  radius: 60,
                                                                  showTitle: true,
                                                                ),
                                                                PieChartSectionData(
                                                                  value: 2,
                                                                  color: Colors.red,
                                                                  title: '2%',
                                                                  titleStyle: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                  radius: 60,
                                                                  showTitle: true,
                                                                ),
                                                                PieChartSectionData(
                                                                  value: 13,
                                                                  color: Colors.purple.shade300,
                                                                  title: '13%',
                                                                  titleStyle: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),
                                                                  radius: 60,
                                                                  showTitle: true,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              'Total',
                                                              style: TextStyle(
                                                                fontSize: 24,
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            ),
                                                            Text(
                                                              '2428',
                                                              style: TextStyle(
                                                                fontSize: 22,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 7,
                                                            backgroundColor:
                                                            Colors.blue,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            "PROJECT NOT STARTED",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontFamily:
                                                                FontFamily
                                                                    .sfPro,
                                                                fontSize: 16),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 7,
                                                            backgroundColor:
                                                            Colors.yellow,
                                                          ),
                                                          SizedBox(
                                                            width: 8,
                                                          ),
                                                          Text(
                                                            "PROJECT ON HOLD",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                                fontFamily:
                                                                FontFamily
                                                                    .sfPro,
                                                                fontSize: 16),
                                                          )
                                                        ],
                                                      ),



                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor:
                                                        Colors.red,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "PROJECT  IN PROGRESS",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            FontFamily
                                                                .sfPro,
                                                            fontSize: 16),
                                                      ) ,
                                                      Spacer(),

                                                      CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor:
                                                        Colors.purple,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "SERVICE  RUNNING",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            FontFamily
                                                                .sfPro,
                                                            fontSize: 16),
                                                      )


                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      CircleAvatar(
                                                        radius: 7,
                                                        backgroundColor:
                                                        AllColors.thinPurple,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Text(
                                                        "NO SERVICES",
                                                        style: TextStyle(
                                                            fontWeight:
                                                            FontWeight
                                                                .w500,
                                                            fontFamily:
                                                            FontFamily
                                                                .sfPro,
                                                            fontSize: 16),
                                                      ) ,
                                                      Spacer(),


                                                    ],
                                                  ),

                                                ],
                                              );




                                            }),
                                          ],
                                        ),

                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      }),
    );

  }
  Widget _buildLeadItem(String count, String source, Color color, EdgeInsets margin, String name) {
    return Expanded(
      child: Container(
        margin: margin,
        child: Stack(
          children: [
            ContainerUtils(
              paddingBottom: 8,
              paddingTop: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        count,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.sfPro,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.sfPro,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    source,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.sfPro,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: 7,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


class SourceData {
  final String source;
  final int count;
  final Color color;

  SourceData({required this.source, required this.count, required this.color});
}