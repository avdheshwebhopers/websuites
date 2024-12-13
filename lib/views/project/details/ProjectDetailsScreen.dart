import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/models/responseModels/projects/list/details/ProjectDetailsResponseModels.dart';
import '../../../resources/strings/strings.dart';

import '../../../utils/button/CustomButton.dart';
import '../../../utils/components/buttons/common_button2.dart';
import '../../../utils/fontfamily/FontFamily.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/datetrim/DateTrim.dart';
import '../../../viewModels/leadScreens/createNewLead/assignedLeadTo/assigned_lead_to_viewModel.dart';
import '../../../viewModels/projects/details/ProjectDetailsViewModels.dart';
import '../../../viewModels/reports/task_report/project_overview/create_project_report_list/task_create_report_list_view_model.dart';
import '../../../viewModels/reports/task_report/project_overview/report_list/report_task_report_list.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:file_picker/file_picker.dart';

class ProjectDetailsController extends GetxController {
  final RxList<Map<String, dynamic>> addedRows = <Map<String, dynamic>>[].obs;

  final RxBool loading = true.obs; // Start with loading as true
  final RxString fileName =
      'No file chosen'.obs; // Initialize with default text

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final AssignedLeadToViewModel _assignedLeadToController =
      Get.put(AssignedLeadToViewModel());
  final ProjectDetailViewModel _viewModel = Get.find<ProjectDetailViewModel>();

  final TaskReportListViewModel reportController =
      Get.put(TaskReportListViewModel());
  final TaskCreateReportListViewModel viewModel =
      Get.put(TaskCreateReportListViewModel());

  final TextEditingController _startDateController = TextEditingController();

  TextEditingController get startDateController => _startDateController;

  String projectId;

  ProjectDetailsController(this.projectId);

  bool showAttachmentError = false;

  void _initControllers(BuildContext context) {
    _assignedLeadToController
        .fetchAssignedLeads(context); // Ensure this is called
  }

  void clearStartDate() {
    _startDateController.clear();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProjectDetails();
    fetchTaskReports();
    addedRows.add({'month': null, 'day': null});
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      fileName.value = result.files.single.name; // Update the fileName directly
    } else {
      fileName.value =
          'No file chosen'; // Reset to default text if no file is picked
    }
    // Notify listeners about the change
    update(); // This will notify the UI to rebuild
  }

  String? _validateAttachment(String? value) {
    if (fileName.value.isEmpty) {
      return 'Attachment is required';
    }
    return null;
  }

  Future<void> fetchProjectDetails() async {
    try {
      loading.value = true; // Set loading to true while fetching
      await _viewModel.projectDetailView(Get.context!, projectId);
    } finally {
      loading.value = false; // Set loading to false after fetching data
    }
  }

  Future<void> fetchTaskReports() async {
    try {
      reportController.loading.value =
          true; // Set loading to true while fetching
      await reportController.fetchTaskProjectReportList(Get.context!);
    } finally {
      reportController.loading.value =
          false; // Set loading to false after fetching data
    }
  }

  // Method to refresh project details
  Future<void> refreshList(BuildContext context) async {
    await fetchProjectDetails(); // Re-fetch the project details
  }

  void addNewRow() {
    if (addedRows.length < 3) {
      addedRows.add({'month': null, 'day': null});
    }
  }

  void removeRow(int index) {
    addedRows.removeAt(index);
  }

  void updateMonth(int index, String month) {
    addedRows[index]['month'] = month;
    addedRows.refresh();
  }

  void updateDay(int index, String day) {
    addedRows[index]['day'] = day;
    addedRows.refresh();
  }

  bool get canAddMore => addedRows.length < 3;

  ProjectDetailResponseModel? get projectDetail =>
      _viewModel.projectDetail.value;
}

class ProjectDetailsScreen extends GetView<ProjectDetailsController> {
  final String projectId;
  final RxString fileName =
      'No file chosen'.obs; // Initialize with default text
  String? _fileName;
  final _formKey = GlobalKey<FormState>();
  final selectedTab = 'Overview'.obs;
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  String title = '';
  String description = '';
  DateTime? startDate;
  DateTime? endDate;
  List<String> ccTo = [];
  Map<String, dynamic>? attachment;

  final AssignedLeadToViewModel _assignedLeadToController =
      Get.put(AssignedLeadToViewModel());
  ValueNotifier<String> selectedReportTab =
      ValueNotifier<String>('ProjectReport');

  ProjectDetailsScreen({Key? key, required this.projectId}) : super(key: key) {
    Get.put(ProjectDetailViewModel());
    Get.put(TaskReportListViewModel());
    Get.put(TaskCreateReportListViewModel()); // Ensure this is registered
    Get.put(ProjectDetailsController(projectId));
  }

  final TaskCreateReportListViewModel viewModel =
      Get.put<TaskCreateReportListViewModel>(TaskCreateReportListViewModel());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text("Project Details"),
      ),
      body: Obx(() {
        // Accessing loading state from the controller
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        // Check if project detail is null
        if (controller.projectDetail == null) {
          return const Center(child: Text("No project details found"));
        }
        return RefreshIndicator(
          onRefresh: () async {
            await controller.refreshList(Get.context!);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Overview Tab
                      Expanded(
                        child: Obx(() => GestureDetector(
                              onTap: () => selectedTab.value = 'Overview',
                              child: Container(
                                height: Get.height / 30,
                                decoration: BoxDecoration(
                                  color: selectedTab.value == 'Overview'
                                      ? AllColors.mediumPurple
                                      : AllColors.textField2,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Overview',
                                    style: TextStyle(
                                      color: selectedTab.value == 'Overview'
                                          ? AllColors.whiteColor
                                          : AllColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(width: 8),
                      // Task Tab
                      Expanded(
                        child: Obx(() => GestureDetector(
                              onTap: () => selectedTab.value = 'Task',
                              child: Container(
                                height: Get.height / 30,
                                decoration: BoxDecoration(
                                  color: selectedTab.value == 'Task'
                                      ? AllColors.mediumPurple
                                      : AllColors.textField2,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'Task',
                                    style: TextStyle(
                                      color: selectedTab.value == 'Task'
                                          ? AllColors.whiteColor
                                          : AllColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      const SizedBox(width: 8),
                      // Sequential Task Tab
                      Expanded(
                        child: Obx(() => GestureDetector(
                              onTap: () => selectedTab.value = 'SequentialTask',
                              child: Container(
                                height: Get.height / 30,
                                decoration: BoxDecoration(
                                  color: selectedTab.value == 'SequentialTask'
                                      ? AllColors.mediumPurple
                                      : AllColors.textField2,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    'SequentialTask',
                                    style: TextStyle(
                                      color:
                                          selectedTab.value == 'SequentialTask'
                                              ? AllColors.whiteColor
                                              : AllColors.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() {
                    final projectDetail = controller.projectDetail;
                    switch (selectedTab.value) {
                      case 'Overview':
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 0, right: 0, top: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 30),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: const Icon(
                                              Icons.arrow_back_outlined,
                                              size: 20,
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Flexible(
                                            flex: 9,
                                            child: Text(
                                              '${projectDetail?.project?.projectName ?? 'No project data'}',
                                              style: const TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 2),
                                            decoration: BoxDecoration(
                                              color: Color(0x1F47BD82),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: const Text(
                                              'Activation Sent',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF47BD82),
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons.mode_edit_outline_outlined,
                                            size: 16,
                                          ),
                                        ],
                                      ),
                                      const Divider(thickness: 0.5),
                                      Row(
                                        children: [
                                          const Text(
                                            'Project Overview',
                                            style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: FontFamily.sfPro),
                                          ),
                                          const Spacer(),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AllColors.darkOrange,
                                              minimumSize: const Size(0, 20),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18,
                                                      vertical: 4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(19),
                                              ),
                                            ),
                                            child:
                    Text(
                                              '${projectDetail?.project?.status}',
                                              style: TextStyle(
                                                color: AllColors.whiteColor,
                                                fontSize: 12,
                                                fontFamily: FontFamily.sfPro,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'Billing Type - ',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '${projectDetail?.project?.billingType}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          // Add spacing between rows
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Customer - ',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily:
                                                        FontFamily.sfPro,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '${projectDetail?.project?.customer?.firstName ?? ''} '
                                                  '${projectDetail?.project?.customer?.lastName ?? ''}',
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          const Text(
                                            'Created - ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: FontFamily.sfPro,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(formatShortDate(projectDetail
                                              ?.project?.createdAt
                                              .toString())),
                                          const Spacer(),
                                          const Text(
                                            'Start Date - ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: FontFamily.sfPro,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(formatShortDate(projectDetail
                                              ?.project?.startDate
                                              .toString())),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          const Text(
                                            'Deadline - ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: FontFamily.sfPro,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(formatShortDate(
                                              '${projectDetail?.project?.deadline ?? 'N/A'}')),
                                          const Spacer(),
                                          const Text(
                                            'Total Estimated Hours - ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: FontFamily.sfPro,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                              '${projectDetail?.project?.estimatedHours ?? 'N/A'}')
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Company Phone - ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          Text(
                                              '${projectDetail?.project?.company?.companyPhone ?? 'N/A'}'),
                                          const Spacer(),
                                          const Text(
                                            'Tags - ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7,
                                                      vertical: 3),
                                              decoration: BoxDecoration(
                                                color: AllColors.thinOrange,
                                                borderRadius:
                                                    BorderRadius.circular(19),
                                              ),
                                              child: Text(
                                                (projectDetail?.project?.tags !=
                                                            null &&
                                                        projectDetail!.project!
                                                            .tags.isNotEmpty)
                                                    ? projectDetail!
                                                        .project!.tags
                                                        .map((tag) => tag.name)
                                                        .join(', ')
                                                    : 'N/A',
                                                style: TextStyle(
                                                  color: AllColors.darkYellow,
                                                  fontSize: 12,
                                                  fontFamily: FontFamily.sfPro,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text(
                                            'Company Name - ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                              '${projectDetail?.project?.company?.companyName ?? 'N/A'}'),
                                        ],
                                      ),
                                      Text(
                                        '${projectDetail?.project?.company?.companyEmail ?? 'N/A'}',
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Text(
                                            'Contact Person Name - ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '${projectDetail?.project?.company?.contactPersonName ?? 'N/A'}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: FontFamily.sfPro,
                                              color: AllColors.mediumPurple,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: [
                                              const Text(
                                                ' Total Rate - ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Text(
                                                ' ${projectDetail?.project?.totalRate ?? 'N/A'}',
                                                style: const TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Members',
                                            style: TextStyle(
                                              fontFamily: FontFamily.sfPro,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            height: 15,
                                            width: 100,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: (projectDetail
                                                          ?.project?.members ??
                                                      [])
                                                  .asMap()
                                                  .entries
                                                  .map((entry) {
                                                int index = entry.key;
                                                var member = entry.value;

                                                List<Color> memberColors = [
                                                  Colors.purple,
                                                  Colors.pink,
                                                  Colors.blue,
                                                  Colors.yellow,
                                                ];

                                                String firstInitial = (member
                                                            .firstName
                                                            ?.isNotEmpty ==
                                                        true)
                                                    ? member.firstName![0]
                                                    : 'N';

                                                Color avatarColor =
                                                    member.profilePic == null
                                                        ? memberColors[index %
                                                            memberColors.length]
                                                        : Colors.transparent;

                                                return Positioned(
                                                  left: index *
                                                      (screenWidth / 30),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      print(
                                                          'Avatar for ${member.firstName} ${member.lastName} tapped!');
                                                    },
                                                    child: CircleAvatar(
                                                      radius: screenWidth / 45,
                                                      backgroundColor:
                                                          avatarColor.withOpacity(
                                                              member.profilePic ==
                                                                      null
                                                                  ? 0.5
                                                                  : 0),
                                                      backgroundImage: member
                                                                  .profilePic !=
                                                              null
                                                          ? NetworkImage(member
                                                              .profilePic!)
                                                          : null,
                                                      child: member
                                                                  .profilePic ==
                                                              null
                                                          ? Text(
                                                              firstInitial
                                                                  .toUpperCase(),
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            )
                                                          : null,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),

                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 10, left: 10, right: 10, bottom: 0),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Task Overview",
                                        style: TextStyle(
                                          fontFamily: FontFamily.sfPro,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const Divider(
                                        thickness: 0.5,
                                      ),
                                      LayoutBuilder(
                                        builder: (context, constraints) {
                                          // Helper function to get grid configuration based on screen width
                                          Map<String, dynamic> getGridConfig(
                                              double width) {
                                            if (width < 500) {
                                              return {
                                                'crossAxisCount': 2,
                                                'childAspectRatio': 2.2,
                                                'containerHeightFactor': 0.35,
                                              };
                                            } else if (width < 1024) {
                                              return {
                                                'crossAxisCount': 2,
                                                'childAspectRatio': 4.5,
                                                'containerHeightFactor': 0.25,
                                              };
                                            } else {
                                              return {
                                                'crossAxisCount': 3,
                                                'childAspectRatio': 4.5,
                                                'containerHeightFactor': 0.2,
                                              };
                                            }
                                          }

                                          final gridConfig =
                                          getGridConfig(constraints.maxWidth);

                                          return GridView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                              gridConfig['crossAxisCount'],
                                              // Use a responsive crossAxisCount
                                              childAspectRatio:
                                              gridConfig['childAspectRatio'],
                                              // Use a responsive aspect ratio
                                              crossAxisSpacing: 12,
                                              mainAxisSpacing: 12,
                                            ),
                                            itemCount:
                                            (projectDetail?.tasks?.standard.length ??
                                                0) +
                                                1,
                                            // Add 1 to itemCount
                                            itemBuilder: (context, index) {
                                              if (index ==
                                                  (projectDetail?.tasks?.standard
                                                      ?.length ??
                                                      0)) {
                                                return Container(
                                                  height: constraints.maxWidth *
                                                      gridConfig['containerHeightFactor'],
                                                  // Responsive container height
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(8.0),
                                                    border: Border.all(
                                                        color: Colors.grey,
                                                        width: 0.2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                        Colors.grey.withOpacity(0.1),
                                                        blurRadius: 8.0,
                                                        spreadRadius: 2.0,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            const Text(
                                                              'Others',
                                                              // Show the task count for others
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                fontFamily: 'SFPro',
                                                              ),
                                                            ),
                                                            Text(
                                                              '${projectDetail?.tasks
                                                                  ?.others?.count ??
                                                                  0}',
                                                              style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w700,
                                                                fontFamily: 'SFPro',
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Stack(
                                                          alignment: Alignment.center,
                                                          children: [
                                                            // Grey background circle (100%)
                                                            SizedBox(
                                                              height: 44.0,
                                                              width: 44.0,
                                                              child:
                                                              CircularProgressIndicator(
                                                                color: AllColors
                                                                    .greyGoogleForm,
                                                                value: 1.0,
                                                                strokeWidth: 8,
                                                                valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                                    AllColors
                                                                        .greyGoogleForm),
                                                              ),
                                                            ),
                                                            // Blue progress circle (over the gray one)
                                                            SizedBox(
                                                              height: 44.0,
                                                              width: 44.0,
                                                              child:
                                                              CircularProgressIndicator(
                                                                value: projectDetail?.tasks?.others?.count != null
                                                                    ? (projectDetail!.tasks!.others!.count! / 100.0).clamp(0.0, 1.0) // Ensure the value is between 0.0 and 1.0
                                                                    : 0.0, // Default to 0.0 if count is null
                                                                strokeWidth: 8,
                                                                valueColor: AlwaysStoppedAnimation<Color>(AllColors.darkBlue),
                                                              ),
                                                            ),
                                                            // Centered text displaying percentage
                                                            Text(
                                                              '${projectDetail?.tasks
                                                                  ?.others?.count ??
                                                                  0}%',
                                                              // Show the percentage
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                fontFamily: 'SFPro',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }

                                              // Regular task item
                                              final task =
                                              projectDetail?.tasks!.standard![index];
                                              return Container(
                                                height: constraints.maxWidth *
                                                    gridConfig['containerHeightFactor'],
                                                // Responsive container height
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(8.0),
                                                  border: Border.all(
                                                      color: Colors.grey, width: 0.2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey.withOpacity(
                                                          0.1),
                                                      blurRadius: 8.0,
                                                      spreadRadius: 2.0,
                                                    ),
                                                  ],
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              task?.statusName ??
                                                                  'No Status',
                                                              style: const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                FontWeight.w500,
                                                                fontFamily: 'SFPro',
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                            Text(
                                                              task?.tasks ??
                                                                  'No Task Name',
                                                              style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight.w700,
                                                                fontFamily: 'SFPro',
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 8),
                                                      Stack(
                                                        alignment: Alignment.center,
                                                        children: [
                                                          // Grey background circle (100%)
                                                          SizedBox(
                                                            height: 44.0,
                                                            width: 44.0,
                                                            child:
                                                            CircularProgressIndicator(
                                                              color: AllColors
                                                                  .greyGoogleForm,
                                                              value: 1.0,
                                                              strokeWidth: 8,
                                                              valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                                  AllColors
                                                                      .greyGoogleForm),
                                                            ),
                                                          ),
                                                          // Blue progress circle (over the gray one)
                                                          SizedBox(
                                                            height: 44.0,
                                                            width: 44.0,
                                                            child:
                                                            CircularProgressIndicator(
                                                              value: task?.tasks !=
                                                                  null
                                                                  ? getProgressValue(
                                                                  task?.tasks)
                                                                  : null,
                                                              strokeWidth: 8,
                                                              valueColor:
                                                              AlwaysStoppedAnimation<
                                                                  Color>(
                                                                  AllColors.darkBlue),
                                                            ),
                                                          ),
                                                          // Centered text displaying percentage
                                                          Text(
                                                            '${task?.tasks != null ? '${task!.tasks!}%' : 'No Task Name'}',
                                                            style: const TextStyle(
                                                              fontSize: 12,
                                                              fontWeight: FontWeight.bold,
                                                              fontFamily: 'SFPro',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
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
                                  child:
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Project Reminder Setting',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text(
                                        'Add Time',
                                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                      ),
                                      const SizedBox(height: 10),

                                      // Use a Container to hold the ListView
                                      Container(
                                        height: (controller.addedRows.length * 65).toDouble(), // Assuming each item takes about 60 pixels in height
                                        child: Obx(
                                              () => ListView.builder(
                                            itemCount: controller.addedRows.length,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(bottom: 15,),
                                                child:
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 40,

                                                          child: index == 0
                                                              ? IconButton(
                                                            icon: controller.canAddMore
                                                                ? const Icon(Icons.add, color: Colors.green)
                                                                : Icon(Icons.add_box_outlined, color: Colors.grey.shade300),
                                                            onPressed: controller.canAddMore
                                                                ? () {
                                                              controller.addNewRow(); // Add new row
                                                            }
                                                                : null,
                                                          )
                                                              : IconButton(
                                                            icon: const Icon(Icons.close, color: Colors.red),
                                                            onPressed: () => controller.removeRow(index),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10),
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    title: const Text("Select Month"),
                                                                    content: SingleChildScrollView(
                                                                      child: ListBody(
                                                                        children: controller.months.map((month) {
                                                                          return GestureDetector(
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                                                              child: Text(month),
                                                                            ),
                                                                            onTap: () {
                                                                              controller.updateMonth(index, month);
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          );
                                                                        }).toList(),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: Border.all(color: Colors.grey),
                                                              ),
                                                              child: Text(
                                                                controller.addedRows[index]['month'] ?? 'Select Month',
                                                                style: const TextStyle(color: Colors.grey),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 10),
                                                        Expanded(
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context: context,
                                                                builder: (BuildContext context) {
                                                                  return AlertDialog(
                                                                    title: const Text("Select Day"),
                                                                    content: SingleChildScrollView(
                                                                      child: ListBody(
                                                                        children: List.generate(31, (i) {
                                                                          return GestureDetector(
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                                                              child: Text((i + 1).toString()),
                                                                            ),
                                                                            onTap: () {
                                                                              controller.updateDay(index, (i + 1).toString());
                                                                              Navigator.of(context).pop();
                                                                            },
                                                                          );
                                                                        }),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(8),
                                                                border: Border.all(color: Colors.grey),
                                                              ),
                                                              child: Text(
                                                                controller.addedRows[index]['day'] ?? 'Select Day',
                                                                style: const TextStyle(color: Colors.grey),
                                                              ),
                                                            ),
                                                          ),
                                                        ),


                                                      ],
                                                    ),

                                                  ],
                                                ),

                                              );
                                            },
                                          ),
                                        ),
                                      ),

                                      Obx(() {
                                        if (_assignedLeadToController.loading.value) {
                                          return const CircularProgressIndicator();
                                        } else {
                                          return CreateNewLeadScreenCard(
                                            hintText: _assignedLeadToController
                                                .selectedLeadName.value.isEmpty
                                                ? Strings.select
                                                : _assignedLeadToController
                                                .selectedLeadName.value,
                                            categories:
                                            _assignedLeadToController.fullCategoriesRxList,
                                            onCategoryChanged: (selectedCategory) {
                                              // Handle selection for full names with emails
                                              final names =
                                              selectedCategory.split('\n')[0].split(' ');
                                              if (names.length >= 2) {
                                                final firstName = names[0];
                                                final lastName = names[1];
                                                _assignedLeadToController.selectedLeadName
                                                    .value = '$firstName $lastName';
                                              }
                                            },
                                            isMultiSelect: true,
                                            isForDivisions: true,
                                          );
                                        }
                                      }),
                                      const SizedBox(height: 15),
                                      CustomButton2(
                                        height: 25,
                                        width: 90,
                                        borderRadius: 30,
                                        child: Text(
                                          'Save Setting',
                                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                        ),
                                        color: Colors.green,
                                        onTap: () {},
                                      ),
                                      SizedBox(height: 60),

                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 8.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      ValueListenableBuilder<String>(
                                        valueListenable: selectedReportTab,
                                        builder: (context, selectedTab, _) {
                                          return Column(
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        selectedReportTab
                                                                .value =
                                                            'ProjectReport';
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 0,
                                                                vertical: 2),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedTab ==
                                                                  'ProjectReport'
                                                              ? AllColors
                                                                  .mediumPurple
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        child: Text(
                                                          'Project Report',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedTab ==
                                                                    'ProjectReport'
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        selectedReportTab
                                                                .value =
                                                            'Attachments';
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 0,
                                                                vertical: 2),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedTab ==
                                                                  'Attachments'
                                                              ? AllColors
                                                                  .mediumPurple
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        child: Text(
                                                          'Attachments',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedTab ==
                                                                    'Attachments'
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        selectedReportTab
                                                                .value =
                                                            'Credential';
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal: 12,
                                                                vertical: 2),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: selectedTab ==
                                                                  'Credential'
                                                              ? AllColors
                                                                  .mediumPurple
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(13),
                                                        ),
                                                        child: Text(
                                                          'Credential',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: selectedTab ==
                                                                    'Credential'
                                                                ? Colors.white
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const Divider(thickness: 0.5),
                                              if (selectedTab ==
                                                  'ProjectReport')
                                                Obx(() {
                                                  if (controller
                                                      .reportController
                                                      .loading
                                                      .value) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }
                                                  if (controller
                                                      .reportController
                                                      .reports
                                                      .isEmpty) {
                                                    return const Center(
                                                        child: Text(
                                                            'No reports available.'));
                                                  }
                                                  return SizedBox(
                                                    height: Get.height / 2,
                                                    // Set a fixed height for the scrollable area
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // Header section with the title and + icon
                                                        Row(
                                                          children: [
                                                            Text(
                                                              'Project Report List',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    FontFamily
                                                                        .sfPro,
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),
                                                            const Spacer(),
                                                            IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .add_circle_outline_sharp,
                                                                color: AllColors
                                                                    .greenJungle,
                                                                size: 18,
                                                              ),
                                                              onPressed: () {
                                                                _showDialog(
                                                                    context); // Function to show dialog
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        const Divider(
                                                            thickness: 0.5),
                                                        const SizedBox(
                                                            height: 8),
                                                        // Add some spacing between the header and the list
                                                        // Scrollable list section
                                                        Expanded(
                                                          child:
                                                              ListView.builder(
                                                            itemCount: controller
                                                                .reportController
                                                                .reports
                                                                .length,
                                                            itemBuilder:
                                                                (context,
                                                                    index) {
                                                              final report = controller
                                                                  .reportController
                                                                  .reports[index];
                                                              return Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const Text(
                                                                          'Project - '),
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          report.title ??
                                                                              'N/A',
                                                                          style:
                                                                              TextStyle(color: AllColors.greenJungle),
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          maxLines:
                                                                              1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      const Text(
                                                                        'Start Date - ',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                      Text(report.startDate !=
                                                                              null
                                                                          ? DateFormat('yyyy-MM-dd')
                                                                              .format(DateTime.parse(report.startDate!))
                                                                          : 'N/A'),
                                                                      const Spacer(),
                                                                      const Text(
                                                                        'End Date - ',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w600),
                                                                      ),
                                                                      Text(
                                                                        formatDateToYMD(
                                                                            report.endDate),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      const Text(
                                                                        'Created Date - ',
                                                                        style: TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                      ),
                                                                      Text(
                                                                        formatDateWithCustomFormat(
                                                                            report.createdAt),
                                                                        style:
                                                                            const TextStyle(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                      thickness:
                                                                          0.5),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                })
                                              else if (selectedTab ==
                                                  'Attachments')
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Add Attachments',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .add_circle_outline_sharp,
                                                        color: AllColors
                                                            .greenJungle,
                                                        size: 18,
                                                      ),
                                                      onPressed: () {
                                                        // Navigator.push(
                                                        //     context,
                                                        //     MaterialPageRoute(
                                                        //         builder:
                                                        //             (context) =>
                                                        //                 AddReportScreen()));
                                                      },
                                                    ),
                                                  ],
                                                )
                                              else if (selectedTab ==
                                                  'Credential')
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: const [
                                                    Text(
                                                      'Project Credentials',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16),
                                                    ),
                                                    Text('Sr No : -'),
                                                    Text('Title : -'),
                                                    Text('User  Name: -'),
                                                    Text('Password : -'),
                                                    Text(
                                                        'Url & Attachments : -'),
                                                  ],
                                                ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40,)
                              ],
                            ),
                          ),
                        );

                      case 'Task':
                        return const Center(
                          child: Text("Task Content:"),
                        );
                      case 'SequentialTask':
                        return const Center(
                          child: Text("Sequential Task Content"),
                        );
                      default:
                        return Container();
                    }
                  }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _showDialog(BuildContext context) {
    bool showAttachmentError = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child:
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 450,
                  width: MediaQuery.of(context).size.width * 0.9,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.9,
                  ),
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Report',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 16),
                                    Text('Title',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),

                                    CreateNewLeadScreenCard(
                                      containerPadding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      hintText: 'Enter Title',
                                      allowCustomBorderInput:
                                          BorderRadius.circular(8),
                                      maxLines: 5,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Title is required';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      onChanged: (value) {
                                        title = value;
                                      },
                                    ),

                                    SizedBox(height: 12),
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   children: [
                                    //     Expanded(
                                    //       child: Column(
                                    //         crossAxisAlignment: CrossAxisAlignment.start,
                                    //         children: [
                                    //           Text('Start Date *',
                                    //               style: TextStyle(
                                    //                   fontSize: 12,
                                    //                   fontWeight: FontWeight.bold)),
                                    //           TextFormField(
                                    //             controller: _startDateController,
                                    //             decoration: InputDecoration(
                                    //               hintText: 'Select start date',
                                    //               border: OutlineInputBorder(),
                                    //             ),
                                    //             validator: (value) {
                                    //               if (value == null || value.isEmpty) {
                                    //                 return 'Start date is required';
                                    //               }
                                    //               return null;
                                    //             },
                                    //             readOnly: true,
                                    //             onTap: () async {
                                    //               DateTime? pickedDate = await showDatePicker(
                                    //                 context: context,
                                    //                 initialDate: DateTime.now(),
                                    //                 firstDate: DateTime(2000),
                                    //                 lastDate: DateTime(2101),
                                    //               );
                                    //               if (pickedDate != null) {
                                    //                 startDate = pickedDate;
                                    //                 _startDateController.text =
                                    //                     DateFormat('yyyy-MM-dd')
                                    //                         .format(pickedDate);
                                    //               }
                                    //             },
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     SizedBox(width: 12),
                                    //     Expanded(
                                    //       child: Column(
                                    //         crossAxisAlignment: CrossAxisAlignment.start,
                                    //         children: [
                                    //           Text('End Date *',
                                    //               style: TextStyle(
                                    //                   fontSize: 12,
                                    //                   fontWeight: FontWeight.bold)),
                                    //           TextFormField(
                                    //             controller: _endDateController,
                                    //             decoration: InputDecoration(
                                    //               hintText: 'Select end date',
                                    //               border: OutlineInputBorder(),
                                    //             ),
                                    //             validator: (value) {
                                    //               if (value == null || value.isEmpty) {
                                    //                 return 'End date is required';
                                    //               }
                                    //               return null;
                                    //             },
                                    //             readOnly: true,
                                    //             onTap: () async {
                                    //               DateTime? pickedDate = await showDatePicker(
                                    //                 context: context,
                                    //                 initialDate: DateTime.now(),
                                    //                 firstDate: DateTime(2000),
                                    //                 lastDate: DateTime(2101),
                                    //               );
                                    //               if (pickedDate != null) {
                                    //                 endDate = pickedDate;
                                    //                 _endDateController.text =
                                    //                     DateFormat('yyyy-MM-dd')
                                    //                         .format(pickedDate);
                                    //               }
                                    //             },
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Material(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0),
                                              child: TextFormField(
                                                controller:
                                                    _startDateController,
                                                keyboardType:
                                                    TextInputType.text,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Start date is required';
                                                  }
                                                  return null;
                                                },
                                                readOnly: true,
                                                // Make the field read-only
                                                style: TextStyle(fontSize: 12),
                                                decoration: InputDecoration(
                                                  hintText: 'Select start date',
                                                  hintStyle:
                                                      TextStyle(fontSize: 12),
                                                  // Smaller font size for hint text
                                                  isDense: true,
                                                  // important line
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 15, 10, 0),
                                                  // control your hints text size
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  // Set the border color here
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width:
                                                            1), // Change the color and width as needed
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width:
                                                            1), // Change the color and width as needed
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: AllColors
                                                            .mediumPurple,
                                                        width:
                                                            1), // Change the color and width as needed
                                                  ),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate = await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime(2101),
                                                    builder: (context, child) {
                                                      return Theme(
                                                        data: Theme.of(context).copyWith(
                                                          colorScheme: ColorScheme.light(
                                                            primary: AllColors.mediumPurple,
                                                            onPrimary: Colors.white,
                                                            surface: Colors.white,
                                                            onSurface: Colors.black,
                                                          ),
                                                          dialogBackgroundColor: Colors.white,
                                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          datePickerTheme: DatePickerThemeData(
                                                            backgroundColor: Colors.white,
                                                            surfaceTintColor: Colors.white,
                                                            dayStyle: TextStyle(fontSize: 12),
                                                            weekdayStyle: TextStyle(fontSize: 11),
                                                            yearStyle: TextStyle(fontSize: 12),
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                          ),
                                                        ),
                                                        child: SizedBox(
                                                          width: 100,
                                                          height: 700,
                                                          child: child!,
                                                        ),
                                                      );
                                                    },
                                                  );

                                                  if (pickedDate != null) {
                                                    startDate = pickedDate;
                                                    _startDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Material(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0),
                                              child: TextFormField(
                                                controller: _endDateController,
                                                keyboardType:
                                                    TextInputType.text,
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'end date is required';
                                                  }
                                                  return null;
                                                },
                                                readOnly: true,
                                                // Make the field read-only
                                                style: TextStyle(fontSize: 12),
                                                decoration: InputDecoration(
                                                  hintText: 'Select start date',
                                                  hintStyle:
                                                      TextStyle(fontSize: 12),
                                                  // Smaller font size for hint text
                                                  isDense: true,
                                                  // important line
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 15, 10, 0),
                                                  // control your hints text size
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  // Set the border color here
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width:
                                                            1), // Change the color and width as needed
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey,
                                                        width:
                                                            1), // Change the color and width as needed
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: AllColors
                                                            .mediumPurple,
                                                        width:
                                                            1), // Change the color and width as needed
                                                  ),
                                                ),
                                                onTap: () async {
                                                  DateTime? pickedDate =
                                                      await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(2000),
                                                    lastDate: DateTime(2101),
                                                  );
                                                  if (pickedDate != null) {
                                                    endDate =
                                                        pickedDate; // Store the selected date
                                                    _endDateController
                                                        .text = DateFormat(
                                                            'yyyy-MM-dd')
                                                        .format(
                                                            pickedDate); // Format and set the date
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12),
                                    Text('Description *',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),

                                    CreateNewLeadScreenCard(
                                      containerPadding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      hintText: 'Enter Description',
                                      allowCustomBorderInput:
                                          BorderRadius.circular(8),
                                      maxLines: 5,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Description is required';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      onChanged: (value) {
                                        description = value;
                                      },
                                    ),
                                    SizedBox(height: 12),
                                    Text('TO :',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 12),
                                    Row(
                                      children: [
                                        const Text('CC : ',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),

                                        Container(
                                          color: AllColors.grey,
                                          child: Text(
                                            '${controller.projectDetail?.sendEmailDetail?.ccto?.join(', ') ?? 'N/A'}', // Corrected line
                                            style: TextStyle(
                                              color: AllColors.whiteColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: FontFamily.sfPro,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 12),
                                    Text('Add more CC',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),

                                    CreateNewLeadScreenCard(
                                      containerPadding:
                                          EdgeInsets.only(top: 5, bottom: 5),
                                      hintText: 'Multiple email IDs',
                                      allowCustomBorderInput:
                                          BorderRadius.circular(8),
                                      maxLines: 5,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Description is required';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      onChanged: (value) {
                                        ccTo = value
                                            .split(',')
                                            .map((e) => e.trim())
                                            .toList();
                                      },
                                    ),

                                    SizedBox(height: 12),
                                    Text('Attachments *',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                    Row(
                                      children: [
                                        CustomButton(
                                          height: Get.height / 34,
                                          width: 100,
                                          backgroundColor:
                                              AllColors.greyGoogleForm,
                                          child: Text('Choose files',
                                              style: TextStyle(
                                                  color: AllColors.blackColor,
                                                  fontSize: 12)),
                                          onPressed: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              setState(() {
                                                attachment = {
                                                  'file':
                                                      result.files.single.path,
                                                  'name':
                                                      result.files.single.name,
                                                };
                                                showAttachmentError = false;
                                              });
                                            }
                                          },
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 6.0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey.shade300),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Text(
                                              attachment != null
                                                  ? attachment!['name']
                                                  : 'No file chosen',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (showAttachmentError &&
                                        attachment == null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Attachment is required',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: 25.0),

                                    Center(
                                      child: CustomButton(
                                        height: Get.height / 35,
                                        width: Get.width / 5,
                                        borderRadius: 8.0,
                                        backgroundColor: AllColors.mediumPurple,
                                        onPressed: () {
                                          setState(() {
                                            showAttachmentError = true;
                                          });
                                          if (_formKey.currentState!
                                                  .validate() &&
                                              attachment != null) {
                                            viewModel.taskCreateReportList(
                                              context,
                                              title,
                                              description,
                                              startDate,
                                              endDate,
                                              projectId,
                                              ccTo,
                                              attachment,
                                            );
                                            Navigator.of(context).pop();
                                          }
                                        },
                                        child: Text('Submit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12)),
                                      ),
                                    ),

                                    SizedBox(height: 10.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  right: -10,
                  child: Container(
                    height: 28,
                    padding: EdgeInsets.all(0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,

                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.black, size: 14),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  double getProgressValue(String? task) {
    if (task == null || task.isEmpty) {
      return 0.0; // Default to 0.0 if task is null or empty
    }

    // Convert the string to a double and divide by 100 if it represents a percentage.
    double? progress = double.tryParse(task);
    if (progress != null) {
      return progress / 100;
    }

    return 0.0; // Default to 0.0 if parsing fails
  }

}
