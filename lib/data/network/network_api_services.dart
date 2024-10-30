import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Utils/Routes/routes_name.dart';

import '../../controler/viewModels/saveToken/save_token.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  // Get token from SharedPreferences
  Future<String?> _getToken() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString('accessToken');
  }

  // Generalized GET API method
  @override
  Future getApi(String url) async {
    return _makeApiRequest(() async {
      String? token = await _getToken();
      final response = await http.get(
        Uri.parse(url),
        headers: _buildHeaders(token),
      ).timeout(const Duration(seconds: 90));

      return returnResponse(response);
    });
  }

  // Generalized DELETE API method
  @override
  Future deleteApi(String url) async {
    return _makeApiRequest(() async {
      String? token = await _getToken();
      final response = await http.delete(
        Uri.parse(url),
        headers: _buildHeaders(token),
      ).timeout(const Duration(seconds: 90));

      return returnResponse(response);
    });
  }

  // Generalized PATCH API method
  @override
  Future patchApi(String url) async {
    return _makeApiRequest(() async {
      String? token = await _getToken();
      final response = await http.patch(
        Uri.parse(url),
        headers: _buildHeaders(token),
      ).timeout(const Duration(seconds: 90));

      return returnResponse(response);
    });
  }

  // POST API request with dynamic body data
  @override
  Future<dynamic> postApiResponse(String url, data) async {
    return _makeApiRequest(() async {
      String? token = await _getToken();
      final response = await http.post(
        Uri.parse(url),
        headers: _buildHeaders(token),
        body: data != null ? jsonEncode(data) : '',
      ).timeout(const Duration(seconds: 90));

      return returnResponse(response);
    });
  }

  // POST API request with MultipartRequest for file uploads
  Future<dynamic> postApiResponseRequest(String url, http.MultipartRequest request, String token) async {
    return _makeApiRequest(() async {
      request.headers['Authorization'] = 'Bearer $token';

      final client = http.Client();
      final streamedResponse = await client.send(request).timeout(const Duration(seconds: 60));
      final responseBody = await streamedResponse.stream.bytesToString();

      return returnResponse(http.Response(responseBody, streamedResponse.statusCode));
    });
  }

  // Helper to build headers
  Map<String, String> _buildHeaders(String? token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? ''}',
    };
  }

  // Centralized error and request handling logic
  Future<dynamic> _makeApiRequest(Future<dynamic> Function() requestFunc) async {
    try {
      return await requestFunc();
    } on TimeoutException {
      throw RequestTimeOut('Request timed out');
    } on SocketException {
      throw InternetExceptions('No internet connection');
    } on Exception catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  // Handle API response with status code checks
  dynamic returnResponse(http.Response response) {
    var responseJson = json.decode(response.body);

    if (kDebugMode) {
      print("Response status: ${response.statusCode}");
      print("Response body: $responseJson");
    }

    switch (response.statusCode) {
      case 200:
      case 201:
        return responseJson;
      case 400:
      case 403:
      case 404:
      case 422:
      case 500:
        return responseJson;
      case 401:
        _handleUnauthorized();
        break;
      default:
        throw FetchDataException('Error: Status code ${response.statusCode}');
    }
    return null;
  }

  // Handle unauthorized access (session expired)
  void _handleUnauthorized() async {
    await Get.defaultDialog(
      barrierDismissible: false,
      title: "Session Expired",
      middleText: "Your session has expired. Please log in again.",
      onConfirm: () async {
        await _logoutAndNavigateToSignIn();
      },
    );
  }

  // Clear user data and navigate to login screen
  Future<void> _logoutAndNavigateToSignIn() async {
    SaveUserData userViewModel = SaveUserData();
    userViewModel.removeUser();
    Get.offAllNamed(RoutesName.login_screen);
  }

  // General error handling
  void _handleError(dynamic e) {
    if (e is SocketException) {
      throw InternetExceptions('No internet connection');
    } else if (e is TimeoutException) {
      throw RequestTimeOut('Request timed out');
    } else {
      throw FetchDataException('Unexpected error occurred: $e');
    }
  }

  @override
  Future deleteApiResponse(String url) {
    throw UnimplementedError();
  }
}
