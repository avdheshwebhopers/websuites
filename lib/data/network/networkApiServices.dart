// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../app_exceptions/app_excaptions.dart';
// import 'baseApiServices.dart';
//
// class NetworkApiServices extends BaseApiServices {
//   Client client = Client();
//
//   @override
//   Future deleteApiResponse(String url) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//
//     dynamic responseJson;
//     try {
//       final client = InterceptedClient.build(
//         interceptors: [
//           LoggerInterceptor(),
//         ],
//       );
//
//       final response = await client.delete(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           "Authorization": "Bearer ${token ?? ''}"
//         },
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     if (kDebugMode) {
//       log(responseJson.toString());
//     }
//     return responseJson;
//   }
//
//   @override
//   Future getApiResponse(String url) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//
//     dynamic responseJson;
//     try {
//       // final client =
//       //     InterceptedClient.build(interceptors: [LoggerInterceptor()]);
//       print('url hit: $url');
//       final response = await client.get(Uri.parse(url), headers: {
//         'Content-Type': 'application/json',
//         "Authorization": "Bearer ${token ?? ''}"});
//       // }).timeout(const Duration(seconds: 20));
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet Connection');
//     }
//     if (kDebugMode) {
//       log(responseJson.toString());
//     }
//     return responseJson;
//   }
//
//   @override
//   Future postApiResponse(String url, data) async {
//     dynamic responseJson;
//     try {
//       // final client = InterceptedClient.build(interceptors: [LoggerInterceptor()]);
//
//       final sp = await SharedPreferences.getInstance();
//       String? token = sp.getString('token');
//       print('url hit: ${url}\nToken : $token');
//       final response = await client.post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           "Authorization": "Bearer ${token ?? ''}"
//         },
//         body: data != null ? jsonEncode(data.toJson()): '',
//       );
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     if (kDebugMode) {
//       log(responseJson.toString());
//     }
//     return responseJson;
//   }
//
//   @override
//   Future postEmptyParmApiResponse(String url, bodyParms) async {
//     final sp = await SharedPreferences.getInstance();
//     String? token = sp.getString('token');
//
//     dynamic responseJson;
//     try {
//       final client =
//       InterceptedClient.build(interceptors: [LoggerInterceptor()]);
//       print('url hit: $url');
//       final response = await client.post(
//         Uri.parse(url),
//         headers: {
//           'Content-Type': 'application/json',
//           "Authorization": "Bearer ${token ?? ''}"
//         },
//         body: bodyParms.isNotEmpty ? jsonEncode(bodyParms.toJson()) : '',
//       );
//
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     if (kDebugMode) {
//       log(responseJson.toString());
//     }
//     return responseJson;
//   }
//
//   @override
//   Future putApiResponse(String url, bodyParms) async {
//     //
//     // final sp = await SharedPreferences.getInstance();
//     // String? token = sp.getString('token');
//
//     dynamic responseJson;
//     try {
//       final client =
//       InterceptedClient.build(interceptors: [LoggerInterceptor()]);
//
//       final response = await client.put(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json', "Authorization": ""},
//         body: jsonEncode(bodyParms.toJson()),
//       );
//       responseJson = _returnResponse(response);
//     } on SocketException {
//       throw FetchDataException('No Internet connection');
//     }
//     if (kDebugMode) {
//       log(responseJson);
//     }
//     return responseJson;
//   }
//
//   dynamic _returnResponse(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       case 400:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       case 401:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       case 403:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       case 404:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       case 422:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       case 500:
//         var responseJson = json.decode(response.body.toString());
//         return responseJson;
//
//       default:
//         throw FetchDataException(
//             'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
//     }
//   }
// }
//
// class LoggerInterceptor implements InterceptorContract {
//   @override
//   Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
//     if (kDebugMode) {
//       print("----- Request -----");
//       log('Url hit: ${request.url}');
//       //  log('Required: ${data.body}');
//     }
//     return request;
//   }
//
//   @override
//   Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
//     if (kDebugMode) {
//       print("------- Response -------");
//       print(response.statusCode.toString());
//
//     }
//     return response;
//   }
//
//   Future<bool> shouldInterceptRequest() async => true;
//
//   Future<bool> shouldInterceptResponse() async => true;
// }

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;


import '../../Utils/Routes/routes_name.dart';
import '../../View_model/controllers/save_token/save_token.dart';
import '../app_exceptions/app_excaptions.dart';
import 'baseApiServices.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final sp = await SharedPreferences.getInstance();
      String? token = sp.getString('accessToken');

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token ?? ''}',
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on TimeoutException {
      //  _showTimeoutDialog();
      throw RequestTimeOut('Request Time out');
    } on SocketException {
      throw InternetExceptions('');
    } on Exception catch (e) {
      _handleError(e);
      rethrow;
    }
    return responseJson;
  }

  Future deleteApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final sp = await SharedPreferences.getInstance();
      String? token = sp.getString('accessToken');

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token ?? ''}',
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on TimeoutException {
      throw RequestTimeOut('Request Time out');
    } on SocketException {
      throw InternetExceptions('');
    } on Exception catch (e) {
      _handleError(e);
      rethrow; // Propagate the error up the chain
    }
    return responseJson;
  }

  @override
  Future patchApi(String url) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final sp = await SharedPreferences.getInstance();
      String? token = sp.getString('accessToken');

      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${token ?? ''}',
        },
      ).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on TimeoutException {
      //  _showTimeoutDialog();
      throw RequestTimeOut('Request Time out');
    } on SocketException {
      throw InternetExceptions('');
    } on Exception catch (e) {
      _handleError(e);
      rethrow; // Propagate the error up the chain
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApiResponse(String url, data) async {
    final sp = await SharedPreferences.getInstance();
    String? token = sp.getString('accessToken');
    if (kDebugMode) {
      print(url);
      print(token);
      print('>>>>>$data');
    }
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${token ?? ''}"
        },
        body: data != null ? jsonEncode(data) : '',
      )
          .timeout(const Duration(seconds: 60));

      final responseJson = returnResponse(response);
      if (kDebugMode) {
        print(responseJson.toString());
      }
      return responseJson;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future postApiResponseRequest(
      String url, http.MultipartRequest request, String token) async {
    if (kDebugMode) {
      print(url);
      print(request);
    }

    try {
      // Set the authorization header
      request.headers['Authorization'] = 'Bearer ${token ?? ''}';

      // Use http.Client to send the multipart request
      final client = http.Client();
      final response =
      await client.send(request).timeout(const Duration(seconds: 60));

      // Read and parse the response
      final responseBody = await response.stream.bytesToString();
      final responseJson =
      returnResponse(http.Response(responseBody, response.statusCode));
      if (kDebugMode) {
        print("Json response : ${responseJson.toString()}");
      }

      // Try to extract the token from the response headers
      final responseToken = response.headers['authorization'] ??
          json.decode(responseBody)['authorization'];

      // Close the client
      client.close();

      // Access the response token here (responseToken)
      print("Response Token: $responseToken");

      return responseJson;
    } catch (e) {
      _handleError(e);
      rethrow; // Propagate the error up the chain
    }
  }

// Helper function to handle errors
  void _handleError(dynamic e) {
    if (e is SocketException) {
      throw InternetExceptions('No internet');
    } else if (e is TimeoutException) {
      throw RequestTimeOut('Request Time out');
    }
  }

  Future<String> postApiResponseToken() async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString('accessToken') ?? '';
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 201:
        var responseJson = json.decode(response.body.toString());
        print("json response is here: $responseJson");
        return responseJson;

      case 400:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 401:
        _handleUnauthorized();
        break;

      case 403:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 404:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 405:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 422:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      case 500:
        var responseJson = json.decode(response.body.toString());
        return responseJson;

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void _handleUnauthorized() async {
    // Show an alert dialog indicating session expired
    await Get.defaultDialog(
      barrierDismissible: false,
      title: "Session Expired",
      middleText: "Your session has expired. Please log in again.",
      onConfirm: () async {
        // Clear any user-related data
        await _logoutAndNavigateToSignIn();
      },
    );
  }

// Logout the user and navigate to the sign-in screen
  Future<void> _logoutAndNavigateToSignIn() async {
    SaveToken userViewModel = SaveToken();
    userViewModel.removeToken();
    Get.offAllNamed(RoutesName.login_screen);
  }

  @override
  Future deleteApiResponse(String url) {
    // TODO: implement deleteApiResponse
    throw UnimplementedError();
  }
}
