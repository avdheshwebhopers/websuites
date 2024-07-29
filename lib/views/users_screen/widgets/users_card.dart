import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
  
import '../../../utils/app_colors/app_colors.dart';


class UsersScreenCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const UsersScreenCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<UsersScreenCard> createState() => _UsersScreenCardState();
}

class _UsersScreenCardState extends State<UsersScreenCard> {
  bool isSwitched = true;


  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(bottom: 10),
        height: Get.height/4.4,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AllColors.blackColor.withOpacity(0.06),
                  spreadRadius: 2,
                  blurRadius: 4
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('dineshkumar.webhopers@gmail.com', style: TextStyle(
                      color: AllColors.grey,
                        
                      fontSize: 11,
                      fontWeight: FontWeight.w400
                  ),),

                  Container(
                    height: Get.height/45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: AllColors.lighterOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(widget.subtitle, style: TextStyle(
                          color: AllColors.vividOrange,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                            
                      ),),
                    ),
                  ),
                ],
              ),

              Text(widget.title, style: TextStyle(
                  color: AllColors.blackColor,
                    
                  fontSize: 19,
                  fontWeight: FontWeight.w700
              ),),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined,size: 18, color: AllColors.mediumPurple,),
                  SizedBox(width: 10,),
                  Text('11/10/2023', style: TextStyle(
                      color: AllColors.mediumPurple,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                        
                  ),),

                  Spacer(),

                  Text('REPORT TO - ', style: TextStyle(
                    color: AllColors.blackColor,
                      
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),),

                  Text('Mukesh Sharma', style: TextStyle(
                      color: AllColors.mediumPurple,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                        
                  ),),
                ],
              ),

              Row(
                children: [
                  Icon(Icons.call_rounded, size: 15, color: AllColors.lightGrey,),
                  SizedBox(width: 5,),
                  Text('+91-8171957605', style: TextStyle(
                    color: AllColors.lightGrey,
                      
                    fontSize: 12,
                  ),),

                  Spacer(),

                  Text('ACTIONS - ', style: TextStyle(
                    color: AllColors.blackColor,
                    fontSize: 12,
                      
                    fontWeight: FontWeight.w600,
                  ),),

                  Icon(Icons.edit_calendar, size: 15,),
                  SizedBox(width: 4,),
                  Icon(Icons.shield_moon_outlined, size: 15,),
                ],
              ),

              const Divider(
                thickness: 0.4,
              ),

              Row(
                children: [
                  Text('DEPARTMENT', style: TextStyle(
                    color: AllColors.blackColor,
                      
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),),

                  SizedBox(width: 5,),

                  Icon(Icons.arrow_right_alt, size: 20),

                  SizedBox(width: 5,),
                  Text('Development', style: TextStyle(
                      color: AllColors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                        
                  ),),

                  Spacer(),

                  SizedBox(
                    height: Get.height/40,
                    width: Get.width/12,
                    child: Transform.scale(
                      scale: 0.7,
                      child: CupertinoSwitch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeColor: AllColors.mediumPurple,
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      );
  }
}