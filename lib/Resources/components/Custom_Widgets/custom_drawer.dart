import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Assets/app_fonts.dart';
import '../../Assets/app_images.dart';
import '../List_TIles/custom_list_tile.dart';
import '../app_colors.dart';
import '../App_Buttons/generic_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
      Container(
          color: AppColors.whiteColor,
          width: Get.width/2,
          height: Get.height*1,
          child: Drawer(
            backgroundColor: AppColors.whiteColor,
            child:
            ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 13),
                  height: Get.height/9,
                  child: Row(

                    children: [
                      Container(
                        height: Get.height/10,
                        width: Get.width/10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,
                        ),
                        child: Center(
                            child: Image.asset(AppImages.Splash_WHLogo )),
                      ),
                      SizedBox(width:Get.width/40,),

                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('Sunil Kumar',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: AppFonts.nunitoRegular,

                            ),),
                          Text('+91-8810529887',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                fontFamily: AppFonts.nunitoRegular,
                                color: Colors.grey
                            ),),
                        ],
                      )
                    ],),
                ),

                Column(
                  children: [
                    CustomListTile(
                        icon: Icons.dashboard,
                        title: 'Dashboard',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.leaderboard,
                        title: 'Lead',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.person,
                        title: 'Customer',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.shopping_bag,
                        title: 'Orders',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.group,
                        title: 'HRM',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.analytics,
                        title: 'Analytics',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.dashboard,
                        title: 'Campaign',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.bar_chart,
                        title: 'Sales',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.person_2,
                        title: 'Roles',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.verified_user,
                        title: 'Users',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.add_task,
                        title: 'Tasks',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.data_object,
                        title: 'Projects',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.location_city_sharp,
                        title: 'Service Area',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.shopping_bag,
                        title: 'Products',
                        onTap: (){}
                    ),
                    CustomListTile(
                        icon: Icons.grade,
                        title: 'Master',
                        onTap: (){}
                    ),
                  ],
                ),

                SizedBox(height: 100,),

                const Divider(
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,

                ),

                Container(
                    height: Get.height/20,
                    width: Get.width/2,
                    padding: EdgeInsets.only(left: 20),

                    child: Text('version 1.0.12',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: AppFonts.nunitoRegular,
                          fontSize: 10,
                          color: AppColors.grey
                      ),)
                ),

                Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: GenericButton(
                      height: Get.height/30,
                      width: Get.width/4,
                      title: 'Logout',
                      onPress: (){}
                  ),
                )

              ],
            ),
          )
      ),
    );
  }
}
