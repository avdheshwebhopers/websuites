import 'package:flutter/material.dart';
import '../../utils/appColors/app_colors.dart';


class TextStyles{

  static TextStyle textFormHintStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      // fontSize: MediaQuery.of(context).size.width * 0.013,
      fontSize: 13
    );
  }
  static EdgeInsets defaultPadding(BuildContext context) {
    return EdgeInsets.symmetric(horizontal: 10);
  }

  static Widget w400_13(BuildContext context, String message, {Color color = Colors.black}) {
    double screenWidth = MediaQuery.of(context).size.width;
    Map<double, double> fontSizeMap = { 500: 13,  1100: 13,  double.infinity: 17,};
    double fontSize = fontSizeMap.entries .firstWhere((entry) => screenWidth < entry.key, orElse: () => MapEntry(double.infinity, 17)) .value;
    return Text(
      message,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
      ),
    );
  }

// static aspecRatio(BuildContext context){
//     return AspectRatio(
//       aspectRatio:MediaQuery.of(context).size.width < 550
//           ? 7.5 / 1
//           : (MediaQuery.of(context).size.width < 1200 ? 4 / 1 : 3.5 / 1),
//     );
//
//   }

  // Updated method to make font size responsive
  static Widget w400_15(BuildContext context, String message, {Color color = Colors.black}) {
    double screenWidth = MediaQuery.of(context).size.width; double fontSize = screenWidth < 550 ? 13 : 13;
    return Text(
   message,
   style: TextStyle(
   fontWeight: FontWeight.w400,
   fontSize: fontSize,
   color: color,
  ),
  );
  }



  static Widget w400_12(BuildContext context, String message, { Color color = Colors.black,}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 550 ? 12 : 12;
    return Text(
      message,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: fontSize,
        color: color,
      ),
    );
  }




  static w400_14(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: color
        )
    );
  }

  //============================================================================
//   w300

  static w300_10(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 10,
          color: color
        )
    );
  }

  static w300_12(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 12,
          color: color
        )
    );
  }

  //============================================================================
//   w500

  static w500_universal(context, String message, {Color color = Colors.black, double fontSize = 13.0}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: color,
          fontSize: fontSize
        ),
    );
  }

  static w500_12(BuildContext, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: color
        )
    );
  }

  static w500_16(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: color
        )
    );
  }

  static w500_14(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: color
        ),
    );
  }

  //============================================================================
//   w600

  static w600_12(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: color
        )
    );
  }

  static w600_15(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: color
        )
    );
  }

  static w600_universal(context, String message, {Color color = Colors.black, double fontSize = 30.0}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
          fontSize: fontSize
        )
    );
  }

  //============================================================================
//  w700

  static w700_17(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 17,
          color: color
        )
    );
  }

  static w700_16(context, String message, {Color color = Colors.black}) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          color: color
        )
    );
  }

//==============================================================================
// w500, 14, BlackColor,

  static w500_14_Black(context, String message) {
    return Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AllColors.blackColor
        )
    );
  }

  static w500_14_White(context, String message) {
    return Text(message,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AllColors.whiteColor
        )
    );
  }

  static w600_12_Black(context, String message) {
    return Text(message,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: AllColors.blackColor
    ),
    );
  }



  static const TextStyle datatable = TextStyle(
      color: Colors.black,
      fontSize: 13
  );

  static const TextStyle masterScreen = TextStyle(
    color: Colors.black,

    fontSize: 13
  );


  static const TextStyle namelength = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13
  );


}