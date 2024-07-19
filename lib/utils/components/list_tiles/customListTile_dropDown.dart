import 'package:flutter/material.dart';
import '../../../Resources/all_fonts/all_fonts.dart';
import '../app_colors.dart';

class CustomListTile2 extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const CustomListTile2({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
      leading: Icon(icon, size: 16, color: AllColors.lightGrey,),
        trailing: Icon(Icons.arrow_drop_down, size: 20, color: AllColors.lightGrey,),
        title: Text(title,
            style: TextStyle(
                fontSize: 14,
                fontFamily: AllFonts.nunitoRegular,
                fontWeight: FontWeight.w300,
                color: AllColors.welcomeColor
            )
        ),
        onTap: onTap,
      );
  }
}





