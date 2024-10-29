import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/resources/getxLocalization/languages.dart';

import 'Utils/Routes/routes.dart';
import 'Utils/Routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WHCrm',
      translations: Languages(),
      locale: const Locale('en_US'),
      fallbackLocale: const Locale('en_US'),
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: RoutesName.home_screen, // Set your initial route
      // getPages: AllRoutes.appRoutes(),
      initialRoute: RoutesName.splash_screen,
      getPages: AllRoutes.appRoutes(),
    );
  }
}



