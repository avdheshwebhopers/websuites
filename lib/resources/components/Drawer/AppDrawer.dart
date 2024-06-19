import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Resources/Assets/app_images.dart';
import '../../../View_model/controllers/save_token/save_token.dart';
import '../List_TIles/custom_list_tile.dart';
import '../app_colors.dart';
import '../generic_button.dart';

class AppDrawer extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String version;

  AppDrawer({
    required this.userName,
    required this.phoneNumber,
    required this.version,
  });

  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: AppColors.whiteColor,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 13),
            height: Get.height / 9,
            child: Row(
              children: [
                Container(
                  height: Get.height / 10,
                  width: Get.width / 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.whiteColor,
                  ),
                  child:
                  Center(
                      child: Image.asset(AppImages.Splash_WHLogo)),
                ),
                SizedBox(width: Get.width / 30),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontFamily: 'NunitoRegular',
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        fontFamily: 'NunitoRegular',
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomListTile(
                icon: Icons.dashboard,
                title: 'Dashboard',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.leaderboard,
                title: 'Lead',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.person,
                title: 'Customer',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.shopping_bag,
                title: 'Orders',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.group,
                title: 'HRM',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.analytics,
                title: 'Analytics',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.dashboard,
                title: 'Campaign',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.bar_chart,
                title: 'Sales',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.person_2,
                title: 'Roles',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.verified_user,
                title: 'Users',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.add_task,
                title: 'Tasks',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.data_object,
                title: 'Projects',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.location_city_sharp,
                title: 'Service Area',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.shopping_bag,
                title: 'Products',
                onTap: () {},
              ),
              CustomListTile(
                icon: Icons.grade,
                title: 'Master',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Container(
            height: Get.height / 20,
            width: Get.width / 2,
            padding: EdgeInsets.only(left: 20),
            child: Text(
              version,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontFamily: 'NunitoRegular',
                fontSize: 10,
                color: AppColors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: GenericButton(
              height: Get.height / 30,
              width: Get.width / 4,
              title: 'Logout',
              onPress: () {
                // Replace SaveToken().removeToken(); with your actual token removal logic
                SaveToken().removeToken();
                Get.toNamed('/login_screen');
                Get.snackbar('Logout', 'Logout Successful');
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
