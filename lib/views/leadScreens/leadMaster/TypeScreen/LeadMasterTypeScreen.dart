import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../resources/strings/strings.dart';
import '../../../../resources/textStyles/text_styles.dart';
import '../../../../viewModels/leadScreens/leadMasters/types/lead_master_types_viewModel.dart';
import '../widgets/leadMasterCard/lead_master_card.dart';

class TypesTab extends StatelessWidget {
  const TypesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeadMasterTypesViewModel controller = Get.put(LeadMasterTypesViewModel());

    controller.fetchLeadMasterTypes(context);

    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (controller.leadMasterTypesList.isEmpty) {
        return const Center(child: Text("No Lead Master Types available"));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextStyles.w500_14_Black(context, Strings.availableLeadStatus),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Column(
            children: controller.leadMasterTypesList.map((leadMasterType) {
              // Extract children names as subtypes
              List<String> subtypes = leadMasterType.children
                  ?.map((child) => child.name ?? '')
                  .where((name) => name.isNotEmpty)
                  .toList() ?? [];

              return LeadMasterScreenCard(
                title: leadMasterType.name ?? 'Unknown',
                activity: leadMasterType.status ?? 'Unknown',
                date: leadMasterType.createdAt ?? 'Unknown Date',
                subtypes: subtypes,
                onEditSubtype: (subtype) {
                  // Handle edit subtype
                  // controller.handleEditSubtype(leadMasterType.id, subtype);
                },
                onAddSubtype: () {
                  // Handle add subtype
                  // controller.handleAddSubtype(leadMasterType.id);
                },
              );
            }).toList(),
          ),
        ],
      );
    });
  }
}