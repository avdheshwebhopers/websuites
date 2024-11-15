import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/viewModels/leadScreens/lead_activity/team_leads/team_leads.dart';
import 'package:websuites/utils/appColors/app_colors.dart';

class TeamLeadsScreen extends StatefulWidget {
  final TeamLeadsViewModel teamLeadsViewModel;
  TeamLeadsScreen({Key? key, required this.teamLeadsViewModel}) : super(key: key);

  @override
  State<TeamLeadsScreen> createState() => _TeamLeadsScreenState();
}

class _TeamLeadsScreenState extends State<TeamLeadsScreen> {
  @override
  void initState() {
    super.initState();
    widget.teamLeadsViewModel.fetchTeamLeadsList(context);
  }

  String getLeadTypeDisplay(dynamic leadType) {
    if (leadType != null) {
      // Try to access the nested leadtype property
      if (leadType is Map<String, dynamic> && leadType['leadtype'] != null) {
        return leadType['leadtype'].toString();
      }
      // If leadType itself is a value
      if (leadType is String || leadType is num) {
        return leadType.toString();
      }
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Obx(() {
        if (widget.teamLeadsViewModel.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (widget.teamLeadsViewModel.teamLeads.isEmpty) {
          return const Center(child: Text('No Team Leads Available'));
        }

        return ListView.builder(
          itemCount: widget.teamLeadsViewModel.teamLeads.length,
          itemBuilder: (context, index) {
            final teamLead = widget.teamLeadsViewModel.teamLeads[index];
            return Card(
              color: Colors.white,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            teamLead.user?.firstName ?? 'No Name',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                     Image.asset('assets/icons/Edit.png',height: 14,)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          color: Colors.grey,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          teamLead.user?.email ?? 'No Email',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.grey),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: AllColors.lighterPurple,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Team Lead',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AllColors.mediumPurple,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              teamLead.total?.toString() ?? '0',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),

                          ],
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                              decoration: BoxDecoration(
                                color: AllColors.lighterPurple,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Lead Type',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AllColors.mediumPurple,
                                ),
                              ),
                            ),

                            Text(
                              (teamLead.leadType != null && teamLead.leadType!.isNotEmpty)
                                  ? teamLead.leadType!.first
                                  : '0',  // Display first item of the list if available, else 'ok'
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )





                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}