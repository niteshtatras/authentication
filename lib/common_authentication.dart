library common_authentication;

import 'dart:developer';

import 'all_http_request.dart';
import 'app_exception.dart';

class Authentication {
  final String apiUrl;
  Authentication({
    required this.apiUrl
  });

  AllHttpRequest httpRequest = AllHttpRequest();

  Future<dynamic> authenticateUser({required email, required password}) async {
    try {
      var body = {
        "email": email,
        "password": password
      };
      var response = await httpRequest.login(body: body, apiUrl: apiUrl);

      if (response != null) {
        log("Response RunTime Type ==== ${response.runtimeType}");
        return response;
      } else {
        throw FetchDataException(response['message']);
      }
    } catch (e) {
      log("Message====$e");
      throw FetchDataException(e.toString());
    }
  }
}
