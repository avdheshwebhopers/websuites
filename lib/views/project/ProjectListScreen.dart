import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/views/project/details/ProjectDetailsScreen.dart';
import '../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../viewModels/projects/list/project_list_view_model.dart';
import '../../viewModels/saveToken/save_token.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({super.key});

  @override
  State<ProjectListScreen> createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> {
  final ProjectListViewModel _viewModel = Get.put(ProjectListViewModel());
  final ScrollController _scrollController = ScrollController();
  SaveUserData userPreference = SaveUserData();

  String? userName = '';
  String? userEmail = '';


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _viewModel.fetchProjectList(context);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.8) {
      _viewModel.loadNextPage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // drawer: CustomDrawer(
      //     userName: '$userName',
      //     phoneNumber: '$userEmail',
      //     version: '1.0.12'
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Project List",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Obx(() {
        if (_viewModel.isLoading.value && _viewModel.projectList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_viewModel.projectList.isEmpty) {
          return const Center(child: Text("No projects found"));
        }

        return RefreshIndicator(
          onRefresh: () => _viewModel.refreshList(context),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(15),
            itemCount: _viewModel.projectList.length +
                (_viewModel.isLoadingMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _viewModel.projectList.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final project = _viewModel.projectList[index];
              final customer = project.customer;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: () {
                    Get.to(() =>
                        ProjectDetailsScreen(projectId: project.id.toString()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                project.projectName?.isNotEmpty == true
                                    ? project.projectName!
                                    : 'Unnamed Project',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        project.status?.isNotEmpty == true
                                            ? project.status!
                                            : 'Unknown',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${customer?.firstName ?? ''} ${customer?.lastName ?? ''}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),

                              SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child:   Text(
                                  (project.tags?.isNotEmpty ?? false)
                                      ? project.tags!.map((tag) => tag.name).join(', ')
                                      : 'Not Available',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange[800],
                                  ),
                                ),

                              ),
                              Spacer(),

                              Text(
                                '${project?.billingType}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),

                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'START DATE',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    project.startDate != null
                                        ? DateFormat('MMM dd, yyyy')
                                            .format(project.startDate!)
                                        : 'N/A',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'DEADLINE',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    project.deadline != null
                                        ? DateFormat('MMM dd, yyyy')
                                            .format(project.deadline!)
                                        : 'N/A',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(height: 10, color: Colors.grey[300]),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'MEMBERS - ',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  project.members.length.toString() ?? 'N/A',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey),
                                ),
                                Spacer(),
                                if (project.members.isNotEmpty) ...[
                                  const Divider(height: 24),
                                  Wrap(
                                    spacing: 0,
                                    children: project.members.map((member) {
                                      String firstLetter = member.firstName
                                              .toString()
                                              .isNotEmpty
                                          ? member.firstName
                                              .toString()[0]
                                              .toUpperCase()
                                          : 'N'; // Default to 'N' if no first name is available

                                      // Use modulo to ensure the color stays within the range of Colors.primaries
                                      Color backgroundColor = Colors.primaries[
                                          project.members.indexOf(member) %
                                              Colors.primaries.length];

                                      return Container(
                                        margin: const EdgeInsets.only(right: 4),
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: member.profilePic ==
                                                  null
                                              ? backgroundColor.withOpacity(0.5)
                                              : null,
                                          backgroundImage: member.profilePic !=
                                                  null
                                              ? NetworkImage(
                                                  member.profilePic.toString())
                                              : null,
                                          child: member.profilePic == null
                                              ? Text(
                                                  firstLetter,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                )
                                              : null, // No text if profile_pic is present
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ]
                              ]),

                          SizedBox(height: 10),
                          // You can leave it empty or add other elements here
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
