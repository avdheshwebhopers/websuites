import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/appColors/app_colors.dart';

class OrderMasterListScreenCard extends StatelessWidget {
  final String orderStatusTitle;
  final String dateTimeText;

  const OrderMasterListScreenCard({
    super.key,
    required this.orderStatusTitle,

    required this.dateTimeText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft, // Aligns the Card to the start
          child: Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: SizedBox(
              height: 50, // Fixed height for card
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
    orderStatusTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          dateTimeText,
                          style: TextStyle(
                            fontSize: 14,
                            color: AllColors.mediumPurple,
                          ),
                        ),
                        const SizedBox(width: 8),
                 Image.asset('assets/icons/Edit.png',color: AllColors.darkGrey,height: 17),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
