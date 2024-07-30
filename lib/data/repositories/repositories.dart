
import '../../resources/appUrls/app_urls.dart';
import '../models/responseModels/dashboard_screen/db_count_response_model.dart';
import '../models/responseModels/dashboard_screen/db_latest_customer_response_model.dart';
import '../models/responseModels/dashboard_screen/db_lead_by_type_count_response_model.dart';
import '../models/responseModels/dashboard_screen/db_lead_source_response_model.dart';
import '../models/responseModels/dashboard_screen/db_response_model.dart';
import '../models/responseModels/dashboard_screen/db_transactions_response_model.dart';
import '../models/responseModels/forgot_password.dart';
import '../models/responseModels/login.dart';
import '../models/responseModels/user_list.dart';
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

  Future<DashboardCountResponseModel> dashboardCountApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.getDashboardCountApi,null);
      return response = DashboardCountResponseModel.fromJson(response);
    } catch(e) {
      rethrow;
    }
  }

  Future<DashboardResponseModel> dashboardApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashboard, null);
      return response = DashboardResponseModel.fromJson(response);
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

  Future<DashboardLeadsByTypeCountResponseModel> dbLeadsTypeCountApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashLeadsByTypeCount, null);
      return response = DashboardLeadsByTypeCountResponseModel.fromJson(response);
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

  Future<DBLatestCustomersResponseModel> dbLatestCustomersApi() async {
    try {
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashLatestCustomers, null);
      return response = DBLatestCustomersResponseModel.fromJson(response);
    } catch(e){
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
      dynamic response =  await _apiService.postApiResponse(AppUrls.dashTransactions, null);
      return response = DBLatestTransactionResponseModel.fromJson(response);
    } catch(e){
      rethrow;
    }
  }

}




