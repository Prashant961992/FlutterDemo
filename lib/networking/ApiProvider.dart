import 'package:demo/networking/CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "https://pmsapi.confidosoftsolutions.com/api/v1/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(_baseUrl + url);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, Map<String, dynamic> jsonBody) async {
    var responseJson;
    try {
      final http.Response response = await http.post(
        _baseUrl + url,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(jsonBody),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        // return responseJson;

        // throw BadRequestException(response.body.toString());
        throw BadRequestException("Bad Request Exception 400");
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

// CustomException Methods
