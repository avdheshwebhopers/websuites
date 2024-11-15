import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/viewModels/leadScreens/trashLeads/deleteList/delete_list_viewModel.dart';
import '../../../../../resources/strings/strings.dart';
import '../../../../../resources/textStyles/text_styles.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../utils/filter/FilterUtils.dart';
import '../../../../../utils/filter_Date/SelectDate.dart';
import '../../../../../viewModels/leadScreens/trashLeads/leadTypes/lead_type_viewModel.dart';

import '../../../createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class TrashFilter extends StatelessWidget {
  const TrashFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () {
              DialogUtils.showFilterDialog(
                context,
                filterContent: TrashContentFilter(
                  scrollController: ScrollController(),
                  isFullScreen: true,
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: const Color(0xFFE2E2E2), width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.filter_list_sharp, size: 17, color: AllColors.mediumPurple),
                  const SizedBox(width: 5),
                  Text(Strings.filter, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TrashContentFilter extends StatelessWidget {
  final ScrollController scrollController;
  final bool isFullScreen;

  const TrashContentFilter({
    Key? key,
    required this.scrollController,
    required this.isFullScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TrashDeleteListViewModel trashDeleteListViewModel = Get.put(TrashDeleteListViewModel());
    final LeadTypeViewModel leadTypeViewModel = Get.put(LeadTypeViewModel());

    // Step 1: Create a TextEditingController
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyles.w500_14_Black(context, Strings.search),
                    // Step 2: Pass the controller to CreateNewLeadScreenCard
                    Obx(() {
                      return CreateNewLeadScreenCard(
                        controller: searchController, // Pass the controller here
                        hintText: Strings.searchLead,
                        categories: trashDeleteListViewModel.filteredLeads
                            .map((lead) {
                          return '${lead.firstName ?? ''}';
                        })
                            .where((leadString) => leadString.isNotEmpty)
                            .toList(),
                        onCategoryChanged: (selectedLeadString) {
                          // Find the selected lead from the list based on the selected string
                          final selectedLead = trashDeleteListViewModel.filteredLeads.firstWhere(
                                (lead) => '${lead.firstName ?? ''}' == selectedLeadString,
                            // orElse: () => null, // Handle case where no match is found
                          );

                          if (selectedLead != null) {
                            // Step 3: Update the text field with the selected lead's first name
                            searchController.text = selectedLead.firstName ?? '';
                            print("Selected Lead: ${selectedLead.firstName}, ${selectedLead.email}, ${selectedLead.mobile}");
                          }
                        },
                      );
                    }),
                    const SizedBox(height: 16),
                    TextStyles.w500_14_Black(context , Strings.lead_type),
                    Obx(() {
                      if (leadTypeViewModel.loading.value) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                          CreateNewLeadScreenCard(
                            hintText: Strings.type,
                            categories: leadTypeViewModel.getLeadTypeNames(),
                            onCategoryChanged: (selectedType) {
                              print("Selected Lead Type: $selectedType");
                            },
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 16),
                    TextStyles.w500_14_Black(context, Strings.data_range),
                    SelectDate(hintText: Strings.select_date_range),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(


              ),
              child:
              Row(
                children: [

                  Expanded(
                    child:
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AllColors.mediumPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text('Save', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}