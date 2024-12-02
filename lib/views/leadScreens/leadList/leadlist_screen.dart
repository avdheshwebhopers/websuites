import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/appColors/app_colors.dart';
import '../../../viewModels/leadScreens/lead_list/lead_list.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import 'widgets/leadListCard/lead_list_card.dart';

class LeadListScreen extends StatefulWidget {
  const LeadListScreen({super.key});

  @override
  State<LeadListScreen> createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final LeadListViewModel _leadListViewModel = Get.put(LeadListViewModel());

  @override
  void initState() {
    super.initState();
    _leadListViewModel.fetchLeadList(context); // Fetch lead list on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,
      floatingActionButton: CustomFloatingButton(
        onPressed: () {},
        imageIcon: IconStrings.navSearch3,
        backgroundColor: AllColors.mediumPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Obx(() {
        if (_leadListViewModel.loading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_leadListViewModel.leadList.isEmpty) {
          return Center(child: Text('No leads found'));
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
              childAspectRatio: 2.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: _leadListViewModel.leadList.length,
            itemBuilder: (context, index) {
              final lead = _leadListViewModel.leadList[index];
              return LeadListScreenCard(
                title: lead.firstName ?? 'No Name',
                companyName: lead.organization ?? 'No Company',
                contact: lead.mobile ?? 'No Contact',
                createdDate: lead.createdAt != null ? _leadListViewModel.formatCreatedAt(lead.createdAt) : 'No Date',
                source: lead.source?.name ?? 'Unknown Source',
              );
            },
          ),
        );
      }),
    );
  }
}
