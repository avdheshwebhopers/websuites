import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

import '../../../data/models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../../../data/repositories/repositories.dart';
import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/commonfilter/FilterBottomSheet.dart';
import 'daily/DailySalesAnaltics.dart';

class SaleAnalyticsController extends GetxController {
  final Repositories _api = Repositories();
  RxList<MasterDivisionsResponseModel> divisions = <MasterDivisionsResponseModel>[].obs;

  var selectedIndex = 0.obs;
  var selectedMenuItem = 'Division'.obs;
  var selectedFilterItem = 'Division'.obs; // Add this new variable for filter selection
  var isLoading = true.obs; // Loading state

}

class SaleAnalyticsScreen extends StatelessWidget {
  const SaleAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SaleAnalyticsController controller = Get.put(SaleAnalyticsController());

    void _openFilterBottomSheet() async {
      await showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return FilterBottomSheet(
            filterOptions: [
              'Date',
              'Division',
              'Product Categories',

            ], onFilterSelected: (String ) {  },


          );

        },
      );
    }

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
          return InkWell(
              onTap: () {

              },
              child: Text("Hello Monthly, going to Chandigarh!"));
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
              String buttonTitle = 'Filter';  // Default title
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

                // Optional
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal, // Horizontal scroll
                child: Row(
                  children: List.generate(labels.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10), // Add space between each container
                      child: GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = index;
                        },
                        child: Obx(() => Container(
                          padding: const EdgeInsets.only(
                              top: 5, left: 20, right: 20, bottom: 5),
                          decoration: BoxDecoration(
                            color: controller.selectedIndex.value == index
                                ? AllColors.mediumPurple
                                : AllColors.textField2,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: TextStyles.w400_15(
                              color: controller.selectedIndex.value == index
                                  ? AllColors.whiteColor  // Set the text color for selected item
                                  : AllColors.blackColor, // Set text color for non-selected items
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Obx(() => getDynamicText(controller.selectedIndex.value)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






