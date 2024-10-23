import 'package:flutter/foundation.dart';
import 'package:websuites/data/models/responseModels/customers/list/customers_list_response_model.dart';
import 'package:websuites/data/models/responseModels/customers/payment_reminder/customer_payment_reminder_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/leadMasters/status/lead_masters_status_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/deleteList/delete_list_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/leadTypes/lead_types_response_model.dart';

import '../../resources/appUrls/app_urls.dart';
import '../models/responseModels/HRM/attendance/hrm_attendance_response_model.dart';
import '../models/responseModels/campaign/list/campaign_list_response_model.dart';
import '../models/responseModels/campaign/mailLogs/mail_logs_response_model.dart';
import '../models/responseModels/customers/activationList/customer_activation_list_response_model.dart';
import '../models/responseModels/customers/master/activation/customer_activation_response_model.dart';
import '../models/responseModels/customers/master/activity_purpose/activity_purpose_response_model.dart';
import '../models/responseModels/customers/master/companyCredentials/customer_company_credential_response_model.dart';
import '../models/responseModels/customers/master/fields/customer_master_fields_response_model.dart';
import '../models/responseModels/customers/master/types/customer_master_type_response_model.dart';
import '../models/responseModels/customers/orderProducts/customer_order_products_response_model.dart';
import '../models/responseModels/customers/services/customer_services_response_model.dart';
import '../models/responseModels/customers/trash/customer_trash_response_model.dart';
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
import '../models/responseModels/leads/createNewLead/assignedLeadTo/assigned_lead_to_response_model.dart';
import '../models/responseModels/leads/createNewLead/createNewModelPost/CreateNewModelbutton.dart';
import '../models/responseModels/leads/createNewLead/divisions/divisions_response_model.dart';
import '../models/responseModels/leads/createNewLead/leadCustomFields/lead_custom_fields.dart';
import '../models/responseModels/leads/createNewLead/pincode/pincode.dart';
import '../models/responseModels/leads/createNewLead/productCategoryList.dart';
import '../models/responseModels/leads/createNewLead/source/source_response_model.dart';
import '../models/responseModels/leads/leadMasters/source/source_response_model.dart';
import '../models/responseModels/leads/leadMasters/types/types_response_model.dart';
import '../models/responseModels/leads/setting/custom_field/custom_fields.dart';
import '../models/responseModels/leads/setting/field_setting/field_setting.dart';
import '../models/responseModels/leads/setting/setting.dart';
import '../models/responseModels/login/login_response_model.dart';
import '../models/responseModels/master/cityStateAndCountry/cities/master_cities_response_model.dart';
import '../models/responseModels/master/cityStateAndCountry/country/master_country_response_model.dart';
import '../models/responseModels/master/customizeLabel/customize/customize_response_model.dart';
import '../models/responseModels/master/customizeLabel/customize_lead_source/customize_lead_source.dart';
import '../models/responseModels/master/customizeLabel/customize_type/customize_type.dart';
import '../models/responseModels/master/departments/master_departments_response_model.dart';
import '../models/responseModels/master/divisions/master_divisions_response_model.dart';
import '../models/responseModels/master/proposals/master_proposals_resposne_model.dart';
import '../models/responseModels/order/list/order_list_response_model.dart';
import '../models/responseModels/order/master/order_master_response_model.dart';
import '../models/responseModels/order/payments/order_payments_response_model.dart';
import '../models/responseModels/order/proformaList/order_proforma_list_response_model.dart';
import '../models/responseModels/products/brand/product_brand_response_model.dart';
import '../models/responseModels/products/category/product_category_response_model.dart';
import '../models/responseModels/products/gstList/product_gstList_response_model.dart';
import '../models/responseModels/products/list/products_list_response_model.dart';
import '../models/responseModels/products/master/product_master_response_model.dart';
import '../models/responseModels/projects/list/projects_list_response_model.dart';
import '../models/responseModels/projects/master/project_master_response_model.dart';
import '../models/responseModels/roles/roles_response_model.dart';
import '../models/responseModels/sales/sales_response_model.dart';
import '../models/responseModels/tasks/list/tasks_list_response_model.dart';
import '../models/responseModels/tasks/master/task_master_response_model.dart';
import '../models/responseModels/tasks/report/task_report_response_model.dart';
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


  Future<dynamic> createNewLeadApi(Map<String, dynamic> data) async {
    try {
      dynamic response = await _apiService.postApiResponse('https://webhopers.whsuites.com/v1/api/leads', data);
      print("API Response: $response");

      // ...

    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }






  //============================================================================
  // TRASH LEADS

  Future<DeleteListResponseModel> deleteListApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.deleteList);
      return response = DeleteListResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }

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
// CUSTOMERS
// LIST
  Future<CustomersListResponseModel> customersListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersList, null);
      return response = CustomersListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //ACTIVITIES

  Future<CustomersListResponseModel> customersActivitiesApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersActivities, null);
      return response = CustomersListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // PAYMENT REMINDER

  Future<CustomersPaymentReminderResponseModel> customersPaymentReminderApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersPaymentReminder, null);
      return response = CustomersPaymentReminderResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // COMPANIES

  Future<CustomersPaymentReminderResponseModel> customersCompaniesApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersPaymentReminder, null);
      return response = CustomersPaymentReminderResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // SERVICES

  Future<CustomerServicesResponseModel> customersServicesApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersServices, null);
      return response = CustomerServicesResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // ORDER PRODUCTS

  Future<CustomerOrderProductsResponseModel> customersOrderProductsApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersOrderProducts, null);
      return response = CustomerOrderProductsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // CUSTOMER TRASH

  Future<CustomerTrashResponseModel> customersTrashApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersTrashLead, null);
      return response = CustomerTrashResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // ACTIVATION LIST

  Future<CustomerActivationListResponseModel> customersActivationListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersActivationList, null);
      return response = CustomerActivationListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // CUSTOMER (MASTER)

// COMPANY CREDENTIAL
  Future<CustomerCompanyCredentialResponseModel> companyCredentialsApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.customersCompanyCredential, null);
      return response = CustomerCompanyCredentialResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // TYPES
  Future<CustomerMasterTypeResponseModel> customerMasterTypeApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customersMasterTypes);
      return response = CustomerMasterTypeResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // ACTIVITY PURPOSE
  Future<ActivityPurposeResponseModel> customerActivityPurposeApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerActivityPurpose);
      return response = ActivityPurposeResponseModel.fromJson(response);
    } catch (e) {
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

  // ORDER
// LIST

  Future<OrderListResponseModel> orderListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderList, null);
      return response = OrderListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // PROFORMA LIST

  Future<OrderProformaListResponseModel> orderProformaApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.orderProforma);
      return response = OrderProformaListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // PAYMENTS

  Future<OrderPaymentsResponseModel> orderPaymentsApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.orderPayments, null);
      return response = OrderPaymentsResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // ORDER MASTER

  Future<OrderMasterResponseModel> orderMasterApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.orderMaster);
      return response = OrderMasterResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

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

  Future<SalesResponseModel> salesApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.salesApi, null);
      return response = SalesResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  //============================================================================
  // ROLES

  Future<RolesResponseModel> rolesApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.rolesApi);
      return response = RolesResponseModel.fromJson(response);
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

  // REPORT
  Future<TasksReportResponseModel> tasksReportApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.taskListApi, null);
      return response = TasksReportResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // MASTER
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
  Future<ProjectsListResponseModel> projectListApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.projectList, null);
      return response = ProjectsListResponseModel.fromJson(response);
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

  // PRODUCT
  // LIST
  Future<ProductsListResponseModel> productListApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productList);
      return response = ProductsListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // CATEGORY
  Future<ProductCategoryResponseModel> productCategoryApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productCategory);
      return response = ProductCategoryResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // BRAND
  Future<ProductBrandResponseModel> productBrandApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productCategory);
      return response = ProductBrandResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // GST LIST
  Future<ProductGstListResponseModel> productGstApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.productGstList);
      return response = ProductGstListResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  // MASTER
  Future<ProductMasterResponseModel> productMasterApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(AppUrls.productMaster, null);
      return response = ProductMasterResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

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