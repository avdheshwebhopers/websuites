import 'package:websuites/data/models/responseModels/customers/list/customers_list_response_model.dart';
import 'package:websuites/data/models/responseModels/customers/payment_reminder/customer_payment_reminder_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/leadMasters/status/lead_masters_status_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/deleteList/delete_list_response_model.dart';
import 'package:websuites/data/models/responseModels/leads/trashLeads/leadTypes/lead_types_response_model.dart';

import '../../resources/appUrls/app_urls.dart';
import '../models/responseModels/customers/activationList/customer_activation_list_response_model.dart';
import '../models/responseModels/customers/master/activation/customer_activation_response_model.dart';
import '../models/responseModels/customers/master/activity_purpose/activity_purpose_response_model.dart';
import '../models/responseModels/customers/master/companyCredentials/customer_company_credential_response_model.dart';
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
import '../models/responseModels/leads/createNewLead/assignedLeadTo/assigned_lead_to_response_model.dart';
import '../models/responseModels/leads/createNewLead/divisions/divisions_response_model.dart';
import '../models/responseModels/leads/createNewLead/leadCustomFields/lead_custom_fields.dart';
import '../models/responseModels/leads/createNewLead/source/source_response_model.dart';
import '../models/responseModels/leads/leadMasters/source/source_response_model.dart';
import '../models/responseModels/leads/leadMasters/types/types_response_model.dart';
import '../models/responseModels/login/login_response_model.dart';
import '../models/responseModels/userList/user_list_response_model.dart';
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

  Future<AssignedLeadToResponseModel> assignedLeadApi() async {
    try {
      dynamic response = await _apiService.postApiResponse(
          AppUrls.assignedLeadTo, null);
      return response = AssignedLeadToResponseModel.fromJson(response);
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

  Future<DivisionsResponseModel> createNewLeadDivisionsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.createNewLeadDivisions);
      return response = DivisionsResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }

  Future<LeadCustomFieldsResponseModel> createNewLeadCustomFieldsApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.createNewLeadCustomFields);
      return response = LeadCustomFieldsResponseModel.fromJson(response);
    } catch (e){
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

  Future<LeadTypesResponseModel> leadTypeApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.leadType);
      return response = LeadTypesResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }

  Future<LeadMasterTypesResponseModel> leadMastersTypesApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.leadMastersTypes);
      return response = LeadMasterTypesResponseModel.fromJson(response);
    } catch (e){
      rethrow;
    }
  }

  // Future<LeadMasterSourceResponseModel> leadMastersSourceApi() async {
  //   try {
  //     dynamic response = await _apiService.getApi(AppUrls.leadMastersSource);
  //     return response = LeadMasterSourceResponseModel.fromJson(response);
  //   } catch (e){
  //     rethrow;
  //   }
  // }

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

  Future<CustomerActivationResponseModel> customerActivationApi() async {
    try {
      dynamic response = await _apiService.getApi(AppUrls.customerActivation);
      return response = CustomerActivationResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }










































}