import 'package:flutter/material.dart';
import 'package:websuites/Data/models/Response_model/login.dart';
  
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/components/widgets/app_bar/custom_appBar.dart';
import '../../../utils/components/widgets/drawer/custom_drawer.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_10w.dart';
import '../../../utils/components/widgets/sized_boxes/sizedBox_5w.dart';
import '../../../view_models/save_token/save_token.dart';
import 'customer_order_products_screen_card/customer_order_product_screen_card.dart';

class CustomerOrderProductsScreen extends StatefulWidget {
  const CustomerOrderProductsScreen({super.key});

  @override
  State<CustomerOrderProductsScreen> createState() => _CustomerOrderProductsScreenState();
}

class _CustomerOrderProductsScreenState extends State<CustomerOrderProductsScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  SaveUserData userPreferences = SaveUserData();

  String userName = '';
  String userEmail = '';

  @override
  void initState() {
    FetchUserData();
    super.initState();
  }


  Future<void> FetchUserData () async {
    try{
      LoginResponseModel response = await userPreferences.getUser();
      String? first_name = response.user!.first_name;
      String? email = response.user!.email;

      setState(() {
        userName = first_name!;
        userEmail = email!;
      });
    }catch (e){
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
          version: '1.10.12'),

      body:
          Stack(
            children: [
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 15,right: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 120,),
                
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                      CustomerOrderProductScreenCard(title: 'LifeCare Neuro'),
                    ],
                  ),
                ),
              ),

              //================================================================
              //CUSTOM APP BAR
              
              CustomAppBar(child:
              Row(
                children: [
                  InkWell(
                      onTap:(){
                        _globalKey.currentState?.openDrawer();
                      },
                      child: const Icon(Icons.menu, size: 25,)),
                  SizedBox10w(),
                  Text('Order Products', style: TextStyle(
                      color: AllColors.blackColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                    )),

                  const Spacer(),

                  Icon(Icons.filter_list_outlined, size: 15, color: AllColors.lightGrey,),
                  SizedBox5w(),
                  Text('Filter', style: TextStyle(color: AllColors.lightGrey,
                    
                  fontWeight: FontWeight.w400,
                  fontSize: 15),)
                ],
              )),

            ],
          )




    );
  }
}
