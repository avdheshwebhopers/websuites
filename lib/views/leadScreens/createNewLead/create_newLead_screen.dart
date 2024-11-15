import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:websuites/resources/appUrls/app_urls.dart';
import 'package:websuites/utils/components/widgets/drawer/custom_drawer.dart';
import 'package:websuites/utils/responsive/bodies/Responsive.dart';

import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';
import '../../../Responsive/Custom_Drawer.dart';
import '../../../viewModels/filterdate/DateFilter.dart';
import '../../../viewModels/leadScreens/createNewLead/ProductCategory/ProductCategory.dart';
import '../../../viewModels/leadScreens/createNewLead/assignedLeadTo/assigned_lead_to_viewModel.dart';
import '../../../viewModels/leadScreens/createNewLead/createnewlead_button/CreateNewLeadButton.dart';
import '../../../viewModels/leadScreens/createNewLead/customFields/custom_fields_viewModels.dart';
import '../../../viewModels/leadScreens/createNewLead/divisions/divisions_view_model.dart';
import '../../../viewModels/leadScreens/createNewLead/pincode/pincode_view_model.dart';
import '../../../viewModels/leadScreens/createNewLead/source/source_view_model.dart';
import '../../../viewModels/leadScreens/leadMasters/controller.dart';
import '../../../viewModels/leadScreens/trashLeads/leadTypes/lead_type_viewModel.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../resources/iconStrings/icon_strings.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/navBar/custom_navBar.dart';
import '../../../utils/components/widgets/navBar/floatingActionButton/floating_action_button.dart';
import '../../../utils/components/widgets/sizedBoxes/sizedBox_15h.dart';
import '../../../utils/responsive/bodies/responsive scaffold.dart';

import '../../../data/network/network_api_services.dart';

class CreateNewLeadScreen extends StatefulWidget {
  const CreateNewLeadScreen({Key? key}) : super(key: key);

  @override
  State<CreateNewLeadScreen> createState() => _CreateNewLeadScreenState();
}

class _CreateNewLeadScreenState extends State<CreateNewLeadScreen> {
  RxList<String> categoriesRxList = RxList<String>();
  final LeadMasterController controller1 = Get.put(LeadMasterController());
  final PinCodeViewModel createLeadPinController = Get.put(PinCodeViewModel());
  final PinCodeViewModel _viewModel = Get.put(PinCodeViewModel());
  TextEditingController searchController = TextEditingController();
  final ProductCategoryController productCategoryController =
      Get.put(ProductCategoryController());
  final CreateNewLeadController controller = Get.put(CreateNewLeadController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final LeadSourceController leadSourceController =
      Get.put(LeadSourceController(apiService: NetworkApiServices()));

  final AssignedLeadToViewModel _assignedLeadToController =
      Get.put(AssignedLeadToViewModel());

  // final DivisionsViewModel _divisionsController = Get.put(DivisionsViewModel());
  final LeadTypeViewModel leadTypeViewModel = Get.put(LeadTypeViewModel());
  final CreateLeadCustomFieldsViewModel customFieldsController =
      Get.put(CreateLeadCustomFieldsViewModel());

  final ConstantValueViewModel constantValueViewModel =
      Get.put(ConstantValueViewModel());
  final SaveUserData userPreference = SaveUserData();
  final ScreenController _screenController = Get.put(ScreenController());
  String userName = '';
  String? userEmail;

  var selectedTab = 'types'.obs; // Track selected tab

  @override
  void initState() {
    super.initState();
    // customFieldsController.getIndustryType();
    leadSourceController.fetchLeadSources(AppUrls.createNewLeadSource);
    productCategoryController
        .fetchLeadProductCategories(context); // Ensure this is called
    _assignedLeadToController
        .fetchAssignedLeads(context); // Ensure this is called
    productCategoryController.fetchLeadProductCategories(context);

    fetchUserData();
    _initControllers();
    // _divisionsController.createNewLeadDivisions(context);
    // productCategoryController.fetchLeadProductCategories(context); // Ensure this is called
  }

  void _initControllers() {
    // _assignedLeadToController.assignedLead(context);
    // _divisionsController.createNewLeadDivisions(context);
    customFieldsController.createNewLeadCustomFields(context);
    leadSourceController.fetchLeadSources(AppUrls.createNewLeadSource);
    // productCategoryController.fetchLeadProductCategories(context);
  }

  Future<void> fetchUserData() async {
    try {
      LoginResponseModel response = await userPreference.getUser();
      setState(() {
        userName = response.user?.first_name ?? '';
        userEmail = response.user?.email;
      });
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final DivisionsViewModel _divisionsController =
        Get.put(DivisionsViewModel());
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // scaffoldKey: _scaffoldKey,
      // bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {},
        imageIcon: IconStrings.navSearch3,
        backgroundColor: AllColors.mediumPurple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: AllColors.whiteColor,

      drawer: Obx(
        () => CustomDrawer(
          selectedIndex: 0,
          // Customize as needed
          onItemSelected: (index) {
            // Handle item selection
          },
          isCollapsed: false,
          onCollapseToggle: () {
            // Handle drawer collapse/expand
          },
          isTabletOrDesktop: screenWidth >= 500,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextStyles.w600_15(
                      color: AllColors.vividPurple,
                      context,
                      Strings.standardFields),
                  const SizedBox(height: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyles.w500_14_Black(context, Strings.firstName),
                      CreateNewLeadScreenCard(
                        hintText: Strings.enterFirstName,
                        controller: controller.firstNameController,
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.lastName),
                      CreateNewLeadScreenCard(
                        hintText: Strings.enterLastName,
                        controller: controller.lastNameController,
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.phoneNumber),
                      CreateNewLeadScreenCard(
                        hintText: Strings.enterPhoneNumber,
                        controller: controller.mobileController,
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.email),

                      CreateNewLeadScreenCard(
                        hintText: Strings.emailExample,
                        controller: controller.emailController,
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.address),
                      CreateNewLeadScreenCard(
                          hintText: Strings.enterAddresscal),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.cityPincode),
                      CreateNewLeadScreenCard(hintText: Strings.cityPincode),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.state),
                      CreateNewLeadScreenCard(
                        hintText: Strings.state,
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.country),
                      CreateNewLeadScreenCard(hintText: Strings.country),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.source),
                      const SizedBox(height: 5),

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
                          isMultiSelect: true, // Allow multiple selections
                        );
                      }),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.type),
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
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.status),
                      CreateNewLeadScreenCard(
                        hintText: Strings.status,
                        categories: ["New", "In_Progress", "Converted", "Dead"],
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(
                        context,
                        Strings.assignedLeadTo,
                      ),

                      Obx(() {
                        if (_assignedLeadToController.loading.value) {
                          return const CircularProgressIndicator();
                        } else {
                          return CreateNewLeadScreenCard(
                            hintText: _assignedLeadToController
                                    .selectedLeadName.value.isEmpty
                                ? Strings.select
                                : _assignedLeadToController
                                    .selectedLeadName.value,
                            categories:
                                _assignedLeadToController.fullCategoriesRxList,
                            onCategoryChanged: (selectedCategory) {
                              // Handle selection for full names with emails
                              final names =
                                  selectedCategory.split('\n')[0].split(' ');
                              if (names.length >= 2) {
                                final firstName = names[0];
                                final lastName = names[1];
                                _assignedLeadToController.selectedLeadName
                                    .value = '$firstName $lastName';
                              }
                            },
                          );
                        }
                      }),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.organisation),
                      CreateNewLeadScreenCard(
                        hintText: Strings.enterName,
                        controller: controller.organizationController,
                      ),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(
                        context,
                        Strings.divisions,
                      ),

                      Obx(() {
                        if (_divisionsController.isLoading.value) {
                          // Change 'loading' to 'isLoading'
                          return const CircularProgressIndicator();
                        } else {
                          return CreateNewLeadScreenCard(
                            hintText: Strings.select,
                            categories: _divisionsController.divisionsList
                                .map((division) => division.name ?? '')
                                .toList(),
                            onCategoryChanged: (selectedDivision) {
                              _divisionsController
                                  .updateSelectedDivisions([selectedDivision]);
                            },
                            isMultiSelect: true,
                            isForDivisions: true,
                          );
                        }
                      }),

                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.categories),

                      Obx(() {
                        if (productCategoryController.isLoading.value) {
                          return CircularProgressIndicator();
                        } else if (productCategoryController
                            .errorMessage.isNotEmpty) {
                          return Text(
                              productCategoryController.errorMessage.value);
                        } else if (productCategoryController
                            .leadProductCategories.isEmpty) {
                          return Text('No product categories available');
                        }

                        return CreateNewLeadScreenCard(
                          hintText: Strings.select,
                          categories: productCategoryController
                              .leadProductCategories
                              .map((category) => category
                                  .name) // Assuming 'name' is the field you want to display
                              .toList(),
                          onCategoriesChanged: (selectedCategories) {
                            productCategoryController
                                .updateSelectedCategories(selectedCategories);
                          },
                          isMultiSelect:
                              true, // Assuming you want to allow multiple selections
                        );
                      }),
//

                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.requirement),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: ResponsiveUtils.isMobile(context)
                            ? Get.height / 6
                            : Get.height / 9,
                        width: Get.width / 1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AllColors.lightGrey,
                            // Specify the outline color here
                            width: 0.3,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: Strings.enterDescription,
                            hintStyle: TextStyle(
                              fontSize: 13,
                              color: AllColors.lighterGrey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextStyles.w600_universal(
                      fontSize: 15,
                      color: AllColors.vividPurple,
                      context,
                      Strings.customFields),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextStyles.w500_14_Black(context, Strings.pincode),

                      CreateNewLeadScreenCard(
                        hintText: Strings.enterPincode,
                        controller: searchController,
                        onSearch: (text) {
                          _viewModel.searchPincode(text);
                        },
                        // isPincode: true,
                        // isLoading: _viewModel.isLoading,
                        // filteredPincodeList: _viewModel.filteredPincodeList,filteredPincodeList
                      ),

////

                      //
                      // Obx(() => _viewModel.isLoading.value
                      //     ? Center(child: CircularProgressIndicator())
                      //   : ListView.builder(
                      //   shrinkWrap: true, // Allows the ListView to take only the space it needs
                      //   physics: NeverScrollableScrollPhysics(), // Prevents scrolling of the ListView
                      //   itemCount: _viewModel.filteredPincodeList.length,
                      //   itemBuilder: (context, index) {
                      //     return ListTile(
                      //       title: Text(_viewModel.filteredPincodeList[index].code ?? ""),
                      //       subtitle: Text(_viewModel.filteredPincodeList[index].district?.name ?? ""),
                      //     );
                      //   },
                      // )),

                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.designation),
                      CreateNewLeadScreenCard(hintText: Strings.select),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.website),
                      CreateNewLeadScreenCard(hintText: Strings.website),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.gstNumber),
                      CreateNewLeadScreenCard(hintText: Strings.enterGSTNumber),
                      SizedBox15h(),
                      TextStyles.w500_14_Black(
                          context, Strings.customerDivision),

                      Obx(() {
                        if (customFieldsController.loading.value) {
                          return const CircularProgressIndicator();
                        } else if (customFieldsController
                            .errorMessage.isNotEmpty) {
                          return Text(
                            customFieldsController.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return CreateNewLeadScreenCard(
                            hintText: Strings.select,
                            categories: customFieldsController
                                .customDivisionList, // Using the industryList
                            onCategoryChanged: (selectedIndustry) {
                              print("Selected Industry: $selectedIndustry");
                            },
                          );
                          // CreateNewLeadScreenCard(
                          //   hintText: 'Select a Product Category',
                          //   categories:customFieldsController.createNewLeadCustomFields.map((category) => category.description) // Mapping 'description' from productCategory
                          //       .toList(),
                          //   onCategoryChanged: (selectedDescription) {
                          //     // Find the selected category by matching the description
                          //     final selectedCategory = productCategoryController.leadProductCategories.firstWhere(
                          //           (category) => category.description == selectedDescription,
                          //     );
                          //     print("Selected Category Description: ${selectedCategory.description}");
                          //   },
                          // );
                        }
                      }),

                      SizedBox15h(),

                      TextStyles.w500_14_Black(context, Strings.industryType),

                      Obx(() {
                        if (customFieldsController.loading.value) {
                          return const CircularProgressIndicator();
                        } else if (customFieldsController
                            .errorMessage.isNotEmpty) {
                          return Text(
                            customFieldsController.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return CreateNewLeadScreenCard(
                            hintText: Strings.select,
                            categories: customFieldsController.industryTypeList,
                            // Using the industryList
                            onCategoryChanged: (selectedIndustry) {
                              print("Selected Industry: $selectedIndustry");
                            },
                          );
                          // CreateNewLeadScreenCard(
                          //   hintText: 'Select a Product Category',
                          //   categories:customFieldsController.createNewLeadCustomFields.map((category) => category.description) // Mapping 'description' from productCategory
                          //       .toList(),
                          //   onCategoryChanged: (selectedDescription) {
                          //     // Find the selected category by matching the description
                          //     final selectedCategory = productCategoryController.leadProductCategories.firstWhere(
                          //           (category) => category.description == selectedDescription,
                          //     );
                          //     print("Selected Category Description: ${selectedCategory.description}");
                          //   },
                          // );
                        }
                      }),

                      SizedBox15h(),
                      TextStyles.w500_14_Black(context, Strings.leadCategory),
                      Obx(() {
                        if (customFieldsController.loading.value) {
                          return const CircularProgressIndicator();
                        } else if (customFieldsController
                            .errorMessage.isNotEmpty) {
                          return Text(
                            customFieldsController.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return CreateNewLeadScreenCard(
                            hintText: Strings.select,
                            categories: customFieldsController.leadCategory,
                            // Using the industryList
                            onCategoryChanged: (selectedIndustry) {
                              print("Selected Industry: $selectedIndustry");
                            },
                          );

                          // CreateNewLeadScreenCard(
                          //   hintText: 'Select a Product Category',
                          //   categories:customFieldsController.createNewLeadCustomFields.map((category) => category.description) // Mapping 'description' from productCategory
                          //       .toList(),
                          //   onCategoryChanged: (selectedDescription) {
                          //     // Find the selected category by matching the description
                          //     final selectedCategory = productCategoryController.leadProductCategories.firstWhere(
                          //           (category) => category.description == selectedDescription,
                          //     );
                          //     print("Selected Category Description: ${selectedCategory.description}");
                          //   },
                          // );
                        }
                      }),

                      SizedBox15h(),

                      TextStyles.w500_14_Black(context, Strings.status),

                      CreateNewLeadScreenCard(
                        hintText: Strings.select,
                        categories: [],
                      ),
                      SizedBox15h(),

                      TextStyles.w500_14_Black(context, Strings.industry),

                      //

                      Obx(() {
                        if (customFieldsController.loading.value) {
                          return const CircularProgressIndicator();
                        } else if (customFieldsController
                            .errorMessage.isNotEmpty) {
                          return Text(
                            customFieldsController.errorMessage.value,
                            style: const TextStyle(color: Colors.red),
                          );
                        } else if (customFieldsController
                            .industryList.isEmpty) {
                          return Text(
                            'No industry options available',
                            style: const TextStyle(color: Colors.red),
                          );
                        } else {
                          return CreateNewLeadScreenCard(
                            hintText: 'Select an Industry',
                            categories: customFieldsController.industryList,
                            onCategoryChanged: (selectedIndustry) {
                              print("Selected Industry: $selectedIndustry");
                            },
                          );
                        }
                      }),

                      SizedBox15h(),

                      ElevatedButton(
                        onPressed: () => controller.createNewLead(context),
                        child: Text('Create Lead'),
                      ),
                      Obx(() => controller.isLoading.value
                          ? CircularProgressIndicator()
                          : SizedBox()),
                      Obx(() => Text(controller.errorMessage.value,
                          style: TextStyle(color: Colors.red))),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: Get.height / 24,
                            width: Get.width / 4,
                            decoration: BoxDecoration(
                              color: AllColors.mediumPurple,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: TextStyles.w500_universal(
                                  fontSize: 15,
                                  color: AllColors.whiteColor,
                                  context,
                                  Strings.create),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: Get.height / 24,
                            width: Get.width / 4,
                            decoration: BoxDecoration(
                              color: AllColors.lighterGrey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: TextStyles.w500_universal(
                                  fontSize: 15,
                                  color: AllColors.whiteColor,
                                  context,
                                  Strings.reset),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
