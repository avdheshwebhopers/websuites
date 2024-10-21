import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';


class Utils {

  static void fieldFocusChange(BuildContext context,
      FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // static ToastMessage(String message) {
  //   Fluttertoast.showToast(msg: message,
  //     backgroundColor: AllColors.blackColor,
  //     gravity: ToastGravity.BOTTOM, // toast will show from the bottom
  //   );
  // }
  //
  // static ToastMessageCenter(String message) {
  //   Fluttertoast.showToast(msg: message,
  //     backgroundColor: AllColors.blackColor,
  //     gravity: ToastGravity.CENTER, // toast will show from the bottom
  //   );
  // }
//
  static snackbarFailed(String message) {
    Get.snackbar('failed', message,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.red, // Background color of the snackbar
      colorText: Colors.white,
    ); // Text color of the message);
  }

  static snackbarSuccess(String message) {
    Get.snackbar('Successful', message,
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: Colors.green, // Background color of the snackbar
      colorText: Colors.white,
    ); // Text color of the message);
  }

  static void flushBarSuccessMessage(String message, BuildContext context) {
    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        message: message,
        backgroundColor: Colors.green,
        title: 'Logout Successfully',
        messageColor: Colors.black,
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,
        reverseAnimationCurve: Curves.easeOut,
        positionOffset: 20,
        icon: Icon(Icons.error, size: 28, color: Colors.white,),
      )
        ..show(context),
    );
  }

  // static void flushBarErrorMessage(String message, BuildContext context) {
  //   showFlushbar(context: context,
  //     flushbar: Flushbar(
  //       forwardAnimationCurve: Curves.decelerate,
  //       margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //       padding: EdgeInsets.all(20),
  //       messageText: Text(
  //         message, style: TextStyle(fontSize: 16, color: Colors.white),),
  //       duration: Duration(seconds: 3),
  //       borderRadius: BorderRadius.circular(10),
  //       flushbarPosition: FlushbarPosition.BOTTOM,
  //       backgroundColor: Color(0xFFFA2521),
  //       reverseAnimationCurve: Curves.easeOut,
  //       positionOffset: 20,
  //       icon: Icon(Icons.error, size: 3, color: Colors.white),
  //     )
  //       ..show(context),
  //   );
  // }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.all(20),
        messageText: Text(
          message,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        duration: Duration(seconds: 3),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,  // Set to top
        backgroundColor: Color(0xFFFA2521),
        reverseAnimationCurve: Curves.easeOut,
        positionOffset: 20,
        icon: Icon(Icons.error, size: 28, color: Colors.white), // Adjust icon size
      )..show(context),
    );
  }


  void errorAlertDialogue(String? message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(Icons.error_outline, textDirection: TextDirection.ltr,
              color: Colors.red,
              size: 50,),
          ),
          content: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(message!, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          ),
        );
      },
    );
  }

  void successDialogue(String? message, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.check_circle_outlined, textDirection: TextDirection.ltr,
              color: Colors.green,
              size: 50,),
          ),
          content: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Text(message!, textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          ),
        );
      },
    );
  }

  void confirmationDialogue(String? message, String? title, onPress,
      BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: Text(title ?? ""),
        content: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Text(message!, textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        ),
        actions: <Widget>[
          CupertinoDialogAction(child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },),
          CupertinoDialogAction(child: Text('OK'),
              onPressed: onPress),
        ],
      );
    });
  }
}


