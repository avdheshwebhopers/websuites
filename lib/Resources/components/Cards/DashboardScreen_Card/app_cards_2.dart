import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Assets/app_fonts.dart';
import '../../app_colors.dart';

class AppCardsTwo extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final Color circleColorOne;
  final Color circleColorTwo;
  final Color circleTextColorTwo;
  final Color circleTextColorOne;


  const AppCardsTwo({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.circleColorOne,
    required this.circleColorTwo,
    required this.circleTextColorTwo,
    required this.circleTextColorOne,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.only(right: 12, left: 10, top: 4, bottom: 4),
        height: Get.height / 9.5,
        width: Get.width / 1.05,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],),
        child: Row(
            children: [
              Container(
                padding: EdgeInsets.only( left: 12, bottom: 4),

                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 12,
                        color: AppColors.blackColor,
                      ),),

                    SizedBox(height: 3,),
                    Text(subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 13,
                        color: AppColors.blackColor,
                      ),),
                    SizedBox(height: 3,),


                    Row(
                      children: [
                        Icon(Icons.access_time, size: 15, color: AppColors.vividPurple,),

                        SizedBox(width: 5,),
                        Text(date,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 11,
                            color: AppColors.vividPurple,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),

              Container(
                // color: Colors.green,
                height: Get.height / 9.4,
                width: Get.width / 5,
                padding: EdgeInsets.only(top: 6, bottom: 8, right: 4),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Icon(Icons.more_vert, size: 20,
                                color: AppColors.blackColor,)),
                        ],
                      ),
                      Spacer(),

                      Container(

                        // color: Colors.blue,
                        margin: EdgeInsets.only(right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: Get.height / 19,
                                width: Get.width / 19,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: circleColorOne,
                                ),
                                child: Center(
                                  child: Text('G', style: TextStyle(
                                    color: circleTextColorOne,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular,
                                  ),),
                                )
                            ),

                            SizedBox(width: 6,),


                            Container(
                                height: Get.height / 19,
                                width: Get.width / 19,

                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColorTwo
                                ),
                                child: Center(
                                  child: Text('A', style: TextStyle(
                                    color: circleTextColorTwo,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular,
                                  ),),
                                )
                            ),
                          ],
                        ),
                      )
                    ]
                ),
              ),
            ]
        ),
      );


    //   Container(
    //   height: Get.height / 9.5,
    //   width: Get.width / 1.05,
    //   decoration: BoxDecoration(
    //     color: App_Colors.whiteColor,
    //     borderRadius: BorderRadius.circular(10),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black45.withOpacity(0.06),
    //         spreadRadius: 0.5,
    //         blurRadius: 4,
    //         offset: Offset(0, 0),
    //       ),
    //     ],),
    //     child: Row(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only( left: 12, bottom: 4),
    //
    //           child:
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(title,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w400,
    //                   fontFamily: AppFonts.nunitoRegular,
    //                   fontSize: 16,
    //                   color: App_Colors.blackColor,
    //                 ),),
    //
    //               SizedBox(height: 2,),
    //               Text(subtitle,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w500,
    //                   fontFamily: AppFonts.nunitoRegular,
    //                   fontSize: 18,
    //                   color: App_Colors.blackColor,
    //                 ),),
    //               SizedBox(height: 2,),
    //               Row(
    //                 children: [
    //                   Icon(Icons.access_time, size: 20, color: App_Colors.vividPurple,),
    //                   SizedBox(width: 5,),
    //                   Text(date,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.w400,
    //                       fontFamily: AppFonts.nunitoRegular,
    //                       fontSize: 15,
    //                       color: App_Colors.vividPurple,
    //                     ),),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         Spacer(),
    //
    //         Container(
    //           height: Get.height / 10,
    //           width: Get.width / 5,
    //           padding: EdgeInsets.only(top: 10, bottom: 8, right: 10),
    //           child:
    //           Column(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     InkWell(
    //                         onTap: () {},
    //                         child: Icon(Icons.more_vert, size: 25,
    //                           color: App_Colors.grey,)),
    //                   ],
    //                 ),
    //                 Spacer(),
    //
    //                 Container(
    //                   padding: EdgeInsets.only(right: 15),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       Container(
    //                           height: Get.height / 19,
    //                           width: Get.width / 19,
    //
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             color: circleColorOne,
    //                           ),
    //                           child: Center(
    //                             child: Text('G', style: TextStyle(
    //                               color: circleTextColorOne,
    //                               fontSize: 18,
    //                               fontFamily: AppFonts.nunitoRegular,
    //                             ),),
    //                           )
    //                       ),
    //
    //                       SizedBox(width: 8,),
    //
    //
    //                       Container(
    //                           height: Get.height / 19,
    //                           width: Get.width / 19,
    //
    //                           decoration: BoxDecoration(
    //                               shape: BoxShape.circle,
    //                               color: circleColorTwo
    //                           ),
    //                           child: Center(
    //                             child: Text('A', style: TextStyle(
    //                               color: circleTextColorTwo,
    //                               fontSize: 18,
    //                               fontFamily: AppFonts.nunitoRegular,
    //                             ),),
    //                           )
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ]
    //           ),
    //         ),
    //       ]
    //   ),
    // );
  }
}

class AppCardsTwoTab extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final Color circleColorOne;
  final Color circleColorTwo;
  final Color circleTextColorTwo;
  final Color circleTextColorOne;


  const AppCardsTwoTab({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.circleColorOne,
    required this.circleColorTwo,
    required this.circleTextColorTwo,
    required this.circleTextColorOne,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return
      Container(
        margin: EdgeInsets.only(right: 12, left: 10, top: 5, bottom: 5),
        height: screenSize.height / 7.5,
        width: screenSize.width / 1.05,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.06),
              spreadRadius: 0.5,
              blurRadius: 4,
              offset: Offset(0, 0),
            ),
          ],),
        child: Row(
            children: [
              Container(
                padding: EdgeInsets.only( left: 12, bottom: 4),

                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 15,
                        color: AppColors.blackColor,
                      ),),

                    SizedBox(height: 5,),
                    Text(subtitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.nunitoRegular,
                        fontSize: 17,
                        color: AppColors.blackColor,
                      ),),
                    SizedBox(height: 5,),


                    Row(
                      children: [
                        Icon(Icons.access_time, size: 15, color: AppColors.vividPurple,),

                        SizedBox(width: 5,),
                        Text(date,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.nunitoRegular,
                            fontSize: 14,
                            color: AppColors.vividPurple,
                          ),),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),

              Container(
                // color: Colors.green,
                // height: Get.height / 9.4,
                // width: Get.width / 5,
                // margin: const EdgeInsets.only(top: 6, bottom: 6, right: 7),
                padding: EdgeInsets.only(top: 12, bottom: 8, right: 12),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () {},
                              child: Icon(Icons.more_vert, size: 30,
                                color: AppColors.blackColor,)),
                        ],
                      ),
                      Spacer(),

                      Container(

                        // color: Colors.blue,
                        margin: EdgeInsets.only(right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: Get.height / 19,
                                width: Get.width / 19,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: circleColorOne,
                                ),
                                child: Center(
                                  child: Text('G', style: TextStyle(
                                    color: circleTextColorOne,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular,
                                  ),),
                                )
                            ),




                            Container(
                                height: Get.height / 19,
                                width: Get.width / 19,

                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: circleColorTwo
                                ),
                                child: Center(
                                  child: Text('A', style: TextStyle(
                                    color: circleTextColorTwo,
                                    fontSize: 13,
                                    fontFamily: AppFonts.nunitoRegular,
                                  ),),
                                )
                            ),
                          ],
                        ),
                      )
                    ]
                ),
              ),
            ]
        ),
      );


    //   Container(
    //   height: Get.height / 9.5,
    //   width: Get.width / 1.05,
    //   decoration: BoxDecoration(
    //     color: App_Colors.whiteColor,
    //     borderRadius: BorderRadius.circular(10),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.black45.withOpacity(0.06),
    //         spreadRadius: 0.5,
    //         blurRadius: 4,
    //         offset: Offset(0, 0),
    //       ),
    //     ],),
    //     child: Row(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only( left: 12, bottom: 4),
    //
    //           child:
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Text(title,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w400,
    //                   fontFamily: AppFonts.nunitoRegular,
    //                   fontSize: 16,
    //                   color: App_Colors.blackColor,
    //                 ),),
    //
    //               SizedBox(height: 2,),
    //               Text(subtitle,
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.w500,
    //                   fontFamily: AppFonts.nunitoRegular,
    //                   fontSize: 18,
    //                   color: App_Colors.blackColor,
    //                 ),),
    //               SizedBox(height: 2,),
    //               Row(
    //                 children: [
    //                   Icon(Icons.access_time, size: 20, color: App_Colors.vividPurple,),
    //                   SizedBox(width: 5,),
    //                   Text(date,
    //                     style: TextStyle(
    //                       fontWeight: FontWeight.w400,
    //                       fontFamily: AppFonts.nunitoRegular,
    //                       fontSize: 15,
    //                       color: App_Colors.vividPurple,
    //                     ),),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //         Spacer(),
    //
    //         Container(
    //           height: Get.height / 10,
    //           width: Get.width / 5,
    //           padding: EdgeInsets.only(top: 10, bottom: 8, right: 10),
    //           child:
    //           Column(
    //               crossAxisAlignment: CrossAxisAlignment.end,
    //
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     InkWell(
    //                         onTap: () {},
    //                         child: Icon(Icons.more_vert, size: 25,
    //                           color: App_Colors.grey,)),
    //                   ],
    //                 ),
    //                 Spacer(),
    //
    //                 Container(
    //                   padding: EdgeInsets.only(right: 15),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.end,
    //                     children: [
    //                       Container(
    //                           height: Get.height / 19,
    //                           width: Get.width / 19,
    //
    //                           decoration: BoxDecoration(
    //                             shape: BoxShape.circle,
    //                             color: circleColorOne,
    //                           ),
    //                           child: Center(
    //                             child: Text('G', style: TextStyle(
    //                               color: circleTextColorOne,
    //                               fontSize: 18,
    //                               fontFamily: AppFonts.nunitoRegular,
    //                             ),),
    //                           )
    //                       ),
    //
    //                       SizedBox(width: 8,),
    //
    //
    //                       Container(
    //                           height: Get.height / 19,
    //                           width: Get.width / 19,
    //
    //                           decoration: BoxDecoration(
    //                               shape: BoxShape.circle,
    //                               color: circleColorTwo
    //                           ),
    //                           child: Center(
    //                             child: Text('A', style: TextStyle(
    //                               color: circleTextColorTwo,
    //                               fontSize: 18,
    //                               fontFamily: AppFonts.nunitoRegular,
    //                             ),),
    //                           )
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ]
    //           ),
    //         ),
    //       ]
    //   ),
    // );
  }
}

