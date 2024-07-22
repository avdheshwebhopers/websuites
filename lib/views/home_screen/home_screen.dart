import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Responsive/Bodies/mobile_body.dart';
import '../Responsive/Bodies/tab_body.dart';
import '../Responsive/responsive_layout.dart';


class HomeScreen extends StatefulWidget {

  // final dynamic name;
  HomeScreen({Key? key}) :
        // name = Get.arguments,
        super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context){
    // print(widget.name);
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(// name: widget.name,
        ),
        tabBody: MyTabBody(),
      ),
    );
  }

}
