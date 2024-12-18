import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websuites/resources/getxLocalization/languages.dart';
import 'package:websuites/views/homeScreen/home_screen.dart';

import 'Utils/Routes/routes.dart';
import 'Utils/Routes/routes_name.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WHCrm',
      translations: Languages(),
      locale: const Locale('en', 'US'), // Corrected locale
      fallbackLocale: const Locale('en', 'US'), // Corrected fallback locale
      theme: ThemeData(
        fontFamily: 'Nunito',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splash_screen,
      getPages: AllRoutes.appRoutes(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
