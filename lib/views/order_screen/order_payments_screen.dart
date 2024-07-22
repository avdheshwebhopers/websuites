import 'package:flutter/material.dart';

import '../../Utils/components/app_colors.dart';

class OrderPaymentsScreen extends StatefulWidget {
  const OrderPaymentsScreen({super.key});

  @override
  State<OrderPaymentsScreen> createState() => _OrderPaymentsScreenState();
}

class _OrderPaymentsScreenState extends State<OrderPaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.whiteColor,
    );
  }
}
