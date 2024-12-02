// Create this as a new file named 'filter_dialog.dart'


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../resources/strings/strings.dart';
import '../../../../resources/textStyles/text_styles.dart';
import '../../../../utils/appColors/app_colors.dart';
import '../../createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<TextEditingController> filterControllers = List.generate(
    10,
        (index) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in filterControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AllColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextStyles.w700_17(
                      color: AllColors.blackColor,
                      context,
                      'Filter Options'
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Ten text fields
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status),
              CreateNewLeadScreenCard(hintText: Strings.status),
              CreateNewLeadScreenCard(hintText: Strings.status, categories: []),
              CreateNewLeadScreenCard(hintText: Strings.status),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AllColors.lightGrey,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        onPressed: () {
                          // Clear all text fields
                          for (var controller in filterControllers) {
                            controller.clear();
                          }
                        },
                        child: TextStyles.w400_14(
                            color: AllColors.whiteColor,
                            context,
                            'Clear'
                        ),
                      )
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: AllColors.mediumPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    onPressed: () {
                      // Get all filter values
                      List<String> filterValues = filterControllers
                          .map((controller) => controller.text)
                          .toList();

                      // Apply your filter logic here using filterValues
                      print('Applied filters: $filterValues');

                      Navigator.pop(context);
                    },
                    child: TextStyles.w400_14(
                        color: AllColors.whiteColor,
                        context,
                        'Apply Filter'
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Then modify your LeadListScreen class to use this dialog:

// In your LeadListScreen class, modify the onTap to:
