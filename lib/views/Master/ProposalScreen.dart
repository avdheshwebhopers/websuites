import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/datetrim/DateTrim.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import '../../../../data/models/responseModels/master/proposals/master_proposals_resposne_model.dart';
import '../../viewModels/master/proposals/master_proposals_viewModel.dart';

class MasterProposalScreen extends StatefulWidget {
  const MasterProposalScreen({super.key});

  @override
  State<MasterProposalScreen> createState() => _MasterProposalScreenState();
}

class _MasterProposalScreenState extends State<MasterProposalScreen> {
  // Instantiate the ViewModel
  final MasterProposalsViewModel _viewModel = Get.put(MasterProposalsViewModel());

  @override
  void initState() {
    super.initState();
    // Fetch proposals when screen loads
    _viewModel.masterProposals(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Proposal', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: Obx(() {
        // Check loading state
        if (_viewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // If proposals are not available
        if (_viewModel.proposals.value.isEmpty) {
          return Center(child: Text('No proposals found'));
        }

        return ListView.builder(
          itemCount: _viewModel.proposals.value.length,
          itemBuilder: (context, index) {
            final proposal = _viewModel.proposals.value[index];

            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                padding: const EdgeInsets.all(15),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and caretaker
                    Row(
                      children: [
                        Text(
                          proposal.subject ?? 'Proposal',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamily.sfPro),
                        ),
                        Spacer(),
                        Image.asset('assets/icons/edit.png', height: 17, width: 17),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.date_range, size: 15, color: AllColors.mediumPurple),
                        SizedBox(width: 5),
                        Text(
                        formatDateWithDay(  proposal.createdAt ?? 'N/A'), // Assuming the createdAt field holds the date
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontFamily: FontFamily.sfPro,
                              color: AllColors.mediumPurple),
                        ),
                        Spacer(),
                        // Edit Icon (Placeholder)
                       Icon(Icons.remove_red_eye,color: AllColors.figmaGrey,size: 21,),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Proposal body/content
                   
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
