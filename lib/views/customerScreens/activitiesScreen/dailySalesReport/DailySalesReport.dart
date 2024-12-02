import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../leadScreens/leadActivities/dailySalesReport/dailyreportcard/SalesPersonCard.dart';
import '../../../../viewModels/leadScreens/lead_activity/daily_sales_reports/daily_sales_reports.dart';

class ActivityDailySalesReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DailySalesReportsViewModel viewModel = Get.put(DailySalesReportsViewModel());

    if (viewModel.salesPeople.isEmpty) {
      viewModel.dailySalesReports();
    }

    return Obx(() {
      if (viewModel.loading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return RefreshIndicator(
        onRefresh: () async {
          viewModel.salesPeople.clear();
          await viewModel.dailySalesReports();
        },
        child: ListView.builder(
          itemCount: viewModel.salesPeople.length,
          itemBuilder: (context, index) {
            return SalesPersonCard(salesPerson: viewModel.salesPeople[index]);
          },
        ),
      );
    });
  }
}