import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/Responsive/Custom_Drawer.dart';
import '../../../../utils/appColors/app_colors.dart';
import '../../../homeScreen/home_screen.dart';

class CustomerOrderDetailView extends StatelessWidget {
  const CustomerOrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    final screenWidth = MediaQuery.of(context).size.width;
    final isTabletOrDesktop = screenWidth >= 500;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: !isTabletOrDesktop
          ? Drawer(
        child: Obx(() => CustomDrawer(
          selectedIndex: controller.selectedIndex.value,
          onItemSelected: (index) =>
              controller.onDrawerItemTapped(index, context),
          isCollapsed: controller.isCollapsed.value,
          onCollapseToggle: controller.toggleDrawerCollapse,
          isTabletOrDesktop: isTabletOrDesktop,
        )),
      )
          : null,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Lead Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header with title and edit icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const
                          Expanded(
                            child: Text(
                              'Rudra Singh',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color:AllColors.lightGreen,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child:  Text(
                              'Active',
                              style: TextStyle(color:AllColors.greenJungle, fontSize: 12),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Image.asset('assets/icons/rotate_edit.png', height: 17,width: 15.69,),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Email and Phone row
                      Row(
                        children: [

                          Image.asset('assets/svg/email.svg',height: 14,width: 14,),

                          const SizedBox(width: 9),
                          Text(
                            'dr.r.kpharma1@gmail.com',
                            style: TextStyle(color: AllColors.mediumPurple),
                          ),
                          const Spacer(),
                          Image.asset('assets/icons/Phone(call).png',height: 14,width: 14,),
                          const SizedBox(width: 8),
                          Text(
                            '+91-9041628788',
                            style: const TextStyle(color: Colors.blue,fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Address row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Image.asset('assets/icons/location.png',height: 14,width: 14,),
                          ),
                          const SizedBox(width: 9),
                          Expanded(
                            child: Text(
                              'Scf 23, motor market, Panchkula, Haryana 134113, India',
                              style: const TextStyle(color: Colors.grey,fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Business name row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 2),
                              child:
                              Image.asset('assets/icons/building.png',height: 13.25,width: 13.33,color: Colors.black,)
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              'The Suman Marvelous',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Action buttons row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                        Row(
                          children: [

                            Positioned(
                              top: 271, // Position the button from the top
                              left: 16, // Adjust left positioning as required
                              child: SizedBox(
                                width: 65, // Set the width
                                height: 15, // Set the height
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange.withOpacity(0.1), // Set background color
                                    foregroundColor: Colors.orange, // Set text color
                                    elevation: 0, // Remove button shadow
                                    padding: EdgeInsets.zero, // Remove padding to fit exact size
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Add border radius
                                    ),


                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/svg/comments_plus.svg',height: 9,width: 9,),
                                      SizedBox(width: 3),
                                      const Text(
                                        'Proforma',
                                        style: TextStyle(
                                          fontSize: 10, // Set font size
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            const SizedBox(width: 9),

                            Positioned(
                              top: 271, // Position from the top
                              left: 99, // Position from the left
                              child: SizedBox(
                                width: 41, // Width of the button
                                height: 15, // Height of the button
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.withOpacity(0.1), // Background color
                                    foregroundColor: Colors.blue, // Text color
                                    elevation: 0, // Remove shadow
                                    padding: EdgeInsets.zero, // Remove default padding to fit size
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Add border radius
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const
                                      Icon(Icons.add,size: 14,),
                                      SizedBox(width: 0,),
                                      Text(
                                        'Task',
                                        style: TextStyle(
                                          fontSize: 1, // Adjust font size
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            const SizedBox(width: 9),

                            Positioned(
                              top: 271, // Position from the top
                              left: 145, // Position from the left
                              child: SizedBox(
                                width: 53, // Width of the button
                                height: 15, // Height of the button
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green.withOpacity(0.1), // Background color
                                    foregroundColor: Colors.green, // Text color
                                    elevation: 0, // No shadow
                                    padding: EdgeInsets.zero, // Remove default padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Add border radius
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Image.asset('assets/svg/edit_pen.svg',height: 9,width: 9,),
                                      SizedBox(width: 3,),

                                      const Text(
                                        'Status',
                                        style: TextStyle(
                                          fontSize: 10, // Adjust font size
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 9),
                            Positioned(
                              top: 271, // Position from the top
                              left: 203, // Position from the left
                              child: SizedBox(
                                width: 70, // Button width
                                height: 15, // Button height
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple.withOpacity(0.1), // Background color
                                    foregroundColor: Colors.deepPurple, // Text color
                                    elevation: 0, // Remove shadow
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2), // Add border radius
                                    ),
                                    padding: EdgeInsets.zero, // Ensure button fits exactly in the SizedBox
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Image.asset('assets/svg/projection.svg',height: 9,width: 9,color: AllColors.mediumPurple,),
                                      SizedBox(width: 3,),
                                      Text(
                                        'Projection',
                                        style: TextStyle(
                                            fontSize: 10, // Fon
                                            color: AllColors.mediumPurple// t size
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(),
                      const SizedBox(height: 8),
                      // Company info with hot tag
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 2),
                              child:Image.asset('assets/svg/gridview.svg',height: 12,width: 12,)
                          ),
                          const SizedBox(width: 11),
                          const Expanded(
                            child: Text(
                              'PharmaHopers',
                              style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                            ),
                          ),

                          Image.asset('assets/svg/person.svg',height: 10.75,width: 9.34,),
                          SizedBox(width: 12,),
                          Text(
                            'Kewal Rana',
                            style: TextStyle(color: Colors.blue,fontSize: 12),
                          ),

                        ],
                      ),
                      const SizedBox(height: 8),


                      // Date and Direct tag row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Image.asset('assets/icons/date.png', height: 14, width: 14),
                          ),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              '18 Nov, 2024 04:25 PM',
                              style: TextStyle(color: AllColors.mediumPurple, fontSize: 12),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 8),

                      // Person info row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset('assets/icons/google_forms.png', height: 14, width: 14,color: Colors.grey,),
                          const SizedBox(width: 9.67),
                          const Text(
                            'Mastermind Finance is a top and well known',
                            style: TextStyle(color: Colors.grey,fontSize: 12,),
                          ),
                          Text(' Read More',style: TextStyle(color: Colors.blue,fontSize: 12),)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset('assets/icons/google_forms.png', height: 14, width: 14,color: Colors.red,),
                          const SizedBox(width: 9.67),
                          const Text(
                            'Lorem ipsum dolor ',
                            style: TextStyle(color: Colors.red,fontSize: 12,),
                          ),

                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          const Text(
                            'MORE INFORMATION',
                            style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),
                          ),

                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [


                          Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'INDUSTRY',
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Real Estate',
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                              ),

                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment:CrossAxisAlignment.end,
                            children: [
                              const Text(
                                'INDUSTRY_TYPE',
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Manufacturer/Suppliers',
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                              ),

                            ],
                          ),


                        ],
                      ),

                      // Description row



                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}