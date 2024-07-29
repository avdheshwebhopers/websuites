import '../../resources/app_urls/app_urls.dart';
import '../models/Response_model/Dashboard_Screen/DB_Count_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_LatestCustomer_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_latestTask_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_lead_by_type_Count_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_leadSource_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/DB_ResponseModel.dart';
import '../models/Response_model/Dashboard_Screen/Db_Transactions_ResponseModel.dart';
import '../models/Response_model/login.dart';
import '../models/Response_model/forgot_password.dart';
import '../models/Response_model/user_list.dart';
import '../network/network_api_services.dart';


class Repositories{

  final _apiService = NetworkApiServices();

  Future<LoginResponseModel> loginApi(dynamic data) async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.loginApi, data);
      return response = LoginResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<ForgotPasswordResponseModel> forgotApi(dynamic data) async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.forgotApi, data);
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

  Future<UserListResponseModel> userListApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.userListApi, null);
      return response = UserListResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<Dashboard_Leads_By_Type_Count_Response_Model> dbLeadsTypeCountApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashLeadsByTypeCount, null);
      return response = Dashboard_Leads_By_Type_Count_Response_Model.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DashboardLeadSourceResponseModel> dbLeadsSourceApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashLeadSource, null);
      return response = DashboardLeadSourceResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DB_LatestCustomers_ResponseModel> dbLatestCustomersApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashLatestCustomers, null);
      return response = DB_LatestCustomers_ResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DbLatestTaskResponseModel> dbLatestTaskApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashLatestTask, null);
      return response = DbLatestTaskResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

  Future<DB_LatestTransaction_ResponseModel> dbTransactionApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashTransactions, null);
      return response = DB_LatestTransaction_ResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

}




