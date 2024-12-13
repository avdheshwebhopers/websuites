import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../resources/imageStrings/image_strings.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/button/CustomButton.dart';
import '../../../utils/components/buttons/common_button.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/repositories.dart';
import '../../../../utils/utils.dart';
import '../../../viewModels/tasks/master/task_master_list_view_model.dart';

class TaskMasterScreen extends StatefulWidget {
  const TaskMasterScreen({super.key});

  @override
  State<TaskMasterScreen> createState() => _TaskMasterScreenState();
}

class _TaskMasterScreenState extends State<TaskMasterScreen> {
  final TaskMasterListViewModel _viewModel = Get.put(TaskMasterListViewModel());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.fetchTaskMaster(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (_viewModel.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final taskMaster = _viewModel.taskMasterData.value;
        if (taskMaster == null) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset('assets/icons/notfound.png',height: 300,width: 300,),
              const Text("No Permission"),
            ],
          ));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 8.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            taskMaster.name ?? "No Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: FontFamily.sfPro,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 1),
                            decoration: BoxDecoration(
                              color: taskMaster.status == true
                                  ? AllColors.background_green
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              taskMaster.status == true ? 'Active' : 'Inactive',
                              style: TextStyle(
                                color: taskMaster.status == true
                                    ? AllColors.text__green
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(ImageStrings.dateCalender, height: 14, width: 14),
                          Text(
                            '    ${taskMaster.created_at ?? "N/A"}',
                            style: TextStyle(
                              color: AllColors.mediumPurple,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Image.asset('assets/icons/edit.png', height: 15, width: 14),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
