import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

class AllHttpRequest {

  Map<String, String> formDataHeader = {"Content-type": "application/x-www-form-urlencoded"};
  Map<String, String> jsonHeader = {"Content-type": "application/json"};

  Future login({body, apiUrl}) async {
    // set up POST request arguments
    String url = '$apiUrl';
    Map<String, String>? headers = {"Content-type": "application/json"};

    log("URL : $url");
    log("Request : $body");
    // make POST request
    Uri uri = Uri.parse(url);
    var response = await http.post(uri, headers: headers, body: json.encode(body));

    log("Response : ${response.body}");
    return json.decode(response.body);
  }

  dynamic returnResponse(http.Response response) {
    logRequest(response);
    var responseJson = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(responseJson['message']);
      case 401:
        {
          throw UnauthorisedException(responseJson['message']);
        }
      case 403:
        throw UnauthorisedException(responseJson['message']);
      case 500:
      default:
        throw FetchDataException(
            responseJson['message'] ?? 'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  void logRequest(http.Response response) {
    // show api logs
    log("Response ${response.statusCode} : ${response.body}");
  }
}
