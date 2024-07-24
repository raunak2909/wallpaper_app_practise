import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpClient;

import 'app_exceptions.dart';

class ApiHelper {
  Future<dynamic> getAPI({required String url}) async {
    var uri = Uri.parse(url);

    try {
      var res = await httpClient.get(uri, headers: {
        "Authorization":"IsdZkUsWondOOmqNkNSFGtBuaoRofOkF8VKuftMElAFV4KDCD2Bi5rPr"
      });
      return returnJsonResponse(res);
    } on SocketException catch (e) {
      throw (FetchDataException(errorMsg: "No Internet!!"));
    }
  }

  dynamic returnJsonResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        {
          var mData = jsonDecode(response.body);
          return mData;
        }

      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(errorMsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            errorMsg:
                'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
