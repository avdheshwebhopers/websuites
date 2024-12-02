import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../data/network/network_api_services.dart';
import '../../../../resources/strings/strings.dart';
import '../../../../resources/textStyles/text_styles.dart';
import '../../../../utils/appColors/app_colors.dart';
import '../../../../utils/filter_Date/SelectDate.dart';
import '../../../../viewModels/filterdate/DateFilter.dart';
import '../../../../viewModels/leadScreens/createNewLead/ProductCategory/ProductCategory.dart';
import '../../../../viewModels/leadScreens/createNewLead/assignedLeadTo/assigned_lead_to_viewModel.dart';
import '../../../../viewModels/leadScreens/createNewLead/divisions/divisions_view_model.dart';
import '../../../../viewModels/leadScreens/createNewLead/source/source_view_model.dart';
import '../../../../viewModels/leadScreens/filter/country_code/country_code.dart';
import '../../../../viewModels/leadScreens/trashLeads/leadTypes/lead_type_viewModel.dart';
import '../../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class FilterActionButtons extends StatelessWidget {
  const FilterActionButtons({Key? key}) : super(key: key);

  void _showFilterDialog(BuildContext context) {
    final ConstantValueViewModel constantValueViewModel = Get.put(ConstantValueViewModel());
    constantValueViewModel.fetchConstantList(context);

    final size = MediaQuery.of(context).size;
    final bool isMobile = size.width < 600;
    final double dialogWidth = 400;

    if (isMobile) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: FilterContent(
              scrollController: scrollController,
              isFullScreen: true,
            ),
          ),
        ),
      );
    } else {
      // Tablet and Desktop Sliding Panel
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          barrierColor: Colors.black.withOpacity(0.3),
          barrierDismissible: true,
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) {
            return Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  width: dialogWidth, // Fixed width for the dialog
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0), // Start off-screen to the right
                      end: Offset.zero, // End at the original position
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    )),
                    child: Material(
                      elevation: 8,
                      color: Colors.white,
                      child: FilterContent(
                        scrollController: ScrollController(),
                        isFullScreen: false,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: InkWell(
            onTap: () => _showFilterDialog(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xFFE2E2E2), width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.filter_list_sharp, size: 17, color: AllColors.mediumPurple),
                  SizedBox(width: 5),
                  Text(Strings.filter, style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterContent extends StatelessWidget {
  final ScrollController scrollController;

  final bool isFullScreen;

  const FilterContent({
    Key? key,
    required this.scrollController,
    required this.isFullScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var searchQuery = ''.obs;

    final LeadListCountryCodeViewModel countryCodeViewModel = Get.put(LeadListCountryCodeViewModel());
    countryCodeViewModel.countryCodeApi(context);

    final ProductCategoryController productCategoryController = Get.put(ProductCategoryController());
    final LeadSourceController leadSourceController =
    Get.put(LeadSourceController(apiService: NetworkApiServices()));
    final constantValueViewModel = Get.find<ConstantValueViewModel>();
    final LeadTypeViewModel leadTypeViewModel = Get.put(LeadTypeViewModel());
    final AssignedLeadToViewModel _assignedLeadToController =
    Get.put(AssignedLeadToViewModel());
    final DivisionsViewModel _divisionsController = Get.put(DivisionsViewModel());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isFullScreen)
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextStyles.w500_14_Black(context, Strings.search),
                  CreateNewLeadScreenCard(hintText: Strings.searchLead),

                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.created_date2),
                  SelectDate(hintText: Strings.created_date2,),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.lead_status),
                  CreateNewLeadScreenCard(
                    hintText: Strings.lead_status,
                    categories: [
                      constantValueViewModel.constantList.value[0].newValue ?? "No Value",
                      constantValueViewModel.constantList.value[0].inProgress ?? "No Value",
                      constantValueViewModel.constantList.value[0].converted ?? "No Value",
                      constantValueViewModel.constantList.value[0].dead ?? "No Value",
                    ],
                  ),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.lead_type),
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
                  }
                  ),

                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.lead_assigned),
                  CreateNewLeadScreenCard(hintText: Strings.lead_assigned,
                      categories: [
                        constantValueViewModel.constantList.value[0].individual ?? "No Value",
                        constantValueViewModel.constantList.value[0].withteam ?? "No Value",

                      ]
                  ),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.search),

                  Obx(() {

                    return
                      CreateNewLeadScreenCard(
                        hintText: _assignedLeadToController.selectedLeadName.value.isEmpty
                            ? Strings.select
                            : _assignedLeadToController.selectedLeadName.value,
                        categories: _assignedLeadToController.namesOnlyRxList,
                        onCategoryChanged: (selectedCategory) {
                          // Handle selection for names only
                          final names = selectedCategory.split(' ');
                          if (names.length >= 2) {
                            final firstName = names[0];
                            final lastName = names[1];
                            _assignedLeadToController.selectedLeadName.value = '$firstName $lastName';
                          }
                        },
                      );
                  }),



                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.order_by),
                  CreateNewLeadScreenCard(hintText: Strings.order_by,
                    categories: [
                      constantValueViewModel.constantList.value[0].createDate ?? "No Value",
                      constantValueViewModel.constantList.value[0].activityDate ?? "No Value",

                    ],),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.to_do_leads),
                  CreateNewLeadScreenCard(hintText: Strings.select_to_do_leads,
                    categories: [
                      constantValueViewModel.constantList.value[0].toDoNeedAction ?? "No Value",
                      constantValueViewModel.constantList.value[0].toDoActionTaken ?? "No Value",

                    ],
                  ),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.query_type),
                  CreateNewLeadScreenCard(hintText: Strings.select_query_type,
                    categories: [
                      constantValueViewModel.constantList.value[0].queryTypeDirect ?? "No Value",
                      constantValueViewModel.constantList.value[0].queryTypeBuy ?? "No Value",
                      constantValueViewModel.constantList.value[0].queryTypeCall ?? "No Value",

                    ],
                  ),
                  TextStyles.w500_14_Black(context, Strings.assigned_type),
                  CreateNewLeadScreenCard(hintText: Strings.select_assigned_type,
                    categories: [
                      constantValueViewModel.constantList.value[0]. assignTypeAssigned ?? "No Value",
                      constantValueViewModel.constantList.value[0]. assignTypeUnassigned ?? "No Value",
                      constantValueViewModel.constantList.value[0]. assignTypeAssignFresh ?? "No Value",
                      constantValueViewModel.constantList.value[0]. assignTypeUnAssignFresh ?? "No Value",
                      constantValueViewModel.constantList.value[0]. reAssigned ?? "No Value",
                      constantValueViewModel.constantList.value[0]. reUnAssigned ?? "No Value",

                    ],
                  ),
                  SizedBox(height: 16),

                  TextStyles.w500_14_Black(context, Strings.reminder_type),
                  CreateNewLeadScreenCard(hintText: Strings.select_reminder_type_lead,
                    categories: [

                      constantValueViewModel.constantList.value[0].reminderTypeToday ?? "No Value",
                      constantValueViewModel.constantList.value[0]. reminderTypeMissed ?? "No Value",
                      constantValueViewModel.constantList.value[0]. reminderTypeUpcoming?? "No Value",
                      constantValueViewModel.constantList.value[0]. reminderTypeTodayMissed ?? "No Value",

                    ],

                  ),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.repeat_type),
                  CreateNewLeadScreenCard(hintText: Strings.select_repeat_type,

                    categories: [
                      constantValueViewModel.constantList.value[0].all ?? "No Value",
                      constantValueViewModel.constantList.value[0].repeated ?? "No Value",
                      constantValueViewModel.constantList.value[0].nonRepeated ?? "No Value",



                    ],),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.activity_Range),
                  CreateNewLeadScreenCard(hintText: Strings.select_activity_range,

                    categories: [
                      constantValueViewModel.constantList.value[0].activityRangeStartDays ?? "No Value",
                      constantValueViewModel.constantList.value[0].   activityRangeSecond ?? "No Value",
                      constantValueViewModel.constantList.value[0].   activityRangeThird ?? "No Value",
                      constantValueViewModel.constantList.value[0].   activityRangeFour ?? "No Value",
                      constantValueViewModel.constantList.value[0].   activityRangeFifth ?? "No Value",
                      constantValueViewModel.constantList.value[0].   activityRangeSix ?? "No Value",
                      constantValueViewModel.constantList.value[0].   activityRangeSeven ?? "No Value",

                    ],
                  ),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.divisions),
                  Obx(() {
                    return CreateNewLeadScreenCard(
                      hintText: Strings.select,
                      categories: _divisionsController.divisionsList
                          .map((division) => division.name ?? '')
                          .toList(),
                      onCategoryChanged: (selectedDivision) {
                        _divisionsController.updateSelectedDivisions([selectedDivision]); // Update with a single selection
                      },
                      isMultiSelect: false, // Set to false to indicate single selection
                    );
                  }),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.lead_source),

                  Obx(() {
                    if (leadSourceController.isLoading.value) {
                      return CircularProgressIndicator();
                    } else if (leadSourceController.errorMessage.isNotEmpty) {
                      return Text(leadSourceController.errorMessage.value);
                    } else if (leadSourceController.filteredLeadSources.isEmpty) {
                      return Text('No lead sources available');
                    }

                    return CreateNewLeadScreenCard(
                      hintText: Strings.source,
                      categories: leadSourceController.filteredLeadSources
                          .map((source) => source['name'] as String)
                          .toList(),
                      onCategoryChanged: (selectedSource) {
                        final selectedSourceData = leadSourceController.leadSources.firstWhere(
                              (source) => source['name'] == selectedSource,
                          orElse: () => {'id': null},
                        );
                        leadSourceController.setSelectedSource(selectedSourceData['id']);
                      },
                      allowCustomInput: true,
                    );
                  }),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.product_category),
                  Obx(() {
                    if (productCategoryController.isLoading.value) {
                      return CircularProgressIndicator();
                    } else if (productCategoryController.errorMessage.isNotEmpty) {
                      return Text(productCategoryController.errorMessage.value);
                    } else if (productCategoryController.leadProductCategories.isEmpty) {
                      return Text('No product categories available');
                    }

                    return CreateNewLeadScreenCard(
                      hintText: Strings.select,
                      categories: productCategoryController.leadProductCategories
                          .map((category) => category.name) // Assuming 'name' is the field you want to display
                          .toList(),
                      onCategoriesChanged: (selectedCategories) {
                        productCategoryController.updateSelectedCategories(selectedCategories);
                      },
                      isMultiSelect: true, // Assuming you want to allow multiple selections
                    );
                  }),

                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.reminder_Range),
                  SelectDate(hintText: Strings.created_date2,),
                  SizedBox(height: 16),
                  TextStyles.w500_14_Black(context, Strings.assigned_Range),
                  SelectDate(hintText: Strings.created_date2,),
                  SizedBox(height: 16),

                  TextStyles.w500_14_Black(context, Strings.country_code),


                  SizedBox(height: 16),

                  Obx(() {


                    var filteredCountries = countryCodeViewModel.countriesWithPhoneCode.where((country) {
                      return country.name!.toLowerCase().contains(searchQuery.value.toLowerCase());
                    }).toList();

                    return
                      CreateNewLeadScreenCard(
                        hintText: Strings.search_city,
                        categories: filteredCountries.map((country) => '+${country.phone}-${country.name}').toList(),
                        onCategoryChanged: (selectedCountry) {
                          print("Selected Country: $selectedCountry");
                        },
                        controller: TextEditingController(text: searchQuery.value), // Pass the controller
                        allowCustomInput: true, // Allow custom input for searching
                        onSearch: (value) {
                          searchQuery.value = value; // Update the search query
                        },
                      );
                  }),

                  SizedBox(height: 16),

                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, -1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AllColors.mediumPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text('Clear Filter', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
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
    );
  }
}
