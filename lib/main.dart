import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Resources/getx_localization/languages.dart';
import 'Utils/Routes/routes.dart';




void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      getPages: AllRoutes.appRoutes(),
    );
  }
}