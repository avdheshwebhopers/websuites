import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/views/leadScreens/createNewLead/widgets/createNewLeadCard/create_new_lead_card.dart';

import '../../../../../data/models/responseModels/customers/orderProducts/customer_order_products_response_model.dart';
import '../../../../../utils/appColors/app_colors.dart';
import '../servicedilioug_box/ServiceDiliougeBox.dart';

class CustomerOrderProductScreenCard extends StatelessWidget {
  final String title;
  final String product;
  final String productCategory;
  final String info;
  final String servicesDate;
  final List<Services>? services;  // Add services parameter
  final String orderDate;
  final String orderby;

  const CustomerOrderProductScreenCard({
    Key? key,
    required this.title,
    required this.product,
    required this.productCategory,
    required this.info,
    required this.orderDate,
    required this.orderby,
    this.services,  // Make it optional
    required this.servicesDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController reasonController = TextEditingController();


    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AllColors.whiteColor,
        boxShadow: [
          BoxShadow(
              color: AllColors.blackColor.withOpacity(0.06),
              spreadRadius: 2,
              blurRadius: 4),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Info/Services Row
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AllColors.welcomeColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 10),
              if (services == null || services!.isEmpty)
                InkWell(
                  onTap: () {
                    print('Clicked on Services');
                    // Add your functionality here
                    showServicesDialog(context, services!); // Pass null to indicate no services
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AllColors.lighterOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '+ Services',
                        style: TextStyle(
                          color: AllColors.vividOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                )
              else

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: AllColors.lightGreen,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Running',
                              style: TextStyle(
                                color: AllColors.greenJungle,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: 5,),


                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              contentPadding: EdgeInsets.zero,
                              content: Container(
                                width: double.infinity,
                                height: 200, // Fixed height for the dialog
                                constraints: BoxConstraints(
                                  maxWidth: 400, // Maximum width
                                  minHeight: 200, // Minimum height
                                  maxHeight: 200, // Maximum height to keep it fixed
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Header row with title and close icon
                                    Container(
                                      width: double.infinity,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child:
                                            Row(
                                              children: [
                                                Text(
                                                  'Give a reason to quit the service',
                                                  style: TextStyle(fontSize: 14),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  '*',
                                                  style: TextStyle(fontSize: 14,color: Colors.red),


                                                ),
                                              ],
                                            )

                                          ),

                                          Material(
                                            color: Colors.transparent,
                                            child: InkWell(
                                              borderRadius: BorderRadius.circular(12),
                                              onTap: () => Navigator.of(context).pop(),
                                              child: Padding(
                                                padding: EdgeInsets.all(4),
                                                child: Icon(
                                                  Icons.close,
                                                  color: AllColors.mediumPurple,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minHeight: 80, // Minimum height for text area
                                            maxHeight: 80, // Maximum height for text area
                                          ),
                                          child: CreateNewLeadScreenCard(hintText: "Reason..."),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xFFD50020),
                                          minimumSize: const Size(150, 35),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(7),
                                          ),
                                        ),
                                        child: Text(
                                          'Quit Service',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: AllColors.lightRed,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Quit',
                                style: TextStyle(
                                  color: AllColors.darkRed,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )


                    ],
                  ),

            ],
          ),
          SizedBox(height: 5,),

          Row(
            children: [
              Expanded(
                child: Text(
                  product,
                  style: TextStyle(
                    color: AllColors.mediumGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 16), // Add fixed minimum spacing
              Text(
                servicesDate,
                style: TextStyle(
                  color: AllColors.mediumPurple,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),

          Row(
            children: [
              Icon(
                Icons.calendar_month_outlined,
                size: 18,
                color: AllColors.mediumPurple,
              ),
              SizedBox(width: 10),
              Text(
                orderDate,
                style: TextStyle(
                  color: AllColors.mediumPurple,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
          SizedBox(height: 8,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center, // Align everything in the center vertically
            children: [
              if (productCategory.toLowerCase() == 'pharmahopers')
                Padding(
                  padding: const EdgeInsets.only(right: 12), // Increased spacing
                  child: Image.asset(
                    'assets/images/pharmahopers.png',
                    height: 20, // Standard height for images
                    width: 100,  // Standard width for images
                    fit: BoxFit.contain,
                  ),
                ),

              if (productCategory.toLowerCase() == 'seo')
                Padding(
                  padding: const EdgeInsets.only(right: 12), // Increased spacing
                  child: Image.asset(
                    'assets/images/seo.png',
                    height: 20, // Standard height for images
                    width: 45,  // Standard width for images
                    fit: BoxFit.contain,
                  ),
                ),

              // Larger PPC Image
              if (productCategory.toLowerCase() == 'ppc')
                Padding(
                  padding: const EdgeInsets.only(right: 12), // Spacing between images
                  child: Image.asset(
                    'assets/images/ppc.png',
                    height: 33, // Larger height for PPC image
                    // width: 80,  // Larger width for PPC image
                    fit: BoxFit.contain,
                  ),
                ),

              if (productCategory.toLowerCase() == 'webhopers')
                Padding(
                  padding: const EdgeInsets.only(right: 12), // Increased spacing
                  child: Image.asset(
                    'assets/images/webhopers_logo.png',
                    height: 20, // Standard height for images
                    width: 89,  // Standard width for images
                    fit: BoxFit.contain,
                  ),
                ),

              if (productCategory.toLowerCase() == 'development')
                Padding(
                  padding: const EdgeInsets.only(right: 12), // Increased spacing
                  child: Image.asset(
                    'assets/images/development.png',
                    height: 20, // Standard height for images
                    width: 68,  // Standard width for images
                    fit: BoxFit.contain,
                  ),
                ),

              if (productCategory.toLowerCase() == 'wordpress')
                Padding(
                  padding: const EdgeInsets.only(right: 12), // Increased spacing
                  child: Image.asset(
                    'assets/images/wordpress.png',
                    height: 25, // Standard height for images
                    width: 49,  // Standard width for images
                    fit: BoxFit.contain,
                  ),
                ),

              const Spacer(),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AllColors.lighterPurple, // Background color
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: InkWell(
                    child: Text(
                      orderby,
                      style: TextStyle(
                        color: AllColors.mediumPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ],
          )




        ],
      ),
    );
  }






}










