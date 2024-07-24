import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/utils/components/custom_widgets/custom_drawer/custom_drawer.dart';
import 'package:websuites/views/order_screen/widgets%20/order_proforma_list_card/order_proforma_list_card.dart';



import '../../Resources/all_fonts/all_fonts.dart';

import '../../utils/components/Custom_Widgets/Custom_SizedBoxes/sizedBox_5w.dart';
import '../../utils/components/app_colors.dart';
import '../../utils/components/custom_widgets/custom_appBar/custom_appBar.dart';
import '../../utils/components/custom_widgets/custom_sizedBoxes/sizedBox_10w.dart';


class OrderProformaList extends StatefulWidget {
  const OrderProformaList({super.key});

  @override
  State<OrderProformaList> createState() => _OrderProformaListState();
}

class _OrderProformaListState extends State<OrderProformaList> {
  final GlobalKey <ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,

      drawer: CustomDrawer(
          userName: 'userName',
          phoneNumber: 'phoneNumber',
          version: '1.0.12'),
      
      body:
          Stack(
            children:[
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 115,
                      ),

                      OrderProformaListCard(title: 'Mr. Ahemad'),
                      OrderProformaListCard(title: 'Mr. Ahemad'),
                      OrderProformaListCard(title: 'Mr. Ahemad'),
                      OrderProformaListCard(title: 'Mr. Ahemad'),
                      OrderProformaListCard(title: 'Mr. Ahemad'),

                    ],
                  ),
                ),
              ),

              //================================================================
              //CUSTOM APP BAR

              CustomAppBar(child: Row(
                children: [
                  InkWell(
                      onTap: (){
                      _globalKey.currentState?.openDrawer();
                  },
                      child: Icon(Icons.menu_sharp, size: 25,)),
                  SizedBox10w(),
                  Text('Proforma List', style: TextStyle(
                    color: AllColors.blackColor,
                    fontSize: 18,
                    fontFamily: AllFonts.nunitoRegular,
                    fontWeight: FontWeight.w700,
                  ),)
                ],
              ))


            ],
          ),


      


    );
  }
}

