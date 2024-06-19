import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Responsive/Bodies/mobile_body.dart';
import '../Responsive/Bodies/tab_body.dart';
import '../Responsive/responsive_layout.dart';


class MainPage extends StatefulWidget {

  final dynamic name;

  MainPage({Key? key}) :
        name = Get.arguments,
        super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context){
    print(widget.name);
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(
          name: widget.name,
          ),



        tabBody: MyTabBody(),
      ),
    );
  }

}
