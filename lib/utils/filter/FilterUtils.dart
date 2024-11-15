// utils/dialog_utils.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/resources/strings/strings.dart';
import 'package:websuites/resources/textStyles/text_styles.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/filter_Date/SelectDate.dart';
import 'package:websuites/viewModels/filterdate/DateFilter.dart';


class DialogUtils {
  static void showFilterDialog(BuildContext context, {required Widget filterContent}) {
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
            child: filterContent,
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
                  width: dialogWidth,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1, 0),
                      end: Offset.zero,
                    ).animate(CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOutCubic,
                    )),
                    child: Material(
                      elevation: 8,
                      color: Colors.white,
                      child: filterContent,
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
}
