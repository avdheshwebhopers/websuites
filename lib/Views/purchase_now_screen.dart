import 'package:flutter/material.dart';

import '../Resources/components/app_colors.dart';

class PurchaseNowScreen extends StatefulWidget {
  const PurchaseNowScreen({super.key});

  @override
  State<PurchaseNowScreen> createState() => _PurchaseNowScreenState();
}

class _PurchaseNowScreenState extends State<PurchaseNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.textField,// just for highlight the appbar
        title: Text('Purchase Now'),
      ),
      body: Column(
        children: [
          Container(


          ),
        ],
      ),
    );

  }
}
