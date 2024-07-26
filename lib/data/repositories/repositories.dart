import '../../resources/app_urls/app_urls.dart';
import '../models/Response_model/Dashboard_Screen/DB_Count_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_LatestCustomer_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_latestTask_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_lead_by_type_Count_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_leadSource_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/Db_Transactions_ResponseModel.dart';
import '../models/Response_model/LoginResponseModel.dart';
import '../models/Response_model/UserList_Response_Model.dart';
import '../models/Response_model/forgot_password_response_model.dart';
import '../network/network_api_services.dart';


class Repositories{
  final _apiService = NetworkApiServices();

  Future<LoginResponseModel> loginApi(dynamic data) async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.LoginApi, data);
      return response = LoginResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<ForgotPasswordResponseModel> ForgotApi(dynamic data) async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.ForgotApi, data);
      return response = ForgotPasswordResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<Dashboard_Count_Response_Model> dashboardCountApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.getDashboardCountApi,null);
      return response = Dashboard_Count_Response_Model.fromJson(response);
    } catch(e) {
      rethrow;
    }
  }

  Future<Dashboard_Response_Model> dashboardApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashboard, null);
      return response = Dashboard_Response_Model.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<UserList_Response_Model> UserlistApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.userListApi, null);
      return response = UserList_Response_Model.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<Dashboard_Leads_By_Type_Count_Response_Model> DB_LeadsTypeCountApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dash_Leads_By_TypeCount, null);
      return response = Dashboard_Leads_By_Type_Count_Response_Model.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DashboardLeadSourceResponseModel> DB_LeadsSourceApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dash_LeadSource, null);
      return response = DashboardLeadSourceResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  // Future<DashboardLeadsListResponseModelCheck> DB_LeadsListApi() async {
  //   try {
  //     dynamic response =  await _apiService.postApiResponse(Urls.dash_LeadsList, null);
  //     return response = DashboardLeadsListResponseModelCheck.fromJson(response);
  //   } catch(e){
  //     rethrow;
  //   }
  // }

  Future<DB_LatestCustomers_ResponseModel> DB_LatestCustomersApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dash_LatestCustomers, null);
      return response = DB_LatestCustomers_ResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DbLatestTaskResponseModel> DB_LatestTaskApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dash_LatestTask, null);
      return response = DbLatestTaskResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DB_LatestTransaction_ResponseModel> DB_TransactionApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dash_Transactions, null);
      return response = DB_LatestTransaction_ResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }








}




