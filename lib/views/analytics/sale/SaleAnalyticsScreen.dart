import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';

import '../../../resources/strings/strings.dart';
import '../../../resources/textStyles/text_styles.dart';
import '../../../utils/appColors/app_colors.dart';
import 'daily/DailySalesAnaltics.dart';

class SaleAnalyticsController extends GetxController {
  var selectedIndex = 0.obs;  // Observable, makes it reactive
}

class SaleAnalyticsScreen extends StatelessWidget {
  const SaleAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SaleAnalyticsController controller = Get.put(SaleAnalyticsController());

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

    // Step 3: Method to get dynamic text based on selected index
    Widget getDynamicText(int index) {
      switch (index) {
        case 0:
          return  DailySalesAnalytics();


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

                // It is  optional
                // textColor: AllColors.whiteColor,
                title: buttonTitle,
                onPress: () {
                  // Show bottom sheet when button is clicked
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      String message = '';  // Default message

                      // Change message based on selected index
                      switch (controller.selectedIndex.value) {
                        case 0:
                          message = 'Hello Daily Filter!';
                          break;
                        case 1:
                          message = 'Hello Monthly Filter!';
                          break;
                        case 2:
                          message = 'Hello Division Filter!';
                          break;
                        case 3:
                          message = 'Hello Category Filter!';
                          break;
                        case 4:
                          message = 'Hello Product Filter!';
                          break;
                        case 5:
                          message = 'Hello Customer Filter!';
                          break;
                        case 6:
                          message = 'Hello Executive Filter!';
                          break;
                        case 7:
                          message = 'Hello Team Filter!';
                          break;
                        case 8:
                          message = 'Hello Country Filter!';
                          break;
                        case 9:
                          message = 'Hello State Filter!';
                          break;
                        case 10:
                          message = 'Hello District Filter!';
                          break;
                        case 11:
                          message = 'Hello City Filter!';
                          break;
                        default:
                          message = 'Hello! Please select a category.';
                      }

                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            message,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: SingleChildScrollView(
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
                          child: Obx(() =>
                              Container(
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
      ),
    );
  }
}
