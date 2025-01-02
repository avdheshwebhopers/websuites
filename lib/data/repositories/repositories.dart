import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:websuites/data/models/requestModels/sales/SalesListRequestModel.dart';
import 'package:websuites/data/models/responseModels/customers/list/customers_list_response_model.dart';
import 'package:websuites/data/models/responseModels/customers/payment_reminder/customer_payment_reminder_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/leadMasters/status/lead_masters_status_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/deleteList/delete_list_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/leadTypes/lead_types_response_model.dart';
import 'package:websuites/data/models/responseModels/order/activities/OrderActivitiesResponseModel.dart';

import '../../resources/appUrls/app_urls.dart';
import '../models/requestModels/project_reminder_setting/ProjectReminderSettingRequestModel.dart';
import '../models/requestModels/report/project_overview/task/ProjectOverViewTaskListRequestModel.dart';
import '../models/responseModels/HRM/attendance/hrm_attendance_response_model.dart';
import '../models/responseModels/campaign/list/campaign_list_response_model.dart';
import '../models/responseModels/campaign/mailLogs/mail_logs_response_model.dart';

import '../models/responseModels/createLeadResponseModel/createLeadResponseModel.dart';
import '../models/responseModels/customers/activationList/customer_activation_list_response_model.dart';
import '../models/responseModels/customers/activities/activities_list/activities_list.dart';
import '../models/responseModels/customers/activities/customer_reports/customer_activity_customer_reports.dart';
import '../models/responseModels/customers/activities/daily_reports/customer_activity_reports.dart';
import '../models/responseModels/customers/activities/no_activities/customer_activity_no_activities.dart';
import '../models/responseModels/customers/activities/status_reports/status_reports.dart';
import '../models/responseModels/customers/companies/customer_companies_response_model.dart';
import '../models/responseModels/customers/list/assign_search/assign_search.dart';
import '../models/responseModels/customers/list/customer_city/customer_city.dart';
import '../models/responseModels/customers/list/customer_detail_view/activities/customer_detail_view_activities_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/assigned_history/customer_detail_view_assigned_history_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/call_type/customer_detail_view_call_type_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/company_list/customer_detail_view_company_list_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/create_company/customer_view_create_company_reesponse_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/credit_debit/customer_detail_credit_debit_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/lead/customer_detail_lead_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/list/customer_list_detail_view_list_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/order/customer_detail_view_order_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/payment_list/customer_detail_view_payment_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/projects/customer_detail_project_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/service_categories/customer_detail_view_service_categories_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/services/customer_detail_view_services_response_model.dart';
import '../models/responseModels/customers/list/customer_detail_view/update_company/customer_detail_update_company_response_model.dart';
import '../models/responseModels/customers/list/customer_type/customer_type.dart';
import '../models/responseModels/customers/list/filter/customer_division.dart';
import '../models/responseModels/customers/list/filter/customer_source.dart';

import '../models/responseModels/customers/master/activation/available_field/activation_available_field_response_model.dart';
import '../models/responseModels/customers/master/activation/customer_activation_response_model.dart';
import '../models/responseModels/customers/master/activation_setting/create/customer_master_activation_setting__create-response_model.dart';
import '../models/responseModels/customers/master/activation_setting/customer_master_activtaion_setting_response_model.dart';


import '../models/responseModels/customers/master/activation_setting/update/customer_master_activation_setting_update_response_model.dart';
import '../models/responseModels/customers/master/activity_purpose/activity_purpose_response_model.dart';
import '../models/responseModels/customers/master/activity_purpose/create/customer_master_activity_purpose_create_response_model.dart';
import '../models/responseModels/customers/master/companyCredentials/list/customer_company_credential_response_model.dart';
import '../models/responseModels/customers/master/companyCredentials/update/customer_master_company_credential_update_response_model.dart';
import '../models/responseModels/customers/master/customer_types/create/customer_type_create_response_model.dart';
import '../models/responseModels/customers/master/customer_types/customer_master_customer_type_response_model.dart';
import '../models/responseModels/customers/master/customer_types/update/customer_type_update_response_model.dart';
import '../models/responseModels/customers/master/fields/create/customer_master_field_create_response_model.dart';
import '../models/responseModels/customers/master/fields/customer_master_fields_response_model.dart';


import '../models/responseModels/customers/orderProducts/customer_order_products_response_model.dart';
import '../models/responseModels/customers/orderProducts/order_product_search/customer_order_product_search_response_model.dart';
import '../models/responseModels/customers/orderProducts/renew/customer_order_product_renew_response_model.dart';
import '../models/responseModels/customers/orderProducts/services/order_product_services.dart';
import '../models/responseModels/customers/orderless_services/create/customer_orderless_services_create_response_model.dart';
import '../models/responseModels/customers/orderless_services/list/customer_orderless_services_response_model.dart';
import '../models/responseModels/customers/orderless_services/quit/customer_orderless_service_response_model.dart';
import '../models/responseModels/customers/orderless_services/renew/customer_orderless_service_renew_response_model.dart';
import '../models/responseModels/customers/service_area/allot_product/customer_allot_product_response_model.dart';
import '../models/responseModels/customers/service_area/city/customer_service_area_city_response_model.dart';
import '../models/responseModels/customers/service_area/pincode/customer_service_area_pinCode_response_model.dart';
import '../models/responseModels/customers/service_area/product/customer_service_area_product_response_model.dart';
import '../models/responseModels/customers/service_area/state/customer_service_area_response_model.dart';
import '../models/responseModels/customers/services/customer_services_response_model.dart';

import '../models/responseModels/customers/settings/column_setting/column_list/customer_setting_column_list_response_model.dart';
import '../models/responseModels/customers/settings/column_setting/save_changes/column_setting_save_changes_response_model.dart';
import '../models/responseModels/customers/settings/field_setting/list/customer_setting_field_list_response_model.dart';
import '../models/responseModels/customers/trash/customer_trash_list_response_model.dart';
import '../models/responseModels/dashboard/db_count_response_model.dart';
import '../models/responseModels/dashboard/db_latest_customer_response_model.dart';
import '../models/responseModels/dashboard/db_lead_by_type_count_response_model.dart';
import '../models/responseModels/dashboard/db_lead_source_response_model.dart';
import '../models/responseModels/dashboard/db_response_model.dart';
import '../models/responseModels/dashboard/db_transactions_response_model.dart';
import '../models/responseModels/forgotPassword/forgot_password_response_model.dart';
import '../models/responseModels/hrm/leave/hrm_leave_response_model.dart';
import '../models/responseModels/inventory/refillStocks/inventory_refill_stocks_response_model.dart';
import '../models/responseModels/inventory/request/inventory_request_response_model.dart';
import '../models/responseModels/inventory/stock/inventory_stock_response_model.dart';
import '../models/responseModels/inventory/transactions/inventory_transactions_response_model.dart';
import '../models/responseModels/inventory/vendors/inventory_vendors_response_model.dart';


import '../models/responseModels/leads/Leadlist/filter/country_code/country_code.dart';
import '../models/responseModels/leads/Leadlist/lead_assign/lead_assign.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/action/lead/lead_detail_action_lead_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/action/service/lead_detail_action_service.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/assign_history/lead_detail_assign_history.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/attachment/lead_detail_attachment_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/call_create/lead_detail_call_create_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/call_type/lead_detail_call_type_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/currency/lead_detail_currency_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/generate_proforma/lead_detail_generate_proforma_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/history/lead_detail_history_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/lead_detail/lead_details_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/meeting_type/lead_detail_meeting_type_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/projection/lead_detail_projection_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/proposal/lead_detail_proposal_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/task_status/lead_detail_task_status_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/task_type/lead_detail_task_type_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_detail_view/update_status/lead_update_status_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_list.dart';
import '../models/responseModels/leads/Leadlist/lead_list_bulk/assign/lead_list_bulk_assign_response_model.dart';
import '../models/responseModels/leads/Leadlist/lead_list_bulk/delete/lead_list_bulk_delete.dart';
import '../models/responseModels/leads/Leadlist/lead_list_bulk/un_assign/lead_list_un_assign_response_model.dart';
import '../models/responseModels/leads/createNewLead/assignedLeadTo/assigned_lead_to_response_model.dart';

import '../models/responseModels/leads/createNewLead/divisions/divisions_response_model.dart';
import '../models/responseModels/leads/createNewLead/import/status/lead_import_status_response_model.dart';
import '../models/responseModels/leads/createNewLead/leadCustomFields/lead_custom_fields.dart';
import '../models/responseModels/leads/createNewLead/pincode/pincode.dart';
import '../models/responseModels/leads/createNewLead/product_category/product_category.dart';
import '../models/responseModels/leads/createNewLead/source/source_response_model.dart';
import '../models/responseModels/leads/leadMasters/source/source_response_model.dart';
import '../models/responseModels/leads/leadMasters/types/types_response_model.dart';
import '../models/responseModels/leads/lead_activity/daily_sales_reports/daily_sales_reports.dart';
import '../models/responseModels/leads/lead_activity/lead_activity_lead_type/lead_type.dart';
import '../models/responseModels/leads/lead_activity/lead_activity_list/lead_activity_list.dart';
import '../models/responseModels/leads/lead_activity/lead_reports/lead_reports.dart';
import '../models/responseModels/leads/lead_activity/no_activities/no_activities.dart';
import '../models/responseModels/leads/lead_activity/team_leads/team_leads.dart';
import '../models/responseModels/leads/setting/custom_field/custom_fields.dart';
import '../models/responseModels/leads/setting/field_setting/field_setting.dart';
import '../models/responseModels/leads/setting/roles/roles.dart';
import '../models/responseModels/leads/setting/setting.dart';
import '../models/responseModels/leads/setting/setting_userprofile/setting_user_profile.dart';
import '../models/responseModels/login/login_response_model.dart';
import '../models/responseModels/master/cityStateAndCountry/cities/master_cities_response_model.dart';
import '../models/responseModels/master/cityStateAndCountry/country/master_country_response_model.dart';
import '../models/responseModels/master/customizeLabel/customize/customize_response_model.dart';
import '../models/responseModels/master/customizeLabel/customize_lead_source/customize_lead_source.dart';
import '../models/responseModels/master/customizeLabel/customize_type/customize_type.dart';
import '../models/responseModels/master/departments/master_departments_response_model.dart';
import '../models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../models/responseModels/master/proposals/master_proposals_resposne_model.dart';
import '../models/responseModels/order/list/company_list/order_company_list_response_model.dart';
import '../models/responseModels/order/list/order_list_response_model.dart';
import '../models/responseModels/order/master/order_master_response_model.dart';
import '../models/responseModels/order/payments/order_payments_response_model.dart';
import '../models/responseModels/order/proformaList/order_proforma_list_response_model.dart';
import '../models/responseModels/products/brand/add_brand/add_product_brand_response_model.dart';
import '../models/responseModels/products/brand/product_brand_response_model.dart';
import '../models/responseModels/products/category/product_category_response_model.dart';
import '../models/responseModels/products/gst_list/product_add_gst_response_model.dart';
import '../models/responseModels/products/gst_list/product_gstList_response_model.dart';
import '../models/responseModels/products/list/add_product/add_product_response_model.dart';
import '../models/responseModels/products/list/products_list_response_model.dart';
import '../models/responseModels/products/list/updat_product/update_product_response_model.dart';
import '../models/responseModels/products/master/master_add_product_response_model.dart';
import '../models/responseModels/products/master/product_master_response_model.dart';
import '../models/responseModels/projects/list/details/ProjectDetailsResponseModels.dart';
import '../models/responseModels/projects/list/projects_list_response_model.dart';
import '../models/responseModels/projects/master/project_master_response_model.dart';
import '../models/responseModels/reports/TaskReportsResponseModels.dart';
import '../models/responseModels/reports/taskdetails/TaskDetailsResponseModel.dart';
import '../models/responseModels/reports/taskdetails/project_overview/project_overview_list/task_report_project_overview_response_model.dart';
import '../models/responseModels/reports/taskdetails/project_overview/remove_attachment/task_report_remove_attachment_response_model.dart';
import '../models/responseModels/reports/taskdetails/project_overview/report_list/task_report_list_response_model.dart';
import '../models/responseModels/reports/taskdetails/project_overview/task/ProjectOverViewTaskListResponseModel.dart';
import '../models/responseModels/reports/taskdetails/start_stop/StartStopResponseModels.dart';
import '../models/responseModels/reports/taskdetails/task_tracker_event/task_tracker_event_response_model.dart';
import '../models/responseModels/reports/taskdetails/task_update/task_update_response_model.dart';
import '../models/responseModels/roles/roles_response_model.dart';
import '../models/responseModels/sales/sales_response_model.dart';
import '../models/responseModels/tasks/list/new_board/task_list_new_board_response_model.dart';
import '../models/responseModels/tasks/list/project_search/task_list_project_search_response_model.dart';
import '../models/responseModels/tasks/list/tasks_list_response_model.dart';


import '../models/responseModels/tasks/master/task_master_list/task_master_response_model.dart';
import '../models/responseModels/userList/user_list_response_model.dart';
import '../models/responseModels/users/users_response_model.dart';
import '../network/network_api_services.dart';


class Repositories {

  final _apiService = NetworkApiServices();

  //============================================================================
  // LOGIN SCREEN API
  Future<LoginResponseModel> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.loginApi, data);
      return response = LoginResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  //FORGOT SCREEN API

  Future<ForgotPasswordResponseModel> forgotApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.forgotApi, data);
      return response = ForgotPasswordResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // HOME SCREEN API

  Future<DashboardCountResponseModel> dashboardCountApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.getDashboardCountApi, null);
      return response = DashboardCountResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DashboardResponseModel> dashboardApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.dashboard, null);
      return response = DashboardResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  Future<UserListResponseModel> userListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.userListApi, null);
      return response = UserListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DashboardLeadsByTypeCountResponseModel> dbLeadsTypeCountApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.dashLeadsByTypeCount, null);
      return
        response = DashboardLeadsByTypeCountResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DashboardLeadSourceResponseModel> dbLeadsSourceApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.dashLeadSource, null);
      return response = DashboardLeadSourceResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<DBLatestCustomersResponseModel> dbLatestCustomersApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.dashLatestCustomers, null);
      return response = DBLatestCustomersResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }

  // Future<DbLatestTaskResponseModel> dbLatestTaskApi() async {
  //   try {
  //     dynamic response =  await _apiService.postApiResponse(AppUrls.dashLatestTask, null);
  //     return response = DbLatestTaskResponseModel.fromJson(response);
  //   } catch(e){
  //     rethrow;
  //   }
  // }

  Future<DBLatestTransactionResponseModel> dbTransactionApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.dashTransactions, null);
      return response = DBLatestTransactionResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // LEAD SCREEN API
  // CREATE NEW LEAD API




  // Future<List<dynamic>> fetchLeadSources() async {
  //   const String url = 'https://webhopers.whsuites.com:3006/v1/api/lead-sources';
  //   try {
  //
  //     final dynamic response = await NetworkApiServices().getApi(url);
  //
  //     if (response is List) {
  //       // If response is a List, return it directly
  //       return response;
  //     } else if (response is Map && response.containsKey('data') && response['data'] is List) {
  //       // If response is a Map containing 'data', return the data list
  //       return response['data'];
  //     } else {
  //       throw Exception('Unexpected response format');
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error fetching lead sources: $e');
  //     }
  //     rethrow; // Propagate the error up the chain
  //   }
  // }


  Future<List<LeadProductCategoryList>> createLeadProductCategory() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.createNewLeadProductCategory);
      print("Create Lead product category ${response}");
      // Decode the response body as a List of dynamic
      List<LeadProductCategoryList> createLeadCategoryList = (response as List)
          .map((leadSourceJson) =>
          LeadProductCategoryList.fromJson(leadSourceJson))
          .toList();
      print("CreateLead data ${createLeadCategoryList[0].id}");
      var data = createLeadCategoryList;
      // print("Data ${data[0].id}");
      // Convert the list of dynamic to a list of LeadSource objects
      print("CreateLead ${createLeadCategoryList}");
      return createLeadCategoryList;
    } catch (e) {
      rethrow;
    }
  }




  Future<List<AssignedLeadToResponseModel>> assignedLeadApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.assignedLeadTo, null);

      if (response is List) {
        List<AssignedLeadToResponseModel> leadList = [];
        for (var item in response) {
          if (item is Map<String, dynamic>) {
            leadList.add(AssignedLeadToResponseModel.fromJson(item));
          }
        }
        return leadList;
      } else {
        throw Exception('Unexpected response type');
      }
    } catch (e) {
      rethrow;
    }
  }





  Future<SourceResponseModel> createNewLeadSourceApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.createNewLeadSource);
      return response = SourceResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }


  Future<List<DivisionsResponseModel>> createNewLeadDivisionsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.createNewLeadDivisions);
      List<DivisionsResponseModel> divisionsList = (response as List)
          .map((division) => DivisionsResponseModel.fromJson(division))
          .toList();
      return divisionsList;
    } catch (e) {
      rethrow;
    }

  }



  //
  // Future<List<CityResponseModel>> createNewLeadCityApi(String query) async {
  //   try {
  //     String url = '${AppUrls.createNewLeadCity}${Uri.encodeComponent(query)}';
  //     dynamic response = await _apiService.getApi(url);
  //     print("City api Response $response");
  //     List<CityResponseModel> citySearchList = (response as List)
  //         .map((json) => CityResponseModel.fromJson(json))
  //         .toList();
  //     return citySearchList;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }



  Future<List<LeadCustomFieldsResponseModel>> createNewLeadCustomFieldsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.createNewLeadCustomFields);
      print("API Response: $response"); // Add this line
      if (response is List) {
        return response.map((item) => LeadCustomFieldsResponseModel.fromJson(item)).toList();
      } else {
        print("Unexpected response type: ${response.runtimeType}");
        return [];
      }
    } catch (e){
      print("API Error: $e"); // Add this line
      rethrow;
    }
  }

  Future<List<PinCodeModelResponseModel>> createLeadPinCode(String query) async {
    try {
      String url = '${AppUrls.createLeadPincode}${Uri.encodeComponent(query)}';
      dynamic response = await _apiService.getApi(url);
      print("Pincode Response $response");
      // Parse the JSON into a list of PinCodeModelResponseModel objects
      List<PinCodeModelResponseModel> pinCodeList = (response as List).map((json) => PinCodeModelResponseModel.fromJson(json)).toList();
      return pinCodeList;
    } catch (e) {
      print("Error fetching pincode data: $e");
      rethrow;
    }
  }

  // Future<dynamic> createNewLeadApi(Map<String, dynamic> data) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse(AppUrls.createNewLead, data);
  //     print("API Response: $response");
  //
  //     if (response is List) {
  //       return response.map((item) => CreateNewModel.fromJson(item)).toList();
  //     } else if (response is Map<String, dynamic>) {
  //       return CreateNewModel.fromJson(response);
  //     } else {
  //       throw Exception("Unexpected response type: ${response.runtimeType}");
  //     }
  //   } catch (e) {
  //     print("API Error: $e");
  //     rethrow;
  //   }
  // }


  // Future<dynamic> createNewLeadApi(Map<String, dynamic> data) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse('https://webhopers.whsuites.com/v1/api/leads', data);
  //     print("API Response: $response");
  //
  //     // ...
  //
  //   } catch (e) {
  //     print("API Error: $e");
  //     rethrow;
  //   }
  // }





  //Create LEAD
  Future<CreateLeadResponseModel> createLead(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.createLead,data);
      print("Create Lead Response $response");
      // Parse the JSON into a list of PinCodeModelResponseModel objects
      return CreateLeadResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  //=================  *****  Lead    **********      =================================================

  //Lead import---------


  Future<List<LeadImportStatusResponseModel>> leadImportStatus() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.leadImportStatus);
      print("Create Import Lead Status  Response $response");
      return LeadImportStatusResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }




  // Leads List

  //
  // Future<List<LeadListModel>> fetchLeadListApi() async {
  //   try {
  //     final dynamic response = await _apiService.getApi(AppUrls.leadList);
  //     debugPrint('API Raw Response: $response'); // For debugging raw response
  //
  //     // Ensure response is a List before mapping
  //     if (response != null && response is List) {
  //       return response
  //           .map((lead) => LeadListModel.fromJson(lead))
  //           .toList();
  //     } else {
  //       debugPrint('API returned null or not a list');
  //       return [];
  //     }
  //   } catch (e, stacktrace) {
  //     debugPrint('Error: $e');
  //     debugPrint('Stacktrace: $stacktrace');
  //     throw Exception('Failed to fetch lead list');
  //   }
  // }
  //============================================================================
  // TRASH LEADS


  //
  // Future<LeadTrashResponseModel > TrashListApi() async {
  //   try {
  //     dynamic response = await _apiService.getApi(AppUrls.deleteList);
  //     return response = LeadTrashResponseModel .fromJson(response);
  //   } catch (e){
  //     rethrow;
  //   }
  // }
  //
  //

















  // Lead  import
  // Future<CreateLeadResponseModel> leadImport(dynamic data) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponseRequest(AppUrls.createLead,data,);
  //     print("Create Lead Response $response");
  //     Parse the JSON into a list of PinCodeModelResponseModel objects
  //     return CreateLeadResponseModel.fromJson(response);
  // } catch (e) {
  //   rethrow;
  // }
  // }

  //Lead import
  // Future<CreateLeadResponseModel> leadImport(Map<String, dynamic> data, File file, String token) async {
  //   try {
  //     // Create a multipart request
  //     var request = http.MultipartRequest('POST', Uri.parse(AppUrls.createLead))
  //     data.forEach((key, value) {
  //       request.fields[key] = value.toString(); // Ensure all values are strings
  //     });
  //
  //     // Add file to the request if provided
  //     if (file.existsSync()) {
  //       request.files.add(await http.MultipartFile.fromPath(
  //         'file', // The key for the file parameter
  //         file.path,
  //         filename: file.path.split('/').last,
  //       ));
  //     }
  //
  //     // Call the postApiResponseRequest method
  //     dynamic response = await _apiService.postApiResponseRequest(AppUrls.createLead, request, token);
  //     if (kDebugMode) {
  //       print("Create Lead Response: $response");
  //     }
  //
  //     // Parse the response into the model
  //     return CreateLeadResponseModel.fromJson(response);
  //   } catch (e) {
  //     print("Error in leadImport: $e");
  //     rethrow; // Propagate the error
  //   }
  // }


  //LEAD LIST

  Future<LeadListResponseModel>leadList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadList,data);
      print("Lead List Response $response");
      return response = LeadListResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }




  //Lead List Column Update

  Future<dynamic>leadListColumnListUpdate(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadListColumnUpdate,data);
      print("Lead  Detail  Column List Update  Response  $response");
      return response;
    }
    catch(e){
      rethrow;
    }
  }


  //Lead List Bulk Delete
  Future<LeadListBulkDeleteResponseModel>leadListBulkDelete(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadListBulkDelete,data);
      print("Lead  Detail Bulk Delete Response  $response");
      return response = LeadListBulkDeleteResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Lead List  Bulk Assign
  Future<LeadListBulkAssignResponseModel>leadListBulkAssign(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadListBulkAssign,data);
      print("Lead  Detail Bulk Assign Response  $response");
      return response = LeadListBulkAssignResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Lead list Bulk un- assign

  Future<LeadListBulkUnAssignResponseModel>leadListBulkUnAssign(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadListBulkUnAssign,data);
      print("Lead  Detail Bulk Un- Assign Response  $response");
      return response = LeadListBulkUnAssignResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }






  //Lead Detail View---------

//List
  Future<LeadDetailResponseModel>leadDetailViewList()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailView);
      print("Lead  Detail View Response $response");
      return response = LeadDetailResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

//Lead Activity Purpose

  //call TYpe--

  Future<List<LeadDetailCallTypeResponseModel>>leadDetailActivityCallType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailCallType);
      print("Lead  Detail View Response  call Type$response");
      return response = LeadDetailCallTypeResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

//Meeting Type
  Future<List<LeadDetailMeetingTypeResponseModel>>leadDetailMeetingType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailMeetingType);
      print("Lead  Detail View Response  Meeting Type$response");
      return response = LeadDetailMeetingTypeResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }


  //task type
  Future<List<LeadDetailTaskTypeResponseModel>>leadDetailTaskType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailTaskType);
      print("Lead  Detail View Response  task Type$response");
      return response = LeadDetailTaskTypeResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Task Status
  Future<List<LeadDetailTaskStatusResponseModel>>leadDetailTaskStatus()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailTaskStatus);
      print("Lead  Detail View Response  task Status $response");
      return response = LeadDetailTaskStatusResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }


  //Proposal
  Future<List<LeadDetailProposalResponseModel>>leadDetailProposal()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailProposal);
      print("Lead  Detail View Response  Proposal Response $response");
      return response = LeadDetailProposalResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Attachment
  Future<List<LeadDetailAttachmentListResponseModel>>leadDetailAttachment()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailAttachment);
      print("Lead  Detail View Response  Attachment Response $response");
      return response = LeadDetailAttachmentListResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }







  // Activity call Create
  Future<LeadDetailActivityCallCreateResponseModel>leadDetailActivityCallCreate(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailActivityCallCreate,data);
      print("Lead  Detail View Response  Activity Call Create $response");
      return response = LeadDetailActivityCallCreateResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //Activity Meeting Create
  Future<LeadDetailActivityCallCreateResponseModel>leadDetailActivityMeetingCreate(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailActivityCallCreate,data);
      print("Lead  Detail View Response  Activity Meeting Create $response");
      return response = LeadDetailActivityCallCreateResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Lead Detail Assign History--

  Future<List<LeadDetailAssignHistoryResponseModel>>leadDetailAssignHistory()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailAssignHistory);
      print("Lead  Detail View Response  Assign History $response");
      return response = LeadDetailAssignHistoryResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }


  //Lead Detail Action----

  //Lead Action
  Future<LeadDetailActionLeadResponseModel>leadDetailActionLead(dynamic data )async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailActionLead,data);
      print("Lead  Detail Action Lead View Response  $response");
      return response = LeadDetailActionLeadResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //Service
  Future<LeadDetailActionServiceResponseModel>leadDetailActionService(dynamic data )async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailActionService,data);
      print("Lead  Detail Action Service View Response  $response");
      return response = LeadDetailActionServiceResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }




  //Lead History
  Future<List<LeadDetailHistoryResponseModel>>leadDetailHistory(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailHistory,data);
      print("Lead  Detail View Response  History $response");
      return response = LeadDetailHistoryResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Lead Detail Projection
  Future<LeadDetailProjectionResponseModel>leadDetailProjection(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailProjection,data);
      print("Lead  Detail  Projection Create Response  $response");
      return response = LeadDetailProjectionResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }
  Future<LeadDetailUpdateStatusResponseModel>leadDetailUpdateStatus(dynamic data)async{
    try{
      dynamic response= await _apiService.patchApi(AppUrls.leadDetailUpdateStatus,data);
      print("Lead  Detail  update Status Response  $response");
      return response = LeadDetailUpdateStatusResponseModel.fromJson(response);
    }
    catch(e){
      print("Lead  Detail Update Status Error$e");
      rethrow;
    }
  }

  //Currency
  Future<List<LeadDetailCurrencyResponseModel>>leadDetailCurrency()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadDetailCurrency);
      print("Lead  Detail  Currency  Response  $response");
      return response = LeadDetailCurrencyResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  // Generate Proforma

  Future<LeadDetailGenerateProformaResponseModel>leadDetailGenerateProforma(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadDetailProforma,data);
      print("Lead  Detail  Generate Proforma Response  $response");
      return response = LeadDetailGenerateProformaResponseModel.fromJson(response);
    }
    catch(e){
      print("Lead Detail Generate performa Response$e");
      rethrow;
    }
  }








  //FILTER CITY
  Future<FilterCityResponseModel>filterCityApi(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.filterCity,data);
      if (kDebugMode) {
        print("Customer city Api Search$response");
      }
      return FilterCityResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }







  //LEAD TYPE
  Future<List<LeadTypesResponseModel>> leadListLeadType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadType);
      print("Lead LeadType Response$response");
      if (response is List) {
        return LeadTypesResponseModel.fromJsonList(response);
      }
      else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }

  //LEAD ASSIGN
  Future<List<LeadAssignResponseModel>> leadListLeadAssign(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadAssign,data);
      print("Lead LeadAssign Response$response");
      return LeadAssignResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  //LEAD lIST PHONE CODE
  Future<LeadListCountryCodeResponseModel> countryCodeApi()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadListPhoneCode);
      print("Lead List Country code$response");
      return LeadListCountryCodeResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //LEAD ACTIVITY---------
  //Activity List

  Future<LeadActivityResponseModel> leadActivityList(dynamic data) async {
    try {
      // Make the API call
      dynamic response = await _apiService.postApiResponse(AppUrls.leadActivityList, data);
      print("Lead activity List Response data: $response");

      // Ensure the response is valid JSON and parse it
      return LeadActivityResponseModel.fromJson(response);
    } catch (e) {
      // Log the error for debugging
      print('Error in leadActivityList: ${e.toString()}');
      rethrow; // Rethrow the error to handle it in the ViewModel
    }
  }



  Future<List<LeadActivityLeadTypeResponseModel>>leadActivityLeadType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadActivityLeadType,);
      print("Lead activity Lead Type Response data$response");
      return response =LeadActivityLeadTypeResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  //NO ACTIVITIES
  Future<LeadNoActivitiesResponseModel>leadNoActivities(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadActivityNoActivities,data);
      print("Lead activity No Activities $response");
      return response =LeadNoActivitiesResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //DAILY SALES REPORTS---------

  Future<DailySalesReportsResponseModel>dailySalesReportList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadActivityDailySaleReports,data);
      print("Lead activity Daily Sales Reports$response");
      return response =DailySalesReportsResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }



  //LEAD REPORTS

  Future<LeadReportsResponseModel>leadActivityLeadReports(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadActivityLeadReports,data);
      print("Lead activity Lead Reports $response");
      return response =LeadReportsResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //TEAM LEADS

  // Future<LeadReportsResponseModel>leadActivityTeamLead(dynamic data)async{
  //   try{
  //     dynamic response= await _apiService.postApiResponse(AppUrls.leadActivityTeamLeads,data);
  //     print("Lead activity Team Leads $response");
  //     return response =LeadReportsResponseModel.fromJson(response);
  //   }
  //   catch(e){
  //     rethrow;
  //   }
  // }

  Future<List<LeadActivityTeamLeadResponseModel>> leadActivityTeamLead(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.leadActivityTeamLeads, data);
      print("Lead activity Team Leads $response");
      return LeadActivityTeamLeadResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


  //LEAD TYPE
  Future<List<LeadTypesResponseModel>> leadListLeadTypes()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadTypes);
      print("Lead LeadType Response$response");
      if (response is List) {
        return LeadTypesResponseModel.fromJsonList(response);
      }
      else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }


  //LEAD ASSIGN
  Future<List<LeadAssignResponseModel>> leadListLeadAssignsearch(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.leadAssignsearch,data);
      print("Lead LeadAssign Response$response");
      return LeadAssignResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  Future<DeleteListResponseModel> trashDeleteListApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.deleteList, data);
      print("Response Trash Delete List: $response"); // Log the response
      return DeleteListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  // setting USER PROFILE
  Future<UserModel> settingUserProfile() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.settingUserProfile);
      print("Setting User Profile Response: $response");
      if (response != null) {
        // Convert the response to a UserModel object
        return UserModel.fromJson(response);
      } else {
        throw Exception('Null response from API');
      }
    } catch (e) {
      print("Error catch$e");
      rethrow;
    }
  }




  //Setting Roles

  Future<List<SettingRolesResponseModel>>settingRoleApi()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.settingRoles);
      print("Setting Roles Response$response");
      if (response is List) {
        return SettingRolesResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }



  // Future<void> deleteTrashLeadsApi(List<String> leadIds) async {
  //   try {
  //     await _apiService.postApi(
  //       AppUrls.deleteList,
  //       data: {'leadIds': leadIds},
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

// Lead type (Hot cold)

  Future<List<LeadTypesResponseModel>> leadTypeApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.leadType);
      return LeadTypesResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

//SOURCE

  Future<List<LeadMasterSourceResponseModel>> leadMasterSource()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadMastersSource);
      print("Lead Master Source Response$response");
      if (response is List) {
        return LeadMasterSourceResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }




  //TYPE
  Future<List<LeadMasterTypeResponseModel>> leadMasterType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadMastersTypes);
      print("Lead Master Type Response$response");
      if (response is List) {
        print("Response is  List Type");
        return LeadMasterTypeResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }




  Future<LeadMastersStatusResponseModel> leadMastersStatusApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.leadMastersStatus);
      return response = LeadMastersStatusResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }

  //============================================================================


  //  ***********    Customer ***********

  // LIST----
  Future<CustomersListResponseModel> customersListApi(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(AppUrls.customersList, data);
      print("Customer List Api $response");
      return response = CustomersListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



  //Customer List Customer Detail View----------

  //CUSTOMER Detail list
  Future<CustomerListDetailViewListResponseModel> customersListCustomerDetailViewList() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerListDetailViewList);
      print("Customer List Detail View List Api $response");
      return response = CustomerListDetailViewListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //Service Categories

  Future<List<CustomerListServiceCategoriesResponseModel>>customerDetailViewServiceCategories() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerListServiceCategories);
      print("Customer List Detail View Service Categories $response");
      return response = CustomerListServiceCategoriesResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


  //Activation Settings
  Future<CustomerMasterActivationSettingResponseModel> customerMasterActivationSetting(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerMasterActivationSetting, data);
      print("Customer Master Activation Setting Api successfully call");
      print("Customer Master Activation Setting response  $response ");
      return response =CustomerMasterActivationSettingResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //Company List

  Future<List<CustomerDetailViewCompanyListResponseModel>>customerDetailViewCompanyList(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(AppUrls.customerDetailViewCompanyList,data);
      print("Customer List Detail View Company List $response");
      return response = CustomerDetailViewCompanyListResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


  //Customer TYPE
  Future<List<CustomerTypeResponseModel>> customerType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.customerType);
      print("Customer TYpe Response$response");
      if (response is List) {
        return CustomerTypeResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }

  //Activities

  Future<CustomerDetailViewActivitiesResponseModel>customerDetailViewActivities(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(AppUrls.customerDetailViewActivities,data);
      print("Customer List Detail View Activities $response");
      return response = CustomerDetailViewActivitiesResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



  //CUSTOMER SOURCE

  Future<List<CustomerSourceResponseModel>>customerSourceApi()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.customerSource);
      print("Customer Source Response$response");
      if (response is List) {
        return  CustomerSourceResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }





  //Assigned History


  Future<List<CustomerDetailViewAssignedHistoryResponseModel>>customerDetailViewAssignHistory() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewServices,);
      print("Customer List Detail View Assign History $response");
      return response = CustomerDetailViewAssignedHistoryResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


  //ASSIGN SEARCH

  Future<List<CustomerAssignResponseModel>>customerAssignSearch(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerListSearchAssign,data);
      print("Customer Assign Search$response");
      if (response is List) {
        return  CustomerAssignResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }




  //Services
  Future<List<CustomerDetailViewServicesResponseModel>>customerDetailViewServices() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewServices,);
      print("Customer List Detail View Services $response");
      return response = CustomerDetailViewServicesResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }





  //Order
  Future<List<CustomerDetailViewOrderResponseModel>>customerDetailViewOrderList() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewOrderList,);
      print("Customer List Detail View Order $response");
      return response = CustomerDetailViewOrderResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }





  //Payments
  Future<List<CustomerDetailViewPaymentResponseModel>>customerDetailViewPaymentList() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewPaymentList,);
      print("Customer List Detail View payments $response");
      return response = CustomerDetailViewPaymentResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

  //Projects
  Future<CustomerDetailProjectResponseModel>customerDetailViewProject() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewProjects,);
      print("Customer List Detail View Project $response");
      return response = CustomerDetailProjectResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // NOTE LEAD ,PAYMENTS,Services Api  Ka Response change karna Backend Side--
  //Lead
  Future<CustomerDetailLeadResponseModel>customerDetailViewLead() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewLead,);
      print("Customer List Detail View Lead $response");
      return response = CustomerDetailLeadResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

//Credit Debit Notes
  Future<CustomerViewCreditDebitResponseModel>customerDetailViewCreditDebit() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewCreditDebit);
      print("Customer List Detail Create- Debit$response");
      return response = CustomerViewCreditDebitResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //Activity Purpose call Type
  Future<List<CustomerDetailCallTypeResponseModel>>customerDetailViewActivityCallType() async {
    try {
      dynamic response =
      await _apiService.getApi(AppUrls.customerDetailViewCallType,);
      print("Customer List Detail View calling Type $response");
      return response = CustomerDetailCallTypeResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

//Create Company

  Future<List<CustomerViewCreateCompanyResponseModel>>customerDetailViewCreateCompany(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(AppUrls.customerDetailCreateCompany,data);
      print("Customer List Detail View Create Company $response");
      return response = CustomerViewCreateCompanyResponseModel.fromJsonList(response);
    } catch (e) {
      print("Create Company Error $e");

      rethrow;
    }
  }

  //Update Company Api

  Future<CustomerDetailUpdateResponseModel>customerDetailViewUpdateCompany(dynamic data) async {
    try {
      dynamic response =
      await _apiService.patchApi(AppUrls.customerDetailUpdateCompany,data);
      print("Customer Detail update Company api$response");
      return response = CustomerDetailUpdateResponseModel.fromJson(response);
    } catch (e) {
      print("Customer Detail Update company $e");
      rethrow;
    }
  }








  //Customer DIVISION

  Future<List<CustomerDivisionResponseModel>>customerDivision()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.customerListDivision);
      print("Customer Division Api Search$response");
      if (response is List) {
        return  CustomerDivisionResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }


  //CUSTOMER ACTIVITY ----------

  //LIST
  Future<CustomerActivityListResponseModel> customerActivityListApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerActivityList, data);
      if (kDebugMode) {
        print("Response Customer Activity List data $response");
      }
      return CustomerActivityListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



  //DAILY REPORTS
  Future<CustomerActivityReportResponseModel>customerActivityReports(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerActivityReports,data);
      if (kDebugMode) {
        print("Response Customer Activity Reports List$response");
      }
      return CustomerActivityReportResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //CUSTOMER NO ACTIVITY

  Future<CustomerActivityNoActivityResponseModel>customerNoActivitiesList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerActivityNoActivities,data);
      if (kDebugMode) {
        print("Response Customer No Activities List$response");
      }
      return CustomerActivityNoActivityResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //CUSTOMER REPORTS
  Future<ActivityCustomerReportResponseModel>customerReports(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerActivityCustomerReports,data);
      if (kDebugMode) {
        print("Response Customer Reports $response");
      }
      return ActivityCustomerReportResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //CUSTOMER STATUS REPORT
  Future<CustomerActivityStatusReportsResponseModel>customerActivityStatusReport(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerActivityStatusReport,data);
      if (kDebugMode) {
        print("Response Customer Status Reports $response");
      }
      return CustomerActivityStatusReportsResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //CUSTOMER---------------------






  // PAYMENT REMINDER------------
  Future<CustomerPaymentsReminderResponseModel>customerPaymentReminderList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customersPaymentReminder,data);
      if (kDebugMode) {
        print("Response Customer payments Reminders $response");
      }
      return CustomerPaymentsReminderResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }





  //CUSTOMER COMPANIES

  Future<CustomerCompaniesResponseModel>customerCompaniesList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerCompanies,data);
      if (kDebugMode) {
        print("Response Customer Companies List $response");
      }
      return CustomerCompaniesResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //SERVICES-----------

  Future<CustomerServiceResponseModel>customerServices(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerServices,data);
      if (kDebugMode) {
        print("Response Customer Services$response");
      }
      return CustomerServiceResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //SERVICES AREA--

  //STATE
  Future<List<CustomerServiceAreaResponseModel>>safeAreaState(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.safeAreaState,data);
      if (kDebugMode) {
        print("Response Customer SafeArea State$response");
      }
      return CustomerServiceAreaResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }


//CITY
  Future<List<CustomerServiceAreaCityResponseModel>>safeAreaCity(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.safeAreaCity,data);
      if (kDebugMode) {
        print("Response Customer SafeArea City$response");
      }
      return CustomerServiceAreaCityResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }


  //PINCODE
  Future<List<CustomerServiceAreaPinCodeResponseModel>>safeAreaPincode(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.safeAreaPincode,data);
      if (kDebugMode) {
        print("Response Customer SafeArea Pincode $response");
      }
      return CustomerServiceAreaPinCodeResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }




  //ORDER PRODUCT


  Future<CustomerOrderProductResponseModel>customerOrderProduct(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customersOrderProducts,data);
      if (kDebugMode) {
        print("Response Customer Order Products ${response}");
      }
      return CustomerOrderProductResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //PRODUCT
  Future<List<CustomerServiceAreaProductResponseModel>>safeAreaProduct(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.safeAreaProduct,data);
      if (kDebugMode) {
        print("Response Customer SafeArea Product $response");
      }
      return CustomerServiceAreaProductResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }






  //SELECT COMPANY
  Future<CustomerCompaniesResponseModel>serviceAreaSelectCompany(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.customerCompanies,data);
      if (kDebugMode) {
        print("Response Customer Safe Area Select Company $response");
      }
      return CustomerCompaniesResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //ALLOT PRODUCT

  Future<CustomerAllotProductResponseModel>serviceAreaAllotProduct(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.safeAreaAllotProduct,data);
      if (kDebugMode) {
        print("Response Customer Safe Area Allot Product $response");
      }
      return CustomerAllotProductResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }



  //ORDER PRODUCT SEARCH
  Future<List<CustomerOrderProductSearchResponseModel>>customerOrderProductSearch()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.orderProductSearch);
      if (kDebugMode) {
        print("Response Customer Order Product Search$response");
      }
      return CustomerOrderProductSearchResponseModel.fromJsonList(response);
    }
    catch(e){
      rethrow;
    }
  }

  // ACTIVATION
  //
  // Future<CustomerActivationResponseModel> customerActivationApi() async {
  //   try {
  //     dynamic response = await _apiService.getApi(AppUrls.customerActivation);
  //     return response = CustomerActivationResponseModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

// Future<List<String>> fetchProductCategories() async {
//   try {
//     // Assuming _apiService.postApiResponse returns a Map<String, dynamic>
//     dynamic response = await _apiService.postApiResponse(AppUrls.customerActivation, null);
//
//     // Check if the response is a map and contains the 'data' field
//     if (response is Map<String, dynamic> && response.containsKey('data')) {
//       // Extract the 'data' field, which should be a List
//       List<dynamic> data = response['data'];
//
//       // Convert the list to List<String>
//       return List<String>.from(data.map((category) => category.toString()));
//     } else {
//       throw Exception('Expected a Map with a "data" field but got ${response.runtimeType}');
//     }
//   } catch (e) {
//     print('Error in fetchProductCategories: $e');
//     rethrow; // Rethrow the error for further handling if needed
//   }
// }


  // FIELD

  Future<CustomerMasterFieldResponseModel> customerFieldApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerField, null);
      return response = CustomerMasterFieldResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  // SETTINGS

  Future<CustomerMasterFieldResponseModel> customerSettingsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerSettings);
      return response = CustomerMasterFieldResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //ORDER PRODUCT SERVICE
  //dev url
  Future<CustomerOrderProductServiceResponseModel>customerOrderProductService(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderProductService, data);
      if (kDebugMode) {
        print("Response Customer Order Product Services$response");
      }
      return CustomerOrderProductServiceResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //Order PRODUCT QUIT

  Future<CustomerOrderProductServiceResponseModel>customerOrderProductQuit(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderProductQuit,data);
      if (kDebugMode) {
        print("Response Customer Order Product Quits$response");
      }
      return CustomerOrderProductServiceResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }





  //ORDER PRODUCT RENEW

  Future<CustomerOrderProductRenewResponseModel>customerOrderProductRenew(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderProductRenew,data);
      if (kDebugMode) {
        print("Response Customer Order Product Renew $response");
      }
      return CustomerOrderProductRenewResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }


  //CUSTOMER  ORDERLESS SERVICES------

  Future<CustomerOrderlessServiceResponseModel>customerOrderlessServicesList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderlessServicesList,data);
      if (kDebugMode) {
        print("API Calling orderless Services ");
        print("Response Customer Orderless Services list $response");
      }
      return CustomerOrderlessServiceResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }



  //ORDERLESS SERVICE CREATE
  Future<CustomerOrderlessServiceCreateResponseModel>customerOrderlessServicesCreate(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderlessServiceCreate,data);
      if (kDebugMode) {
        print("Response Customer Orderless Services Create $response");
      }
      return CustomerOrderlessServiceCreateResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

//ORDERLESS Service QUIT

  Future<CustomerOrderlessServiceQuitResponseModel>customerOrderlessServicesQuit(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderlessServiceQuit,data);
      if (kDebugMode) {
        print("Response Customer Orderless Services Quit $response");
      }
      return CustomerOrderlessServiceQuitResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //ORDERLESS SERVICE RENEW

  Future<CustomerOrderlessServiceRenewResponseModel>customerOrderlessServicesRenew(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.orderlessServiceRenew,data);
      if (kDebugMode) {
        print("Customer Orderless Services  Renew Api hit SuccessFully ");
        print("Response Customer Orderless Services Renew $response");
      }
      return CustomerOrderlessServiceRenewResponseModel.fromJson(response);
    }
    catch(e){
      rethrow;
    }
  }

  //Customer Trash-------
  //List

  Future<CustomerTrashResponseModel> customersTrashApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersTrashList, data);
      print("Customer Trash List Api Response $response ");
      return response = CustomerTrashResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //ACTIVATION LIST
  Future<CustomerActivationListResponseModel> customerActivationList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersActivationList, data);
      print("Customer Activation List  $response ");
      return response = CustomerActivationListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  //Customer Master--------
  //COMPANY CREDENTIAL

  Future<List<CustomerMasterCompanyCredentialResponseModel>> customerMasterCompanyCredential() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerMasterCompanyCredential,);
      print("Customer Activation Response List  $response ");
      return response = CustomerMasterCompanyCredentialResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }




  // COMPANY CREDENTIAL CREATE

  Future<CustomerMasterCompanyCredentialResponseModel> customerMasterCompanyCredentialCreate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerMasterCompanyCredentialCreate, data);
      print("Customer Master Company Credential Response Create  $response ");
      return response =CustomerMasterCompanyCredentialResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // COMPANY CREDENTIAL Update
  Future<CompanyCredentialUpdateResponseModel> customerMasterCompanyCredentialUpdate(dynamic data) async {
    try {
      dynamic response = await _apiService.patchApi(AppUrls.customerMasterCompanyCredentialUpdate,data);
      print("Customer Master Company Credential  Update Response $response ");
      return response =CompanyCredentialUpdateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //CUSTOMER TYPES

  Future<List<CustomerMasterCustomerTypeResponseModel>> customerMasterCustomerType() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerMasterCustomerType,);
      print("Customer Master Customer Type Response  $response ");
      return response = CustomerMasterCustomerTypeResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

  //CUSTOMER TYPES Create
  Future<CustomerTypeCreateResponseModel> customerMasterCustomerTypeCreate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerTypeCreate,data);
      print("Customer Master Customer Type  Created Response  $response ");
      return response = CustomerTypeCreateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //CUSTOMER TYPES UPDATE
  Future<CustomerTypeUpdateResponseModel>customerMasterCustomerTypeUpdate(dynamic data) async {
    try {
      dynamic response = await _apiService.patchApi(AppUrls.customerTypeUpdate,data);
      print("Customer Master Customer Type  updated Response  $response ");
      return response = CustomerTypeUpdateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



//ACTIVITY PURPOSE
  Future<List<CustomerMasterActivityPurposeResponseModel>> customerMasterActivityPurpose() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerMasterActivityPurpose,);
      print("Customer Master Activity Purpose  $response ");
      return response = CustomerMasterActivityPurposeResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


  //Activity PURPOSE Create
  Future<ActivityPurposeCreateResponseModel> customerMasterActivityPurposeCreate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerMasterActivityPurposeCreate,data);
      print("Customer Master Activity Purpose  Created $response ");
      return response = ActivityPurposeCreateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  //ACTIVATION SERVICE-----

  Future<List<CustomerMasterActivationServicesResponseModel>> customerMasterActivationServices() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerMasterActivationServices,);
      print("Customer Master Activity Services$response ");
      return response = CustomerMasterActivationServicesResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

  //Activation AVAILABLE FIELD
  Future<ActivationAvailableFieldResponseModel> customerMasterActivationAvailableField(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls. customerMasterActivationAvailableField,data);
      if (kDebugMode) {
        print("Customer Master Activity Available Fields $response ");
      }
      return response = ActivationAvailableFieldResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //Activation Update
  Future<ActivationAvailableFieldResponseModel> customerMasterActivationUpdate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls. customerMasterActivationUpdate,data);
      if (kDebugMode) {
        print("Customer Master Activation Update  $response ");
      }
      return response = ActivationAvailableFieldResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //ACTIVATION  FIELDS

  Future<CustomerMasterFieldResponseModel> customerMasterActivationField(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerMasterActivationField,data);
      print("Customer Master Activation Fields  $response ");
      return response =CustomerMasterFieldResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  Future<CustomerMasterFieldCreateResponseModel> customerMasterActivationFieldCreate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerMasterActivationFieldCreate,data);
      print("Customer Master Activation Fields CREATE  $response ");
      return response =CustomerMasterFieldCreateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



  //Activation Setting Create
  Future<ActivationSettingCreateResponseModel> customerMasterActivationSettingCreate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerMasterActivationSettingCreate, data);
      print("Customer Master Activation Setting Create api");
      print("Customer Master Activation Setting Create api response  $response ");
      return response =ActivationSettingCreateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //Activation Setting Update
  Future<ActivationSettingUpdateResponseModel> customerMasterActivationSettingUpdate(dynamic data) async {
    try {
      dynamic response = await _apiService.patchApi(AppUrls.customerMasterActivationSettingUpdate, data);
      print("Customer Master Activation Setting Update api");
      print("Customer Master Activation Setting Update api response  $response ");
      return response =ActivationSettingUpdateResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //Customer Setting -----------

  // Column Setting List
  Future<List<CustomerSettingColumnListResponseModel>> customerSettingColumnList() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerSettingColumnList);
      print("Customer Setting Column list $response ");
      return response =CustomerSettingColumnListResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

  //Column Setting Save Changes payloadIssue Pending issue
  //Update pending Response not received from backend issue

  //Column Setting Save Changes
  Future<List<ColumnSettingSaveChangesResponseModel>> customerSettingColumnSaveChanges(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerSettingColumnSaveChange,data);
      print("Customer Setting Column Save Changes $response ");
      return response =ColumnSettingSaveChangesResponseModel.fromJsonList(response);
    } catch (e) {

      rethrow;
    }
  }


  //Column Setting Update
  Future<dynamic> customerSettingColumnUpdate(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customerSettingColumnUpdate,data);
      print("Customer Setting Column Update $response ");
      return response;
    } catch (e) {
      print("Customer Setting Error $e");
      rethrow;
    }
  }

  //Field Setting
  Future<List<CustomerSettingFieldListResponseModel>>customerSettingFieldList() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerSettingFieldList);
      print("Customer Setting field list");
      print("Customer Setting field list $response ");
      return response =CustomerSettingFieldListResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }



  // ORDER



// LIST
  Future<OrderListResponseModel> orderList(Map<String, dynamic> requestData) async {
    try {
      final response = await _apiService.postApiResponse(AppUrls.orderList, requestData);
      return OrderListResponseModel.fromJson(response);
    } catch (e) {
      rethrow; // Propagate the error to the caller
    }
  }

//Activities



  Future<OrderActivitiesResponseModel> orderActivitiesApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderActivities, null);
      return response = OrderActivitiesResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }






  Future< OrderPerformaResponseModel> orderproformaApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.orderProforma);
      return response =  OrderPerformaResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //order Payment----

  Future< OrderPaymentsResponseModel>orderPaymentList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderPayment,data);
      print("Order payment Response $response ");
      return response =OrderPaymentsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  // ORDER MASTER
  Future<List<OrderMasterResponseModel>> orderMasterApi() async {
    try {
      // Fetch response from API
      dynamic response = await _apiService.getApi(AppUrls.orderMaster);

      // Ensure the response is a List and map each item to OrderMasterResponseModel
      if (response is List) {
        return response
            .map((item) => OrderMasterResponseModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Expected response to be a list of order masters.");
      }
    } catch (e) {
      rethrow; // Rethrow the error for further handling
    }
  }



  //Order Company
  Future<OrderCompanyResponseModel>orderCompany(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderCompany,data);
      print("Order List company  Response $response ");
      return response =OrderCompanyResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //Order Detail List
  Future<OrderCompanyResponseModel>orderDetailList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderDetailList,data);
      print("Order Detail List $response ");
      return response =OrderCompanyResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }




  //Generate Receipt Pending

  Future<OrderCompanyResponseModel>orderGenerateReceipt(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderGenerateList,data);
      print("Order Generate Receipt  Response $response ");
      return response =OrderCompanyResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<StartStopResponseModels> taskStartStop(dynamic data) async {
    try {
      // Make the POST request
      final response = await _apiService.postApiResponse(AppUrls.taskStartStop, data);
      print("Start and stop task response: $response");

      // Parse the response
      return StartStopResponseModels.fromJson(response);
    } catch (e) {
      print("Error in taskStartStop: $e");
      rethrow; // Rethrow the error for handling in the ViewModel
    }
  }



  //**************************************************

// HRM

// ATTENDANCE
  Future<HrmAttendanceResponseModel> attendanceApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.hrmAttendance, null);
      return response = HrmAttendanceResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //LEAVE
  Future<HrmLeaveResponseModel> leaveApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.hrmLeave);
      return response = HrmLeaveResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //CAMPAIGN
  // LIST
  Future<CampaignListResponseModel> campaignListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.campaignList, null);
      return response = CampaignListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // MAIL LOGS
  Future<CampaignMailLogsResponseModel> campaignMailLogsApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.campaignMailLogs, null);
      return response = CampaignMailLogsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // WHATSAPP

  Future<CampaignMailLogsResponseModel> whatsappApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.whatsappApi, null);
      return response = CampaignMailLogsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // SALES

  //
  // Future<SalesResponseModel> salesApi(dynamic data) async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse(AppUrls.salesApi, data);
  //     return response = SalesResponseModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }




  Future<SalesResponseModel> salesApi(dynamic data) async {
    try {
      dynamic response =
      await _apiService.postApiResponse(AppUrls.salesApi, data);
      print("Sale Response  $response");
      return response = SalesResponseModel.fromJson(response);
    } catch (e) {
      print("Sale Error $e");
      rethrow;
    }
  }

  //============================================================================
  // ROLES

  Future<List<RolesResponseModel>> rolesApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.rolesApi);
      // Assuming response is a List
      return (response as List).map((role) => RolesResponseModel.fromJson(role)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // ===========================================================================
  // USERS

  Future<UsersResponseModel> usersApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.usersApi, null);
      return response = UsersResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // TASKS
  // LIST

  Future<TasksListResponseModel> tasksListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskListApi, null);
      return response = TasksListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  //
  // // REPORT
  // Future<TasksReportResponseModel> tasksReportApi() async {
  //   try {
  //     dynamic response = await _apiService.postApiResponse(AppUrls.taskListApi, null);
  //     return response = TasksReportResponseModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }




  //**************************************************

// Reports



  Future<TaskReportResponseModel>taskReportList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskReport,data);
      print(" task reports successfully  $response ");
      return response =TaskReportResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

//Task tracker Event START STOP
  Future<TaskTrackerEventResponseModel>taskTrackerEvent(dynamic data ) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskStartStop,data);
      print("Report Task Tracker Event $response ");
      return response =TaskTrackerEventResponseModel.fromJson(response);
    } catch (e) {
      print("Report Task Tracker Event Error$e");
      rethrow;
    }
  }

//Report task Attachment Remove // PENDING

  Future<TaskReportRemoveAttachmentResponseModel>taskReportRemoveAttachment() async {
    try {
      dynamic response = await _apiService.deleteApi(AppUrls.reportTaskRemoveAttachment,);
      print("Report Task Remove Attachment Response $response ");
      return response =TaskReportRemoveAttachmentResponseModel.fromJson(response);
    } catch (e) {
      print("Report Remove Attachment Error$e");
      rethrow;
    }
  }

//Update Task

  Future<ReportTaskUpdateResponseModel>taskUpdate(dynamic data ) async {
    try {
      dynamic response = await _apiService.patchApi(AppUrls.taskUpdate,data);
      print("Task Update Response value $response ");
      return response =ReportTaskUpdateResponseModel.fromJson(response);
    } catch (e) {
      print("Report  Update Error$e");
      rethrow;
    }
  }



  Future<TaskDetailsResponseModel> fetchTaskDetails(String taskId) async {
    try {
      dynamic response = await _apiService.getApi('https://webhopers.whsuites.com/api/tasks/$taskId/');
      print("Raw response type: ${response.runtimeType}");
      print("Raw response: $response");

      // If the response is a list, and you want the first item
      if (response is List) {
        response = response.isNotEmpty ? response[0] : {};
      }

      return TaskDetailsResponseModel.fromJson(response);
    } catch (e) {
      print('Error fetching task details: $e');
      rethrow;
    }
  }


// Project Overview API call

  Future<ProjectOverViewResponseModel> taskProjectOverview(String listId) async {
    try {
      dynamic response = await _apiService.getApi('https://webhopers.whsuites.com/api/projects/$listId');
      print("Fetching data for listId: $listId");

      print("Raw response type: ${response.runtimeType}");
      print("Task Project Overview Response $response");

      // Return the parsed response model
      return ProjectOverViewResponseModel.fromJson(response);
    } catch (e) {
      print("Project Overview Error: $e");
      rethrow; // Rethrow the error to handle it in the view model
    }
  }



  //Report List----

  Future<List<TaskReportListResponseModel>>taskProjectReportList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskProjectReportList,data);
      print("Task Project Report List Overview Response $response ");
      return response =TaskReportListResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }

  //Create Report -------
  Future<List<TaskReportListResponseModel>>taskCreateReportList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskProjectReportList,data);
      print("Task create Project Report Response $response ");
      return response =TaskReportListResponseModel.fromJsonList(response);
    } catch (e) {
      print("Project Create Report list overView Error $e");
      rethrow;
    }
  }


  //-------------// Project overview TaskList


  Future<ProjectOverViewTaskListResponseModel> ProjectOverViewTasksListApi(ProjectOverviewTaskRequestModel requestModel) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskListApi, requestModel.toJson());
      return ProjectOverViewTaskListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


//Task-----------------
  //Task List

  Future<TasksListResponseModel>taskListApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskList,data);
      print("Task List Response   $response");
      return response =TasksListResponseModel.fromJson(response);
    } catch (e) {
      print("Task List Error $e");
      rethrow;
    }
  }


//new Board

  Future<NewBoardResponseModel>taskListNewBoard(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.newBoard,data);
      print("New Board Response   $response");
      return response =NewBoardResponseModel.fromJson(response);
    } catch (e) {
      print("New Board Error $e");
      rethrow;
    }
  }


  //Search Project------
  Future<List<TaskListProjectSearchResponseModel>>projectSearch(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.searchProject,data);
      print("Search project Response   $response");
      return response =TaskListProjectSearchResponseModel.fromJsonList(response);
    } catch (e) {
      print("Search Project Error $e");
      rethrow;
    }
  }


//Master--------------------
//AddTASk----------

  Future<NewBoardResponseModel>addTaskType(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskMasterAddTaskType,data);
      print("Task Master Add task Type  $response");
      return response =NewBoardResponseModel.fromJson(response);
    } catch (e) {
      print("Task Master Add TAsk Error $e");
      rethrow;
    }
  }


  //Task Master Update--------

  Future<dynamic>taskMasterUpdate(dynamic data) async {
    try {
      dynamic response = await _apiService.patchApi(AppUrls.taskMasterUpdate,data);
      print("Task Master Update Response $response");
      return response =NewBoardResponseModel.fromJson(response);
    } catch (e) {
      print("Task Master Update Error $e");
      rethrow;
    }
  }



  // MASTER MAIN
  Future<TaskMasterResponseModel> tasksMasterApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskListApi, null);
      return response = TaskMasterResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // PROJECT
  // LIST

  Future<ProjectListResponseModel>projectList(dynamic data)async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.projectList,data);
      print("Project List  Response $response");
      return response =ProjectListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ProjectsMasterResponseModel> projectMasterApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.projectMaster);
      return response = ProjectsMasterResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  Future<ProjectDetailResponseModel> projectDetailView(String projectId) async {
    try {
      // Construct the URL by appending the projectId
      final String url = "${AppUrls.projectDetailView}$projectId";

      // Make the API call
      dynamic response = await _apiService.getApi(url);
      print("Project Detail view Response: $response");

      // Parse the response into ProjectDetailResponseModel
      return ProjectDetailResponseModel.fromJson(response);
    } catch (e) {
      print("Project Detail view Response Error: $e");
      rethrow; // Rethrow the error to be handled by the caller
    }
  }



  Future<ProjectReminderSetting> projecReminderApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.projectReminder);
      return response = ProjectReminderSetting.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }



  //product List-------------

  Future<ProductsListResponseModel>productList(dynamic data)async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.productList,data);
      print("Product List Response $response");
      return response =ProductsListResponseModel.fromJson(response);
    } catch (e) {
      print("Product List  Response Error$e");
      rethrow;
    }
  }


  // BRAND
  Future<List<ProductBrandResponseModel>>productBrand() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productBrand);
      print("Product Brand Api Response $response");
      return response = ProductBrandResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


  //Add Product---
  Future<AddProductResponseModel>addProduct(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.addProduct,data);
      print("Response add  Product Response  $response");
      return response = AddProductResponseModel.fromJson(response);
    } catch (e) {
      print("Add product Response Error$e");
      rethrow;
    }
  }



  // CATEGORY
  Future<List<ProductCategoryResponseModel>> productCategoryApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productCategory);
      List<ProductCategoryResponseModel> categories = (response as List)
          .map((category) => ProductCategoryResponseModel.fromJson(category))
          .toList();
      return categories;
    } catch (e) {
      rethrow;
    }
  }



  //update Product--------------

  Future<UpdateProductResponseModel>updateProduct(dynamic data) async {
    try {
      dynamic response = await _apiService.patchApi(AppUrls.updateProduct,data);
      print("Update Product Response  $response");
      return response = UpdateProductResponseModel.fromJson(response);
    } catch (e) {
      print("Update product Response Error$e");
      rethrow;
    }
  }



//Add product brand----------
  Future<AddProductBrandResponseModel>addProductBrand(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.addProductBrand,data);
      print("Add Product Brand Response  $response");
      return response = AddProductBrandResponseModel.fromJson(response);
    } catch (e) {
      print("Add Product Brand Response Error$e");
      rethrow;
    }
  }



// gst List--------------
  Future<List<ProductGstListResponseModel>> productGstList() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productGstList);
      print("Product Gst List Response  $response");
      return response = ProductGstListResponseModel.fromJsonList(response);
    } catch (e) {
      rethrow;
    }
  }


//add gst-------

  Future<AddGstResponseModel>addGstApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.productGstList,data);
      print("Product add Gst  Response  $response");
      return response = AddGstResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }


  //master-----
  //add product----------
  Future<MasterAddProductResponseModel>masterAddProduct(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.masterAddProduct,data);
      print("Master Add Product  Response  $response");
      return response =MasterAddProductResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //Product Master List-----
  Future<ProjectsMasterResponseModel>masterProductList(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.masterProductList,data);
      print("Master Product List Response  $response");
      return response =ProjectsMasterResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
  // VivekHopers@123456


  //============================================================================
  // INVENTORY
  // STOCK
  Future<InventoryStocksResponseModel> inventoryStockApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.inventoryStock);
      return response = InventoryStocksResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // REPEAT
  Future<InventoryRequestResponseModel> inventoryRequestApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.inventoryRequest);
      return response = InventoryRequestResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // TRANSACTIONS
  Future<InventoryTransactionsResponseModel> inventoryTransactionsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.inventoryTransactions);
      return response = InventoryTransactionsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // VENDORS
  Future<InventoryVendorsResponseModel> inventoryVendorsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.inventoryVendors);
      return response = InventoryVendorsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //REFILL STOCKS
  Future<InventoryRefillStocksResponseModel> inventoryRefillStocksApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.inventoryRefillStocks);
      return response = InventoryRefillStocksResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================


//Master
  //division
  Future<List<MasterDivisionsResponseModel>> masterDivision() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.masterDivisions);
      print("Response Master Api: $response");

      if (response is List) {
        return MasterDivisionsResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    } catch (e) {
      print("Error in masterDivision: $e");
      rethrow;
    }
  }

  //Departments
  Future<List<MasterDepartmentsResponseModel>> masterDepartment() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.masterDepartments);
      print("Response Master Department$response");
      if (response is List) {
        return MasterDepartmentsResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    } catch (e) {
      rethrow;
    }
  }






//Proposal
  Future<List<MasterProposalsResponseModel>>masterProposal()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.masterProposals);
      print("Response master Proposals$response");
      if(response is List){
        return MasterProposalsResponseModel.fromJsonList(response);
      }
      else{
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }




  //============================================================================
  // CITIES, STATES AND COUNTRY
  // CITIES

  Future<MasterCitiesResponseModel> masterCitiesApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.masterCities, null);
      return response = MasterCitiesResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // COUNTRY
  Future<MasterCountryResponseModel> masterCountryApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.masterCountry, null);
      return response = MasterCountryResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }





  //CUSTOMIZE LIST

  Future<List<MasterCustomizeResponseModel>>masterCustomizeList(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.masterCustomizeList,data);
      print("Response master Proposals$response");
      if(response is List){
        return MasterCustomizeResponseModel.fromJsonList(response);
      }
      else{
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }



//CUSTOMIZE TYPE
  Future<List<MasterCustomizeTypeResponseModel>>masterCustomizeType()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.masterCustomizeType);
      print("Response CustomizeType$response");
      if(response is List){
        return MasterCustomizeTypeResponseModel.fromJsonList(response);
      }
      else{
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }

//CUSTOMIZE LEAD SOURCE
  Future<List<CustomizeLeadSourceResponseModel>>masterCustomizeLeadSource(dynamic data)async{
    try{
      dynamic response= await _apiService.postApiResponse(AppUrls.masterCustomizeLeadSource,data);
      print("Response master Customize Lead Source$response");
      if(response is List){
        return CustomizeLeadSourceResponseModel.fromJsonList(response);
      }
      else{
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }








  //LEAD SETTING

  Future<List<LeadSettingResponseModel>> leadSettingList()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.leadSetting);
      print("Lead SettingList Response$response");
      if (response is List) {
        return LeadSettingResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }



  //Field Setting
  Future<List<FieldSettingResponseModel>> fieldSetting()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.fieldSetting);
      print("Field SettingList Response$response");
      if (response is List) {
        return FieldSettingResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }







  //Setting Custom Field
  Future<List<SettingCustomFieldsResponseModel>> settingCustomFields()async{
    try{
      dynamic response= await _apiService.getApi(AppUrls.settingCustomFields);
      print("Setting Custom Field Response$response");
      if (response is List) {
        return SettingCustomFieldsResponseModel.fromJsonList(response);
      } else {
        throw Exception("Expected a list from the API but got something else.");
      }
    }
    catch(e){
      rethrow;
    }
  }














}