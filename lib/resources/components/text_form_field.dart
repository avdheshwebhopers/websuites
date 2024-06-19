import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Resources/components/app_colors.dart';

class GenericTextFormField extends StatelessWidget {
  GenericTextFormField({

    this.title,
    this.node,
    this.hintText,
    this.labelText,
    this.icon,
    this.validator,

    Key? key}) : super(key: key);

  dynamic title;
  dynamic node;
  String? hintText;
  String? labelText;
  dynamic icon;
  dynamic validator;

  @override
  Widget build(BuildContext context) {
    return
      Container(margin: EdgeInsets.only(bottom: 1.5.h),
          child: TextFormField(
            style: TextStyle(fontSize: 18.sp),
            controller: title,
            focusNode: node,
            maxLines: null,
    textInputAction: TextInputAction.next,
    validator: validator,
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.welcomeColor)
    ),
    focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.welcomeColor)
    ),
    errorBorder: OutlineInputBorder(
    borderRadius:
    const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.red.shade700)),
    focusedErrorBorder: OutlineInputBorder(
    borderRadius:
    const BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: Colors.red.shade700)),
    contentPadding: const EdgeInsets.fromLTRB(0,15,10,15),
    border: InputBorder.none,
    prefixIcon: Padding(
    padding: EdgeInsets.all(2.w),
    child: Icon(icon ,size: 2.5.h,),
    ),
    hintText: hintText,
    labelText: labelText,
    ),

    ));
  }
}
