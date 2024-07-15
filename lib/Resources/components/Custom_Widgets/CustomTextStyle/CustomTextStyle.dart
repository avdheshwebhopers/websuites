import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class CustomTextWidget extends StatelessWidget {
  final FontWeight;
  final color;
  final Fontsize;
  final text;

  const CustomTextWidget ({Key? key,
    required this.FontWeight,
    required this.color,
    required this.Fontsize,
    required this.text,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      color: color,
      fontFamily: AppFonts.nunitoRegular,
      fontWeight: FontWeight,
      fontSize: Fontsize,
    ));
  }
}