import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../../../../../utils/components/widgets/sizedBoxes/sizedBox_10w.dart';
import '../../../../../utils/components/widgets/sizedBoxes/sizedBox_5w.dart';


class OrderProformaListCard extends StatelessWidget {
  final String title;

  const OrderProformaListCard({
    super.key,
    required this.title,
  });


  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: Get.height/5.5,
        width: Get.width/1,
        decoration: BoxDecoration(
            color: AllColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AllColors.blackColor.withOpacity(0.06),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ]
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('gayatri@bpis.health', style: TextStyle(
                      color: AllColors.grey,
                        
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                  ),

                  SizedBox10w(),

                  Container(
                    height: Get.height/45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: AllColors.lighterOrange,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text('Customer', style: TextStyle(
                          color: AllColors.vividOrange,
                          fontWeight: FontWeight.w400,
                            
                          fontSize: 12
                      ),),
                    ),
                  ),
                  const Spacer(),

                  Text('#254', style: TextStyle(
                    color: AllColors.grey,
                    fontSize: 12,
                      
                    fontWeight: FontWeight.w400,
                  ),),
                ],
              ),

              Text(title, style: TextStyle(
                  color: AllColors.blackColor,
                  fontWeight: FontWeight.w700,
                    
                  fontSize: 18
              ),),

              Row(
                children: [
                  Icon(Icons.calendar_month_outlined, size: 15, color: AllColors.mediumPurple,),

                  SizedBox5w(),
                  Text('Jun 26, 2024', style: TextStyle(
                      fontSize: 13,
                        
                      fontWeight: FontWeight.w400,
                      color: AllColors.mediumPurple
                  ),),
                  Spacer(),

                  Container(
                    height: Get.height/40,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: AllColors.lighterPurple,
                        borderRadius :BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text('Ashish Mohan', style: TextStyle(
                          color: AllColors.mediumPurple,
                          fontWeight: FontWeight.w400,
                            
                          fontSize: 12
                      ),),
                    ),
                  )
                ],
              ),

              const Divider(
                thickness: 0.4,
              ),

              Container(
                height: Get.height/40,
                width: Get.width/4,
                decoration: BoxDecoration(
                  color: AllColors.lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text('View Proforma', style: TextStyle(
                      color: AllColors.darkBlue,
                      fontWeight: FontWeight.w400,
                        
                      fontSize: 12
                  ),),
                ),
              )
            ],
          ),
        ),
      );
  }
}