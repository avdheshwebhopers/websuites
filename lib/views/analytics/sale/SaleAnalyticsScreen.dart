import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';

import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/commonfilter/FilterBottomSheet.dart';
import '../../../viewModels/master/divisions/master_divisions_viewModel.dart';
import '../../../viewModels/product/category/product_category_viewModel.dart';
import 'daily/DailySalesAnaltics.dart';

class SaleAnalyticsController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedMenuItem = 'Division'.obs;
  var selectedFilterItem = 'Division'.obs; // Add this new variable for filter selection
  var divisionText = ''.obs; // New observable for the Division text input
}

class SaleAnalyticsScreen extends StatefulWidget {
  const SaleAnalyticsScreen({super.key});

  @override
  _SaleAnalyticsScreenState createState() => _SaleAnalyticsScreenState();
}

class _SaleAnalyticsScreenState extends State<SaleAnalyticsScreen> {
  late ProductCategoryViewModel productCategoryViewModel;
  late MasterDivisionsViewModel masterDivisionsViewModel;
  late SaleAnalyticsController controller;

  @override
  void initState() {
    super.initState();
    productCategoryViewModel = Get.put(ProductCategoryViewModel());
    masterDivisionsViewModel = Get.put(MasterDivisionsViewModel());
    controller = Get.put(SaleAnalyticsController());

    // Fetch data
    _fetchData();
  }

  Future<void> _fetchData() async {
    await masterDivisionsViewModel.masterDivisions(context); // Fetch data
  }

  void _openFilterBottomSheet() async {
    await showModalBottomSheet<void>(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        final List<String> filterOptions = [
          'Date',
          'Division',
          'Product Categories',
          'Customer',
          'Executive',
          'With Team',
          'Countries',
          'State',
          'District',
          'City',
        ];

        return FilterBottomSheet(
          filterOptions: filterOptions,
          onFilterSelected: (selectedFilter) {
            controller.selectedMenuItem.value = selectedFilter;
            controller.selectedFilterItem.value = selectedFilter;
          },
          showDynamicText: true,
          categories: productCategoryViewModel.categories, // Ensure this is populated
          divisions: masterDivisionsViewModel.divisions, // Ensure this is populated
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> labels = [
      Strings.daily,
      Strings.monthly,
      Strings.division,
      Strings.category,
      Strings.product,
      Strings.customer,
      Strings.executive,
      Strings.team,
      Strings.country,
      Strings.state,
      Strings.district,
      Strings.city,
    ];

    // Method to get dynamic text based on selected index
    Widget getDynamicText(int index) {
      switch (index) {
        case 0:
          return DailySalesAnalytics();
        case 1:
          return Text("Hello Monthly, going to Chandigarh!");
        case 2:
          return Text("Hello Division, what's up?");
        case 3:
          return Text("Hello Category, great to see you!");
        case 4:
          return Text("Hello Product, ready for action?");
        case 5:
          return Text("Hello Customer, hope you're doing well!");
        case 6:
          return Text("Hello Executive, let's get things done!");
        case 7:
          return Text("Hello Team, keep up the good work!");
        case 8:
          return Text("Hello Country, let's make progress!");
        case 9:
          return Text("Hello State, time to shine!");
        case 10:
          return Text("Hello District, let's collaborate!");
        case 11:
          return Text("Hello City, how's the vibe?");
        default:
          return Text("Hello! Please select a category.");
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sale Analytics',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: FontFamily.sfPro,
              ),
            ),
            Spacer(),
            Obx(() {
              String buttonTitle = 'Filter'; // Default title
              switch (controller.selectedIndex.value) {
                case 0:
                  buttonTitle = 'Daily Filter';
                  break;
                case 1:
                  buttonTitle = 'Monthly Filter';
                  break;
                case 2:
                  buttonTitle = 'Division Filter';
                  break;
                case 3:
                  buttonTitle = 'Category Filter';
                  break;
                case 4:
                  buttonTitle = 'Product Filter';
                  break;
                case 5:
                  buttonTitle = 'Customer Filter';
                  break;
                case 6:
                  buttonTitle = 'Executive Filter';
                  break;
                case 7:
                  buttonTitle = 'Team Filter';
                  break;
                case 8:
                  buttonTitle = 'Country Filter';
                  break;
                case 9:
                  buttonTitle = 'State Filter';
                  break;
                case 10:
                  buttonTitle = 'District Filter';
                  break;
                case 11:
                  buttonTitle = 'City Filter';
                  break;
                default:
                  buttonTitle = 'Filter';
              }

              return CommonButton(
                height: 25,
                width: 80,
                color: AllColors.mediumPurple,

                // it will optional
                // textColor: AllColors.whiteColor,
                title: buttonTitle,
                onPress: () {
                  _openFilterBottomSheet(); // Use the function to open the sheet
                },
              );
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Horizontal scroll for filter labels
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Horizontal scroll
                child: Row(
                  children: List.generate(labels.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      // Add space between each container
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value =
                              index; // Update selected index
                        },
                        child: Obx(() => Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == index
                                ? AllColors.mediumPurple
                                : AllColors.textField2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: TextStyles.w400_15(
                              color: controller.selectedIndex.value == index
                                  ? AllColors
                                  .whiteColor // Set the text color for selected item
                                  : AllColors.blackColor,
                              // Set text color for non-selected items
                              context,
                              labels[index],
                            ),
                          ),
                        )),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              // Display dynamic text based on selected index
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Obx(() {
                  // Get the dynamic text based on the selected index
                  return getDynamicText(controller.selectedIndex.value);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}