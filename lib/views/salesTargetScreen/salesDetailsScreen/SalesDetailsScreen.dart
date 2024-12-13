import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

import '../../../utils/appColors/app_colors.dart';

class Salesdetailsscreen extends StatefulWidget {
  const Salesdetailsscreen({super.key});

  @override
  State<Salesdetailsscreen> createState() => _SalesdetailsscreenState();
}

class _SalesdetailsscreenState extends State<Salesdetailsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      title: Row(

        children: [
          Text("Dinesh Thakur October Sale Target",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)

        ],
      ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 15),
        child: Column(
          children: [
        Expanded(

          child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: Get.height / 7,
          width: Get.width / 1,
          decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
          
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Row(
                   children: [
                     Text("Select User"),
                     Text("(7)",style: TextStyle(color: Colors.red),),
                   ],
                 ),
                SizedBox(height: 15,),
                CreateNewLeadScreenCard(
                    hintText: 'Select User',
                  categories: [],
          
                )
              ],
            ),
          ),
              ),
        ),
        
          ],
        ),
      )
    );
  }
}
