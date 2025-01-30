import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeReportsScreen extends StatefulWidget {
  const EmployeeReportsScreen({super.key});

  @override
  State<EmployeeReportsScreen> createState() => _EmployeeReportsScreenState();
}

class _EmployeeReportsScreenState extends State<EmployeeReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text("employee reports")),

    );
  }
}
