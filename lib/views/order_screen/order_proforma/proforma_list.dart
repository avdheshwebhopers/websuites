import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/LoginResponseModel.dart';
import 'package:websuites/view_models/save_token/save_token.dart';
import 'package:websuites/views/order_screen/order_proforma/widgets/order_proforma_list_card/order_proforma_list_card.dart';
import '../../../Resources/all_fonts/all_fonts.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_10w.dart';


class OrderProformaList extends StatefulWidget {
  const OrderProformaList({super.key});

  @override
  State<OrderProformaList> createState() => _OrderProformaListState();
}

class _OrderProformaListState extends State<OrderProformaList> {
  final GlobalKey <ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreference = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }

  Future<void> FetchUserData ()async{
    try{
      LoginResponseModel response = await userPreference.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });
    }catch(e){
      print('Error fetching userData: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      backgroundColor: AllColors.whiteColor,

      drawer: CustomDrawer(
          userName: '$userName',
          phoneNumber: '$userEmail',
          version: '1.0.12'
      ),

      body:
          Stack(
            children:[
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 105,
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

              CustomAppBar(
                  child: Row(
                children: [
                  InkWell(
                      onTap: (){
                      _globalKey.currentState?.openDrawer();
                  },
                      child: Icon(Icons.menu_sharp, size: 25,)),
                  SizedBox10w(),
                  Text('Proforma List', style: TextStyle(
                    color: AllColors.blackColor,
                    fontSize: 17,
                    fontFamily: AllFonts.nunitoRegular,
                    fontWeight: FontWeight.w700,
                  ),)
                ],
              )
              )
            ],
          ),
    );
  }
}

