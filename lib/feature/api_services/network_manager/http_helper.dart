// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import '../utils/print_value.dart';
// import '../utils/toast_message.dart';
//
// class HttpHelper {
// // Get API Handle
//   Future<dynamic> get({
//     required String url,
//     bool isRequireAuthorization = false,
//   }) async {
//     Map<String, String> apiHeader = {
//       "Content-type": " application/json ",
//     };
//     if (isRequireAuthorization) {
//       apiHeader = {"Content-type": "application/json  ", "Authorization": " "};
//     }
//     try {
//       final apiResponse = await http.get(Uri.parse(url), headers: apiHeader);
//       printValue(url, tag: " API GET URL: ");
//       printValue(apiHeader, tag: " API HEADER: ");
//       printValue(apiResponse.body, tag: " API RESPONSE: ");
//
//       return _returnResponse(
//         response: apiResponse,
//       );
//     } on SocketException {
//       return null;
//     }
//   }
//
//   //POST API HANDLE
//   Future<dynamic> post({
//     required String url,
//     Object? requestBody,
//     bool isRequireAuthorization = false,
//   }) async {
//     Map<String, String> apiHeader = {};
//     if (isRequireAuthorization) {
//       apiHeader = {"Content-type": "application/json  ", "Authorization": " "};
//     }
//     try {
//       http.Response apiResponse;
//       if (requestBody == null) {
//         apiResponse = await http.post(Uri.parse(url), headers: apiHeader);
//       } else {
//         apiResponse = await http.post(Uri.parse(url),
//             headers: apiHeader, body: requestBody);
//       }
//       printValue(url, tag: " API GET URL: ");
//       printValue(requestBody, tag: " API GET URL: ");
//       printValue(apiHeader, tag: " API HEADER: ");
//       printValue(apiResponse.body, tag: " API RESPONSE: ");
//
//       return _returnResponse(
//         response: apiResponse,
//       );
//     } on SocketException {
//       return null;
//     }
//   }
//
//   // PUT API HANDLE
//   Future<dynamic> put({
//     required String url,
//     bool isRequireAuthorization = false,
//     required dynamic requestBody,
//   }) async {
//     Map<String, String> apiHeader = {};
//     if (isRequireAuthorization) {
//       apiHeader = {"Content-type": "application/json ", "Authorization": " "};
//     }
//     try {
//       http.Response apiResponse;
//       if (requestBody == null) {
//         apiResponse = await http.put(Uri.parse(url), headers: apiHeader);
//       } else {
//         apiResponse = await http.put(Uri.parse(url),
//             headers: apiHeader, body: requestBody);
//       }
//       printValue(url, tag: " API GET URL: ");
//       printValue(requestBody, tag: " API GET URL: ");
//       printValue(apiHeader, tag: " API HEADER: ");
//       printValue(apiResponse.body, tag: " API RESPONSE: ");
//
//       return _returnResponse(
//         response: apiResponse,
//       );
//     } on SocketException {
//       return null;
//     }
//   }
//
//   //PATCH API HANDLE:
//   Future<dynamic> patch({
//     required String url,
//     bool isRequireAuthorization = false,
//     required dynamic requestBody,
//   }) async {
//     Map<String, String> apiHeader = {};
//     if (isRequireAuthorization) {
//       apiHeader = {"Content-type": "application/json ", "Authorization": " "};
//     }
//     try {
//       http.Response apiResponse;
//       if (requestBody == null) {
//         apiResponse = await http.patch(Uri.parse(url), headers: apiHeader);
//       } else {
//         apiResponse = await http.patch(Uri.parse(url),
//             headers: apiHeader, body: requestBody);
//       }
//       printValue(url, tag: " API PATCH URL: ");
//       printValue(requestBody, tag: " API GET URL: ");
//       printValue(apiHeader, tag: " API HEADER: ");
//       printValue(apiResponse.body, tag: " API RESPONSE: ");
//
//       return _returnResponse(
//         response: apiResponse,
//       );
//     } on SocketException {
//       return null;
//     }
//   }
//
//   // DELETE API HANDLE
//   Future<dynamic> delete({
//     required String url,
//     bool isRequireAuthorization = false,
//     Object? requestBody,
//   }) async {
//     Map<String, String> apiHeader = {};
//     if (isRequireAuthorization) {
//       apiHeader = {"Content-type": " application/json", "Authorization": " "};
//     }
//     try {
//       http.Response apiResponse;
//       if (requestBody == null) {
//         apiResponse = await http.delete(Uri.parse(url), headers: apiHeader);
//       } else {
//         apiResponse = await http.delete(Uri.parse(url),
//             headers: apiHeader, body: requestBody);
//       }
//       printValue(url, tag: " API DELETE URL: ");
//       printValue(apiHeader, tag: " API HEADER: ");
//       printValue(apiResponse.body, tag: " API RESPONSE: ");
//
//       return _returnResponse(
//         response: apiResponse,
//       );
//     } on SocketException {
//       return null;
//     }
//   }
//
//   /// MULTIPART API HANDLE:
//   Future<dynamic> uploadImage(String url, File imageFile) async {
//     try {
//       var request = http.MultipartRequest("post", Uri.parse(url));
//       request.headers.addAll({"content-Type ": "Multipart/from-data "});
//
//       request.files.add(
//         await http.MultipartFile.fromPath("file ", imageFile.path,
//             filename: imageFile.toString().split("/ ").last),
//       );
//       StreamedResponse streamedResponse = await request.send();
//       http.Response response = await http.Response.fromStream(streamedResponse);
//
//       printValue(url, tag: " API GET URL: ");
//       printValue({"content-Type ": "Multipart/from-data "},
//           tag: " API HEADER: ");
//       printValue(response.body, tag: " API RESPONSE: ");
//
//       return _returnResponse(response: response);
//     } on SocketException {
//       return null;
//     }
//   }
//
//   dynamic _returnResponse({required http.Response response}) {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//         return json.decode(response.body);
//
//       case 400:
//         try {
//           var decodeError = json.decode(response.body);
//           String errorMessage = decodeError['message'] ?? 'Bad Request';
//           toastMessage(errorMessage); // Show meaningful message
//         } catch (e) {
//           toastMessage("Invalid error response from server.");
//         }
//         throw Exception("Bad Request: ${response.body}");
//
//       case 401:
//         throw Exception("UNAUTHORIZED 401 - Please log in again");
//
//       case 500:
//         throw Exception("Server Error: Status Code 500");
//
//       default:
//         throw Exception("Unexpected Error: Status Code ${response.statusCode}");
//     }
//   }
//
//   dynamic returnResponse({
//     required http.Response response,
//   }) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = json.decode(response.body);
//         return responseJson;
//
//       case 201:
//         var responseJson = json.decode(response.body);
//         return responseJson;
//
//       case 400:
//         var decodeError = json.decode(response.body);
//         toastMessage(decodeError.toString());
//         /* if (decodeError.containsKey('')) {
//           toastMessage(decodeError['message'].toString());
//         } */
//         throw Exception("Error");
//       case 401:
//         // navigate to login page:
//         throw Exception('UNAUTHORIZED 401');
//
//       case 500:
//         throw Exception(
//             "Error occured while communication with server StatusCode 500");
//
//       default:
//         throw Exception(
//             "Error occured while communication with server StatusCode ${response.statusCode.toString()}");
//     }
//   }
// }




import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../utils/print_value.dart';
import '../utils/toast_message.dart';

class HttpHelper {
  // GET API Handle
  Future<dynamic> get({
    required String url,
    bool isRequireAuthorization = false,
  }) async {
    Map<String, String> apiHeader = {
      "Content-type": "application/json",
    };
    if (isRequireAuthorization) {
      apiHeader = {"Content-type": "application/json", "Authorization": " "};
    }
    try {
      final apiResponse = await http.get(Uri.parse(url), headers: apiHeader);
      printValue(url, tag: "API GET URL:");
      printValue(apiHeader, tag: "API HEADER:");
      printValue(apiResponse.body, tag: "API RESPONSE:");

      return _returnResponse(response: apiResponse);
    } on SocketException {
      return null;
    }
  }

  // POST API Handle
  Future<dynamic> post({
    required String url,
    Object? requestBody,
    bool isRequireAuthorization = false,
  }) async {
    Map<String, String> apiHeader = {"Content-type": "application/json"};
    if (isRequireAuthorization) {
      apiHeader["Authorization"] = " ";
    }
    try {
      http.Response apiResponse;
      if (requestBody == null) {
        apiResponse = await http.post(Uri.parse(url), headers: apiHeader);
      } else {
        apiResponse = await http.post(Uri.parse(url),
            headers: apiHeader, body: requestBody);
      }
      printValue(url, tag: "API POST URL:");
      printValue(requestBody, tag: "API BODY:");
      printValue(apiHeader, tag: "API HEADER:");
      printValue(apiResponse.body, tag: "API RESPONSE:");

      return _returnResponse(response: apiResponse);
    } on SocketException {
      return null;
    }
  }

  // PUT API Handle
  Future<dynamic> put({
    required String url,
    bool isRequireAuthorization = false,
    required dynamic requestBody,
  }) async {
    Map<String, String> apiHeader = {"Content-type": "application/json"};
    if (isRequireAuthorization) {
      apiHeader["Authorization"] = " ";
    }
    try {
      final apiResponse = await http.put(Uri.parse(url),
          headers: apiHeader, body: requestBody);
      printValue(url, tag: "API PUT URL:");
      printValue(requestBody, tag: "API BODY:");
      printValue(apiHeader, tag: "API HEADER:");
      printValue(apiResponse.body, tag: "API RESPONSE:");

      return _returnResponse(response: apiResponse);
    } on SocketException {
      return null;
    }
  }

  // DELETE API Handle
  Future<dynamic> delete({
    required String url,
    bool isRequireAuthorization = false,
    Object? requestBody,
  }) async {
    Map<String, String> apiHeader = {"Content-type": "application/json"};
    if (isRequireAuthorization) {
      apiHeader["Authorization"] = " ";
    }
    try {
      final apiResponse = await http.delete(Uri.parse(url),
          headers: apiHeader, body: requestBody);
      printValue(url, tag: "API DELETE URL:");
      printValue(apiHeader, tag: "API HEADER:");
      printValue(apiResponse.body, tag: "API RESPONSE:");

      return _returnResponse(response: apiResponse);
    } on SocketException {
      return null;
    }
  }

  // Multipart API Handle (For Uploading Images)
  Future<dynamic> uploadImage(String url, File imageFile) async {
    try {
      var request = http.MultipartRequest("post", Uri.parse(url));
      request.headers.addAll({"content-Type": "Multipart/form-data"});

      request.files.add(
        await http.MultipartFile.fromPath("file", imageFile.path),
      );
      StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      printValue(url, tag: "API Upload URL:");
      printValue({"content-Type": "Multipart/form-data"}, tag: "API HEADER:");
      printValue(response.body, tag: "API RESPONSE:");

      return _returnResponse(response: response);
    } on SocketException {
      return null;
    }
  }

  // Handles API responses
  dynamic _returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body);
      case 400:
        var decodeError = json.decode(response.body);
        toastMessage(decodeError.toString());
        throw Exception("Bad Request: ${response.body}");
      case 401:
        throw Exception("UNAUTHORIZED 401 - Please log in again");
      case 500:
        throw Exception("Server Error: Status Code 500");
      default:
        throw Exception("Unexpected Error: Status Code ${response.statusCode}");
    }
  }
}
