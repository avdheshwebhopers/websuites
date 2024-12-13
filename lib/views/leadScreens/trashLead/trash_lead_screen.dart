import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:websuites/views/leadScreens/createNewLead/create_newLead_screen.dart';
import 'package:websuites/views/leadScreens/trashLead/widgets/trashLeadCard/trash_lead_card.dart';
import '../../../resources/strings/strings.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../viewModels/leadScreens/trashLeads/deleteList/delete_list_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class TrashLeadScreen extends StatefulWidget {
  const TrashLeadScreen({Key? key}) : super(key: key);

  @override
  TrashLeadScreenState createState() => TrashLeadScreenState();
}

class TrashLeadScreenState extends State<TrashLeadScreen> {
  String? selectedLeadType; // Store the selected lead type

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TrashDeleteListViewModel _trashLeadController = Get.put(TrashDeleteListViewModel());
  final SaveUserData _userPreference = SaveUserData();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  String? userName;
  String? userEmail;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _setupScrollController();
    _searchController.addListener(_onSearchChanged);
  }

  void _setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
        _trashLeadController.loadMoreLeads();
      }
    });
  }

  Future<void> _fetchUserData() async {
    try {
      final response = await _userPreference.getUser ();
      setState(() {
        userName = response.user?.firstName;
        userEmail = response.user?.email;
      });
    } catch (e) {
      debugPrint('Error fetching user data: $e');
    }
  }

  void _onSearchChanged() {
    _trashLeadController.searchLeads(_searchController.text);
  }

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      return DateFormat('EEE, MMM d, y').format(dateTime); // e.g., Wed, Jun 26, 2024
    } catch (e) {
      return 'N/A';
    }
  }

  Widget _buildLoadMoreIndicator() {
    return Obx(() {
      if (_trashLeadController.loading.value && _trashLeadController.leads.isNotEmpty) {
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator()),
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.delete_outline, size: 48, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No trash leads found',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 500;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AllColors.whiteColor,
      body: RefreshIndicator(
        onRefresh: () => _trashLeadController.fetchTrashDeleteList(),
        child: Column(
          children: [


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search leads...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15), // Adjust padding here
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _trashLeadController.searchLeads(''); // Clear search
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              child: Obx(() {
                if (_trashLeadController.loading.value && _trashLeadController.leads.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (_trashLeadController.leads.isEmpty) {
                  return _buildEmptyState();
                }

                // Filter leads based on the selected lead type
                final filteredLeads = selectedLeadType != null
                    ? _trashLeadController.filteredLeads.where((lead) => lead.type?.name == selectedLeadType).toList()
                    : _trashLeadController.filteredLeads;

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: filteredLeads.length + 1,
                  itemBuilder: (context , index) {
                    if (index == filteredLeads.length) {
                      return _buildLoadMoreIndicator();
                    }

                    final lead = filteredLeads[index];
                    return Column(
                      children: [
                        TrashLeadScreenCard(
                          title: lead.organization ?? 'N/A',
                          email: lead.email ?? 'N/A',
                          mobile: lead.mobile ?? 'N/A',
                          date: _formatDate(lead.deletedAt),
                          remark: lead.deleteRemark ?? 'N/A',
                          deleteBy: [lead.deletedBy?.firstName, lead.deletedBy?.lastName]
                              .where((e) => e != null && e.isNotEmpty)
                              .join(' ')
                              .trim()
                              .isEmpty
                              ? 'N/A'
                              : '${lead.deletedBy?.firstName ?? ''} ${lead.deletedBy?.lastName ?? ''}'.trim(),
                          leadType: lead.type?.name ?? 'N/A',
                        ),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose(); // Dispose the search controller
    super.dispose();
  }
}