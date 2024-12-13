import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/views/reports/taskreport/taskdetails/projectoverview/ProjectOverView.dart';
import '../../../../../utils/datetrim/DateTrim.dart';
import '../../../../../views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../../resources/strings/strings.dart';
import '../../../../resources/textStyles/text_styles.dart';
import '../../../../utils/fontfamily/FontFamily.dart';
import '../../../../utils/responsive/bodies/Responsive.dart';
import '../../../../viewModels/leadScreens/createNewLead/assignedLeadTo/assigned_lead_to_viewModel.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> taskItem; // Accepting task data

  const TaskDetailsScreen({super.key, required this.taskItem});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  bool isStarted = false;
  final AssignedLeadToViewModel _assignedLeadToController =
      Get.put(AssignedLeadToViewModel());

  @override
  void initState() {
    super.initState();

    //
    // _assignedLeadToController
    //     .fetchAssignedLeads(context); // Ensure this is called
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Task Report',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  padding: const EdgeInsets.only(
                      top: 0, left: 14, right: 14, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.arrow_back_outlined, size: 22),
                              const SizedBox(width: 8),
                              Text(
                                'Task',
                                style: TextStyles
                                    .w400_12_Black, // Use the static TextStyle directly
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.edit_outlined,
                                  color: Colors.black, size: 16),
                              IconButton(
                                icon: const Icon(Icons.copy,
                                    color: Colors.black, size: 13),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(thickness: 0.5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Task Duration : ',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily
                                  .sfPro, // Correctly references FontFamily.sfPro
                            ),
                          ),
                          Text(widget.taskItem['duration'] ?? 'N/A',
                              style: const TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.sfPro,
                              )),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                // Toggle the state when tapped
                                isStarted = !isStarted;
                              });
                              print(
                                  isStarted ? "Task Started" : "Task Stopped");
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 2.5),
                              decoration: BoxDecoration(
                                color: isStarted
                                    ? Colors.red
                                    : AllColors
                                        .greenJungle, // Change color based on state
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                isStarted ? 'Stop' : 'Start',
                                // Change text based on state
                                style: TextStyle(
                                  color: AllColors.whiteColor,
                                  fontSize: 14,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'End On - ',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.sfPro),
                              ),
                              Text(
                                formatDate(widget.taskItem['endOn']),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                    color: AllColors.figmaGrey),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Start On - ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.sfPro),
                              ),
                              Text(
                                formatDate(widget.taskItem['startOn']),
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: FontFamily.sfPro,
                                    color: AllColors.figmaGrey),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Task Type - ',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AllColors.blackColor,
                                  fontFamily: FontFamily.sfPro),
                              children: [
                                TextSpan(
                                  text: widget.taskItem['taskType'] ?? 'N/A',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AllColors.figmaGrey,
                                    fontFamily: FontFamily.sfPro,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                const Text(
                                  'Subject - ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontFamily.sfPro,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      widget.taskItem['subject'] ??
                                          'No task subject',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AllColors.vividPurple,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: FontFamily.sfPro),
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            flex: 0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Status - ',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: FontFamily.sfPro,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  widget.taskItem['status'] ?? 'N/A',
                                  style: TextStyle(
                                      color: AllColors.greenishYellow,
                                      fontSize: 14,
                                      fontFamily: FontFamily.sfPro),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Deadline - ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.taskItem['deadline'] ?? 'N/A',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Priority -   ',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1.8),
                                decoration: BoxDecoration(
                                  color: AllColors.thinOrange,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  widget.taskItem['priority'] != null &&
                                          widget.taskItem['priority'].isNotEmpty
                                      ? '${widget.taskItem['priority'][0].toUpperCase()}${widget.taskItem['priority'].substring(1)}'
                                      : 'N/A',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AllColors.darkYellow,
                                    fontFamily: FontFamily.sfPro,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Text(
                            'Assigned To - ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            flex: 9,
                            child: Text(
                              widget.taskItem['assignedTo'] ?? 'N/A',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w400,
                                  color: AllColors.figmaGrey),
                              overflow: TextOverflow.ellipsis,
                              // Ensure text is ellipsed if too long
                              softWrap:
                                  true, // Allows text to wrap onto next line if too long
                            ),
                          ),
                          Spacer(),
                          const Text(
                            'Created By - ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            flex: 9,
                            child: Text(
                              widget.taskItem['createdBy'] ?? 'N/A',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w400,
                                  color: AllColors.figmaGrey),
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  padding: const EdgeInsets.only(
                      top: 13, left: 14, right: 14, bottom: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Related to Project',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            'assets/icons/edit.png',
                            color: AllColors.darkGrey,
                            height: 17,
                            width: 16,
                          )
                        ],
                      ),
                      Divider(thickness: 0.5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Project name - ',
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: FontFamily.sfPro,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            flex: 8,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectOverview(
                                      projectId: widget.taskItem['projectId'] ??
                                          '', // Ensure this is the correct projectId
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                widget.taskItem['projectName'] ?? 'N/A',
                                style: TextStyle(
                                  fontSize: 17,
                                  color: AllColors.vividPurple,
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Start Date - ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.sfPro),
                              ),
                              Text(widget.taskItem['projectStartDate'] ?? 'N/A',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.sfPro,
                                      color: AllColors.figmaGrey))
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'End Date - ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.sfPro),
                              ),
                              Text(widget.taskItem['projectEndDate'] ?? 'N/A',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: FontFamily.sfPro,
                                      color: AllColors.figmaGrey))
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Container(
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    padding: const EdgeInsets.only(
                        top: 13, left: 14, right: 14, bottom: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add New Remark',
                            style: TextStyle(
                                fontSize: 16.5,
                                fontFamily: FontFamily.sfPro,
                                fontWeight: FontWeight.w700)),
                        Divider(height: 32, thickness: 0.5),
                        Text('Remark',
                            style: TextStyle(
                                color: AllColors.figmaGrey, fontSize: 15.0)),
                        Container(
                          margin: const EdgeInsets.only(top: 5),
                          height: ResponsiveUtils.isMobile(context)
                              ? MediaQuery.of(context).size.height /
                                  12 // Increased height
                              : MediaQuery.of(context).size.height /
                                  8, // Increased height
                          width: double.infinity,
                          child: TextFormField(
                            maxLines: null,
                            // Allow multiple lines
                            expands: true,
                            // Expand to fill container
                            textAlignVertical: TextAlignVertical.top,
                            // Align text to top
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 10,
                                  top: 15, // Add more top padding
                                  right: 10,
                                  bottom: 10),
                              hintText: 'Remark...',
                              hintStyle: TextStyle(
                                fontSize: 14, // Slightly larger font
                                color: AllColors.lighterGrey,
                              ),
                              hintMaxLines: 3,
                              // Allow hint to wrap
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AllColors.lightGrey,
                                  width: 0.3,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AllColors.mediumPurple,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: AllColors.lightGrey,
                                  width: 0.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          // Adjust the value as needed
                          child: const Text(
                            'Notified To',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 16.0),
                          ),
                        ),
                        CreateNewLeadScreenCard(
                          hintText: _assignedLeadToController
                                  .selectedLeadName.value.isEmpty
                              ? Strings.select
                              : _assignedLeadToController
                                  .selectedLeadName.value,
                          categories: _assignedLeadToController.namesOnlyRxList,
                          // Use names only list
                          onCategoryChanged: (selectedCategory) {
                            // Handle selection for only first and last name
                            final names =
                                selectedCategory.split(' '); // Split by space
                            if (names.length >= 2) {
                              final firstName = names[0];
                              final lastName = names[1];
                              _assignedLeadToController.selectedLeadName.value =
                                  '$firstName $lastName';
                            }
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AllColors.greenJungle,
                            minimumSize: Size(0, 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  19), // Adjust the radius as needed
                            ),
                          ),
                          child: Text(
                            'Create',
                            style: TextStyle(
                              color: AllColors.whiteColor,
                              fontSize: 12,
                              fontFamily: FontFamily.sfPro,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
