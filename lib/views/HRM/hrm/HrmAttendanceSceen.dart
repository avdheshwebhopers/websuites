import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'dart:math' as math;

import '../../../resources/textStyles/text_styles.dart';

class HrmAttendanceController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedMonthIndex = 0.obs; // Add this for month selection
  var currentTime = ''.obs;
  Timer? timer;
  final RxBool _open = false.obs;

  bool get isOpen => _open.value;

  void toggleFab() {
    _open.toggle();
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    updateTime();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateTime();
    });
  }

  void updateTime() {
    currentTime.value = DateFormat('hh:mm:ss a').format(DateTime.now());
  }
}

class HrmAttendanceScreen extends StatelessWidget {
  const HrmAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HrmAttendanceController controller =
        Get.put(HrmAttendanceController());
    final List<String> months = [
      'Jan',
      'Dec',
      'Nov',
      'Oct',
      'Sep',
      'Aug',
      'Jul',
      'Jun',
      'May',
      'Apr',
      'Mar',
      'Feb'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HRM",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.sfPro,
                  fontSize: 18),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => controller.selectedIndex.value = 0,
                        child: Obx(() => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value == 0
                                    ? AllColors.mediumPurple
                                    : AllColors.textField2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextStyles.w400_15(
                                color: controller.selectedIndex.value == 0
                                    ? Colors.white
                                    : Colors.black,
                                context,
                                "Attendance",
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectedIndex.value = 1,
                        child: Obx(() => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value == 1
                                    ? AllColors.mediumPurple
                                    : AllColors.textField2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextStyles.w400_15(
                                color: controller.selectedIndex.value == 1
                                    ? Colors.white
                                    : Colors.black,
                                context,
                                "Datewise",
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () => controller.selectedIndex.value = 2,
                        child: Obx(() => Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value == 2
                                    ? AllColors.mediumPurple
                                    : AllColors.textField2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: TextStyles.w400_15(
                                color: controller.selectedIndex.value == 2
                                    ? Colors.white
                                    : Colors.black,
                                context,
                                "User Activities",
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Obx(() {
                      if (controller.selectedIndex.value == 0) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Holidays Section
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15, right: 15),
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
                                  child: Row(
                                    children: [
                                      Text(
                                        "Holidays",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: FontFamily.sfPro,
                                        ),
                                      ),
                                      Spacer(),
                                      Image.asset(
                                        'assets/icons/celebration.png',
                                        height: 40,
                                        width: 39,
                                      ),
                                      SizedBox(width: 15),
                                      InkWell(
                                        onTap: () {},
                                        child: Text(
                                          "View All",
                                          style: TextStyle(
                                              fontFamily: FontFamily.sfPro,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Actions Section
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15, right: 15),
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
                                            "Actions",
                                            style: TextStyle(
                                                fontFamily: FontFamily.sfPro,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Obx(() => Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  border: Border.all(
                                                      color:
                                                          AllColors.textField2),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8),
                                                  child: Text(
                                                    controller
                                                        .currentTime.value,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FontFamily.sfPro,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Spacer(),
                                          CommonButton(
                                            icon: Icon(
                                              Icons.arrow_drop_down_sharp,
                                              color: AllColors.whiteColor,
                                            ),
                                            height: 35,
                                            width: 95,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: AllColors.mediumPurple,
                                            title: 'Clock In',
                                            onPress: () {
                                              controller.toggleFab();
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        "Wed, Jan 22, 2025",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: FontFamily.sfPro),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),

                                // Attendance Logs Section
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15, left: 15, right: 15),
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
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Attendance Logs',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: FontFamily.sfPro,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Obx(() => Expanded(
                                              child: Row(
                                                children: months
                                                    .asMap()
                                                    .entries
                                                    .map((entry) {
                                                  int idx = entry.key;
                                                  String month = entry.value;
                                                  bool isSelected = idx ==
                                                      controller
                                                          .selectedMonthIndex
                                                          .value;

                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: InkWell(
                                                      onTap: () {
                                                        controller
                                                            .selectedMonthIndex
                                                            .value = idx;
                                                      },
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 12,
                                                          vertical: 6,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: isSelected
                                                              ? AllColors
                                                                  .lightestPurple
                                                              : Colors
                                                                  .grey[200],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        child: Text(
                                                          month,
                                                          style: TextStyle(
                                                              color: isSelected
                                                                  ? AllColors
                                                                      .mediumPurple
                                                                  : Colors
                                                                      .black87,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            )),
                                      ),
                                      const SizedBox(height: 20),

                                      // Month-Specific Content
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Obx(() => Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 15,
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
                                                'Attendance for ${months[controller.selectedMonthIndex.value]}',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: FontFamily.sfPro,
                                                ),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Divider(
                                            thickness: 0.4,
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/date.png',
                                                height: 17,
                                                width: 17,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Dec 31, Tue',
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              Spacer(),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AllColors
                                                            .greenJungle),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Icon(
                                                  Icons.check,
                                                  color: AllColors.greenJungle,
                                                  size: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Effective Hours : ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro),
                                              ),
                                              Text(
                                                '9h 5m',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    color: AllColors.figmaGrey),
                                              ),
                                              Spacer(),
                                              // Image.asset('assets/icons/arrival.png',height: 20,width: 20,),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "On Time",
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Gross Hours : ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro),
                                              ),
                                              Text(
                                                '9h 5m',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    color: AllColors.figmaGrey),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(height: 10),
                                          Divider(
                                            thickness: 0.4,
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Image.asset(
                                                'assets/icons/date.png',
                                                height: 17,
                                                width: 17,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'Dec 31, Tue',
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: AllColors
                                                            .greenJungle),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Icon(
                                                  Icons.check,
                                                  color: AllColors.greenJungle,
                                                  size: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Effective Hours : ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro),
                                              ),
                                              Text(
                                                '9h 5m',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    color: AllColors.figmaGrey),
                                              ),
                                              Spacer(),
                                              // Image.asset('assets/icons/arrival.png',height: 20,width: 20,),
                                              // SizedBox(width: 5,),      Text("On Time",style: TextStyle(fontFamily: FontFamily.sfPro,fontWeight: FontWeight.w500,fontSize: 14),)
                                              Text(
                                                '0:02:48 late',
                                                style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Gross Hours : ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro),
                                              ),
                                              Text(
                                                '9h 5m',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    color: AllColors.figmaGrey),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      } else if (controller.selectedIndex.value == 1) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(vertical: 0),
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15, right: 15),
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
                                    children: [
                                      Row(
                                        children: [
                                          Text("Attendance logs(Datewise)",style: TextStyle(fontWeight: FontWeight.w600,fontFamily: FontFamily.sfPro,fontSize: 18),),
                                          Spacer(),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      CreateNewLeadScreenCard(hintText: 'Search For User'),
                                      SizedBox(height: 5,),
                                      CreateNewLeadScreenCard(hintText: 'Select Date',isDateField: true,),
                                      SizedBox(height: 5,),
                                      Divider(thickness: 0.4,),
                                      SizedBox(height: 5,),
                                      Center(child: Icon(Icons.do_not_disturb_on_outlined,size: 40,color: AllColors.vividRed,)),
                                      Center(child: Text('Data Not Found'))
                                      
                                    ],
                                  ))
                            ],
                          ),
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextStyles.w400_15(
                                color: Colors.black,
                                context,
                                "User Activities"),

                            Center(child: Icon(Icons.do_not_disturb_on_outlined,size: 40,color: AllColors.vividRed,)),
                            Center(child: Text('Data Not Found'))
                          ],
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 305,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() => controller.isOpen
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildActionButton(
                              // icon: Icons.web,
                              label: 'Web Clock-In',
                              onPressed: () {
                                controller.toggleFab();
                                print('Web Clock-In pressed');
                              },
                            ),
                            _buildActionButton(
                              // icon: Icons.computer,
                              label: 'Remote Clock-In',
                              onPressed: () {
                                controller.toggleFab();
                                print('Remote Clock-In pressed');
                              },
                            ),
                            _buildActionButton(
                              // icon: Icons.add_home_work_outlined,
                              label: 'Work From Home',
                              onPressed: () {
                                controller.toggleFab();
                                print('Work From Home pressed');
                              },
                            ),
                            _buildActionButton(
                              // icon: Icons.shopping_bag_outlined,
                              label: 'On Duty',
                              onPressed: () {
                                controller.toggleFab();
                                print('On Duty pressed');
                              },
                            ),
                            _buildActionButton(
                              // icon: Icons.watch_later_outlined,
                              label: 'Partial Day Request',
                              onPressed: () {
                                controller.toggleFab();
                                print('Partial Day Request pressed');
                              },
                            ),
                            _buildActionButton(
                              // icon: Icons.my_library_books_outlined,
                              label: 'Attendance Policy',
                              onPressed: () {
                                controller.toggleFab();
                                print('Attendance Policy pressed');
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink()),

                  // Obx(() =>
                  //     FloatingActionButton(
                  //       shape: const CircleBorder(),
                  //       backgroundColor: AllColors.mediumPurple,
                  //       onPressed: controller.toggleFab,
                  //       child: Icon(
                  //         controller.isOpen ? Icons.close : Icons.lock_clock,color: AllColors.whiteColor,
                  //       ),
                  //     )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    // required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: AllColors.lighterPurple,
              // color:AllColors.whiteColor,

              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: FontFamily.sfPro,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          // FloatingActionButton(
          //   backgroundColor: AllColors.mediumPurple,
          //   mini: true,
          //   onPressed: onPressed,
          //   child: Icon(icon, color: AllColors.whiteColor),
          // ),
        ],
      ),
    );
  }
}
