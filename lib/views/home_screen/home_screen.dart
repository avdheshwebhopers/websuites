import 'package:flutter/material.dart';
import '../../utils/responsive/bodies/mobile_body.dart';
import '../../utils/responsive/bodies/tab_body.dart';
import '../../utils/responsive/responsive_layout.dart';



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
