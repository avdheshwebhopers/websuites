import 'package:flutter/material.dart';
import '../../utils/responsive/bodies/mobile_body.dart';
import '../../utils/responsive/bodies/tab_body.dart';
import '../../utils/responsive/responsive_layout.dart';



class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) :
        super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(),
        tabBody: MyTabBody(),
      ),
    );
  }
}
