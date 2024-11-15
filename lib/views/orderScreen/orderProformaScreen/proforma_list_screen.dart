import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:websuites/views/orderScreen/orderProformaScreen/widgets/orderProformaListCard/order_proforma_list_card.dart';
import '../../../viewModels/saveToken/save_token.dart';
import '../../../data/models/controller.dart';
import '../../../data/models/responseModels/login/login_response_model.dart';
import '../../../utils/appColors/app_colors.dart';
import '../../../utils/components/widgets/appBar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sizedBoxes/sizedBox_10w.dart';
import '../../../utils/responsive/bodies/Responsive.dart';



class OrderProformaList extends StatefulWidget {
  const OrderProformaList({super.key});

  @override
  State<OrderProformaList> createState() => _OrderProformaListState();
}

class _OrderProformaListState extends State<OrderProformaList> {
final ScreenController _screenController = Get.put(ScreenController());
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

      // drawer: CustomDrawer(
      //     userName: '$userName',
      //     phoneNumber: '$userEmail',
      //     version: '1.0.12',
      //   onTap: (index) {
      //     _screenController.updateIndex(index);
      //     if (ResponsiveUtils.isMobile(context)) {
      //       _globalKey.currentState?.closeDrawer();
      //     }
      //   },
      //
      // ),

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

