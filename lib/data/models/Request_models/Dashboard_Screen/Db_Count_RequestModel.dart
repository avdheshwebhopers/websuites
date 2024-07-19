
import '../../Response_model/Dashboard_Screen/DB_Count_ResponseModel.dart';

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

  // Factory constructor to create a User from a JSON map
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

  // Method to convert a User instance to a JSON map
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