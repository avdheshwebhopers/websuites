import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/utils/appColors/app_colors.dart';
import 'package:websuites/utils/fontfamily/FontFamily.dart';

import '../../../utils/button/CustomButton.dart';
import '../../leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

class ProjectMasterScreen extends StatefulWidget {
  const ProjectMasterScreen({super.key});

  @override
  State<ProjectMasterScreen> createState() => _ProjectMasterScreenState();
}

class _ProjectMasterScreenState extends State<ProjectMasterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Project Master'),
            Spacer(),
            CustomButton(

                width: 70,
                height: 22,
                borderRadius: 54,
                child:
               Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: AllColors.whiteColor, size: 18,),
                      SizedBox(width: 5,),
                      Text('Add', style: TextStyle(fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: FontFamily.sfPro),),
                    ],
                  ),

                onPressed: () {
                  _showAddProductBottomSheet();
                })

          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(

          children: [
            CreateNewLeadScreenCard(hintText: 'Search'),
            SizedBox(height: 10,),
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8.0,
                      spreadRadius: 3.0,
                    ),
                  ],
                ), child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("OnPageSeo", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.sfPro,
                        fontSize: 18),),
                    Spacer(),

                    Container(
                        color: Colors.green,
                        child: Text(
                          "Active", style: TextStyle(fontWeight: FontWeight
                            .bold,
                            fontFamily: FontFamily.sfPro,
                            fontSize: 12,
                            color: AllColors.whiteColor),)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("11/12/2002", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontFamily.sfPro,
                        fontSize: 12,
                        color: AllColors.mediumPurple),),
                    Spacer(),

                    Icon(Icons.edit, color: AllColors.grey, size: 18,),
                  ],
                ),


              ],
            )),
          ],
        ),
      ),
    );
  }

  void _showAddProductBottomSheet() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // Optional, to make the dialog corners rounded
          ),
          backgroundColor: Colors.white, // Set the background color to white
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Add New Tag',
                          style: TextStyle(
                            fontFamily: FontFamily.sfPro,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Text('Name *'),
                    CreateNewLeadScreenCard(hintText: 'Enter Tag name'),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            width: 70,
                            height: 22,
                            borderRadius: 54,
                            child:

                            Text(
                              'SUBMIT',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),


                            onPressed: () {},
                          ),
                          SizedBox(width: 20),
                          CustomButton(
                            backgroundColor: Colors.grey,

                            width: 70,
                            height: 22,
                            borderRadius: 54,
                            child:


                            Text(
                              'Reset',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: FontFamily.sfPro,
                              ),
                            ),



                            onPressed: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Positioned(
                    bottom: 20,
                    child: IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.close))),
              )

        ],
          ),
        ));
      },
    );
  }

}

