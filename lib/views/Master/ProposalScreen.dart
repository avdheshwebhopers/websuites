import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../resources/textStyles/text_styles.dart';
import '../../utils/MasterScreen/MasterUtils.dart';
import '../../viewModels/master/proposals/master_proposals_viewModel.dart';

class MasterProposalScreen extends StatefulWidget {
  const MasterProposalScreen({super.key});

  @override
  State<MasterProposalScreen> createState() => _MasterProposalScreenState();
}

class _MasterProposalScreenState extends State<MasterProposalScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final MasterProposalsViewModel proposalViewModel = Get.put(MasterProposalsViewModel());
  String userName = '';
  String userEmail = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserDataAndProposals();
  }

  Future<void> _fetchUserDataAndProposals() async {
    final userData = await MasterScreenUtils.fetchUserData();
    setState(() {
      userName = userData['userName'] ?? '';
      userEmail = userData['userEmail'] ?? '';
    });
    try {
      await proposalViewModel.masterProposals(context);
    } catch (e) {
      print('Error fetching proposals: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterScreenUtils.buildCommonScaffold(
      scaffoldKey: _scaffoldKey,
      globalKey: _globalKey,
      userName: userName,
      userEmail: userEmail,
      title: Strings.masterProposal,
      addButtonTitle: Strings.addDivision, // Consider changing this to a more appropriate string for proposals
      onAddPressed: () {},
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MasterScreenUtils.buildSearchField(),
          const SizedBox(height: 20),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : Obx(() {
              final proposals = proposalViewModel.proposals.value;
              return
                MasterScreenUtils.buildDataTable(
                  context: context,  // Pass the context here
                  columns: const [
                    DataColumn(label: Text(Strings.sno, style: TextStyles.masterScreen)),
                    DataColumn(label: Text(Strings.name, style: TextStyles.masterScreen)),
                    DataColumn(label: Text(Strings.created_date, style: TextStyles.masterScreen)),
                    DataColumn(label: Text(Strings.action, style: TextStyles.masterScreen)),
                  ],
                  rows: List.generate(proposals.length, (index) {
                    final proposal = proposals[index];
                    return DataRow(cells: [
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(proposal.subject ?? '', style: TextStyles.namelength)),

                      // Ensure the date fits and is responsive
                      DataCell(
                        Flexible(
                          child: Text(
                            proposal.createdAt ?? '',
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width < 500 ? 12 : 14),
                            overflow: TextOverflow.ellipsis,  // Prevents overflow
                          ),
                        ),
                      ),

                      DataCell(
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_red_eye),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.mode_edit_outline_outlined),
                              onPressed: () {
                                // Handle edit action here
                              },
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }),
                );

            }),
          ),
        ],
      ),
    );
  }
}