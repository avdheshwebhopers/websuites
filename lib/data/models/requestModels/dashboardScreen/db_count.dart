import '../../responseModels/dashboard/db_count_response_model.dart';

class DashboardCountRequestedModel {
  int? customers;
  int? leads;
  int? orders;
  Revenue? revenue;
  int? unassignedLeads;
  int? repeatedLeads;

  DashboardCountRequestedModel({
    this.customers,
    this.leads,
    this.orders,
    this.revenue,
    this.unassignedLeads,
    this.repeatedLeads
  });

  factory DashboardCountRequestedModel.fromJson(Map<String, dynamic> json) {
    return DashboardCountRequestedModel(
      customers: json['customers'],
      leads: json['leads'],
      orders: json['orders'],
      revenue: json['revenue'],
      unassignedLeads: json['unassignedLeads'],
      repeatedLeads: json['repeatedLeads'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customers': customers,
      'leads': leads,
      'orders': orders,
      'revenue': revenue,
      'unassignedLeads': unassignedLeads,
      'repeatedLeads': repeatedLeads
    };
  }
}