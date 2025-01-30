import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/components/buttons/common_button.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String selectedTab = 'Feed'; // Track selected tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Vivek Rai',style: TextStyle(fontFamily: FontFamily.sfPro,fontSize: 22,fontWeight: FontWeight.w600),),
              ),
            ),
            Row(
              children: [
              Image.asset('assets/icons/edit.png',height: 18,width: 18,)
              

              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top: 0,bottom: 15,right: 0,left: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Profile Image Stack
                    Container(
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomCenter,
                        children: [
                          Row(
                            children:[
                              Expanded(
                                child: Container(
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage('https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg')
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 100.0,
                            child: Container(
                              height: 190.0,
                              width: 190.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage('https://easy-peasy.ai/cdn-cgi/image/quality=80,format=auto,width=700/https://fdczvxmwwjwpwbeeqcth.supabase.co/storage/v1/object/public/images/50dab922-5d48-4c6b-8725-7fd0755d9334/3a3f2d35-8167-4708-9ef0-bdaa980989f9.png'),
                                ),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 6.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Name Container
                    Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 125.0,
                      child: Text(
                        'Vivek Rai',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27.0,
                          fontFamily: FontFamily.sfPro
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Title
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Flutter Developer',
                        style: TextStyle(fontSize: 17.0,fontFamily: FontFamily.sfPro),
                      ),
                    ),

                    // Tab Bar
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Feed';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Feed' ? AllColors.lightBlue : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Feed',
                                style: TextStyle(
                                  color: selectedTab == 'Feed' ? AllColors.darkBlue : Colors.black,
                                  fontSize: selectedTab == 'Feed' ? 17 : 17,  // Larger size when selected
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: selectedTab == 'Feed' ? FontWeight.bold : FontWeight.normal, // Bold when selected
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'About';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: selectedTab == 'About' ? AllColors.lightBlue : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'About',
                                style: TextStyle(
                                  color: selectedTab == 'About' ? AllColors.darkBlue : Colors.black,
                                  fontFamily: FontFamily.sfPro,
                                  fontSize: selectedTab == 'About' ? 17 : 17,  // Larger size when selected
                                  fontWeight: selectedTab == '  About' ? FontWeight.bold : FontWeight.normal, // Bold when selected

                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Friends';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Friends' ? AllColors.lightBlue : Colors.transparent,

                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Friends',
                                style: TextStyle(
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: selectedTab == 'Friends' ? FontWeight.bold : FontWeight.normal, // Bold when selected
                                  color: selectedTab == 'Friends' ? AllColors.darkBlue : Colors.black,
                                  fontSize: selectedTab == 'Friends' ? 17 : 17,  // Larger size when selected

                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTab = 'Photos';
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: selectedTab == 'Photos' ?AllColors.lightBlue : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Photos',
                                style: TextStyle(
                                  fontFamily: FontFamily.sfPro,
                                  fontWeight: selectedTab == 'Photos' ? FontWeight.bold : FontWeight.normal, // Bold when selected
                                  color: selectedTab == 'Photos' ? AllColors.darkBlue : Colors.black,
                                  fontSize: selectedTab == 'Photos' ? 17 : 17,  // Larger size when selected

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),



              // Content based on selected tab
              if (selectedTab == 'Feed') ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      // Founder Container
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.work,size: 22,color: Colors.grey,),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 15.0, color: Colors.black, fontFamily: FontFamily.sfPro,),
                                      children: [
                                        TextSpan(text: 'Founder and CEO at ',style: TextStyle(fontFamily: FontFamily.sfPro,)),
                                        TextSpan(
                                          text: 'WebHopers',
                                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: FontFamily.sfPro,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(Icons.work,color: Colors.grey,size: 22,),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 15.0, color: Colors.black,fontFamily: FontFamily.sfPro),
                                      children: [
                                        TextSpan(text: 'Works at '),
                                        TextSpan(
                                          text: 'WebHopers',
                                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: FontFamily.sfPro),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),

                            Row(
                              children: [
                                Icon(Icons.school,size: 22,color: Colors.grey,),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 15.0, color: Colors.black,fontFamily: FontFamily.sfPro),
                                      children: [
                                        TextSpan(text: 'Studied Computer Science at '),
                                        TextSpan(
                                          text: 'WebHopers',

                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                Icon(Icons.location_on,size: 22,color: Colors.grey,),
                                SizedBox(width: 10),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(fontSize: 15.0, color: Colors.black,fontFamily: FontFamily.sfPro),
                                      children: [
                                        TextSpan(text: 'From '),
                                        TextSpan(
                                          text: 'Zirakpur Punjab',
                                          style: TextStyle(fontWeight: FontWeight.bold,fontFamily: FontFamily.sfPro),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),



                      Row(
                        children:[
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(AllColors.lightBlue), // Correct way to set background color
                                shape: MaterialStateProperty.all(RoundedRectangleBorder( // Correct way to set shape
                                  borderRadius: BorderRadius.circular(22),
                                )),
                              ),
                              onPressed: () {
                                // Your onPressed action here
                              },
                              child: Text(
                                'Load More',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: FontFamily.sfPro, // Your custom font family
                                  color: AllColors.darkBlue, // Your custom text color
                                ),
                              ),
                            ),
                          ),
                        ],
                      )



                    ],
                  ),
                ),
              ]
              else if (selectedTab == 'About') ...[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Hello! This is the About section.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ]
              else if (selectedTab == 'Photos') ...[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Photos',
                          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        // Use GridView for images
                        GridView.builder(
                          shrinkWrap: true, // Makes the GridView take as much space as required
                          physics: NeverScrollableScrollPhysics(), // Prevent scrolling if inside a scrollable body
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Two items per row
                            crossAxisSpacing: 10.0, // Horizontal space between items
                            mainAxisSpacing: 10.0, // Vertical space between items
                            childAspectRatio: 1.0, // Ensures a square aspect ratio for the cards
                          ),
                          itemCount: 4, // Total number of images
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22), // Border radius for the card
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(22), // Apply border radius to the image
                                child: Image.network(
                                  index % 2 == 0
                                      ? 'https://i0.wp.com/theparentcue.org/wp-content/uploads/2021/04/What-to-Do-When-Youre-Concerned-About-Your-Kids-New-Group-of-Friends-scaled.jpg?fit=2560%2C1707&ssl=1'
                                      : 'https://images.pexels.com/photos/935835/pexels-photo-935835.jpeg?cs=srgb&dl=pexels-vjapratama-935835.jpg&fm=jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ]

                else if(selectedTab =='Friends')...[
                    Text("Hello Frinds")
                  ]
            ],

          ),

        ],
      ),
    );
  }
}
