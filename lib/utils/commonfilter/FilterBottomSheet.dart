import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Add this for date formatting
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../data/models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../../data/models/responseModels/products/category/product_category_response_model.dart';
import '../../views/analytics/sale/SaleAnalyticsScreen.dart';
import '../../views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';


class FilterBottomSheet extends GetView<SaleAnalyticsController> {
  final List<String> filterOptions;
  final Function(String) onFilterSelected;
  final bool showDynamicText;
  final TextEditingController textController = TextEditingController();
  final List<ProductCategoryResponseModel> categories; // Keep categories
  final List<MasterDivisionsResponseModel> divisions; // Add divisions list

  final RxBool isTextFieldVisible = true.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

  FilterBottomSheet({
    Key? key,
    required this.filterOptions,
    required this.onFilterSelected,
    required this.categories, // Keep this line for product categories
    required this.divisions, // Add this line for divisions
    this.showDynamicText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  "Filters",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          Divider(thickness: 1),

          // Body Section
          Expanded(
            child: Row(
              children: [
                // Filter List Section
                Container(
                  width: MediaQuery.of(Get.context!).size.width * 0.3,
                  color: Colors.grey[100],
                  child: ListView.builder(
                    itemCount: filterOptions.length,
                    itemBuilder: (context, index) {
                      String value = filterOptions[index];
                      return Obx(() => InkWell(
                        onTap: () {
                          controller.selectedFilterItem.value = value;
                          textController.text = ''; // Clear text when changing filter
                          isTextFieldVisible.value = true; // Show text field
                          onFilterSelected(value);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                          color: controller.selectedFilterItem.value == value
                              ? AllColors.mediumPurple
                              : Colors.transparent,
                          child: Text(
                            value,
                            style: TextStyle(
                              color: controller.selectedFilterItem.value == value
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 16,
                              fontWeight: controller.selectedFilterItem.value == value
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                ),

                // Filter Details Section
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(left: 15, right: 10, bottom: 15, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDynamicText) ...[
                          Obx(() => Text(
                            "${controller.selectedFilterItem.value}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.sfPro,
                            ),
                          )),
                          SizedBox(height: 10),
                        ],

                        Obx(() {
                          String currentFilter = controller.selectedFilterItem.value;

                          if (currentFilter == 'Product Categories') {
                            List<String> categoryNames = categories.map((category) => category.name ?? 'Unknown').toList();
                            return CreateNewLeadScreenCard(
                              hintText: 'Product Categories',
                              categories: categoryNames, // Pass the list of category names
                              onCategoriesChanged: (selectedCategories) {
                                // Handle category selection
                              },
                            );
                          }

                          if (currentFilter == 'Division') {
                            List<String> divisionNames = divisions.map((division) => division.name ?? 'Unknown').toList();
                            return CreateNewLeadScreenCard(
                              hintText: 'Division',
                              categories: divisionNames,
                              onCategoriesChanged: (selectedCategories) {
                                // Handle division selection
                              },
                            );
                          }


                          if (currentFilter == 'Product') {

                            return CreateNewLeadScreenCard(
                              hintText: 'Product',



                            );
                          }



                          if (!isTextFieldVisible.value) return SizedBox.shrink();
                          return CreateNewLeadScreenCard(
                            hintText: _getHintTextForFilter(currentFilter),
                            controller: textController,
                            prefixIcon: Icon(
                              currentFilter == 'Date' ? Icons.calendar_month_sharp : Icons.search,
                              color: AllColors.figmaGrey,
                              size: currentFilter == 'Date' ? 19 : 24,
                            ),
                            readOnly: currentFilter == 'Date',
                            onTap: currentFilter == 'Date'
                                ? () => _selectDate(Get.context!)
                                : null,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Buttons Section
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                // Clear Button
                Expanded(
                  child: OutlinedButton(
                    child: Text('Clear'),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      controller.selectedFilterItem.value = filterOptions[0];
                      textController.clear();
                      selectedDate.value = null;
                      isTextFieldVisible.value = true;
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 16),

                // Apply Button
                Expanded(
                  child: ElevatedButton(
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AllColors.mediumPurple,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () {
                      onFilterSelected(controller.selectedFilterItem.value);
                      isTextFieldVisible.value = false;
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Date Picker Method
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
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
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
      textController.text = DateFormat('dd/MM/yyyy').format(picked);
    }
  }

  // Get Hint Text for Each Filter Type
  String _getHintTextForFilter(String value) {
    switch (value) {
      case 'Date':
        return 'Select a date';

      case 'Division':
        return 'Select Division';

      case 'Product':
        return 'Select Product';





      case 'Product Categories':
        return 'Select Categories';

      case 'Customer':
        return 'Select Customer';
      case 'Executive':
        return 'Select Executive';
      case 'With Team':
        return 'Select Team';
      case 'Countries':
        return 'Select Country';
      case 'State':
        return 'Select State';
      case 'District':
        return 'Select District';
      case 'City':
        return 'Select City';
      default:
        return 'Select $value';
    }
  }
}