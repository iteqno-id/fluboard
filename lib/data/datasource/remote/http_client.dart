import 'dart:convert';

import 'package:fluboard/data/model/common/api_response.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  static Future<ApiResponse> get(String domain, String path,
      {Map<String, String> query = const {}}) async {
    try {
      final response = await http.get(Uri.https(domain, path, query));
      if (response.statusCode == 200) {
        return ApiResponse(success: true, message: response.reasonPhrase, data: response.body);
      } else {
        return ApiResponse(success: false, message: response.reasonPhrase, data: response.body);
      }
    } catch (e) {
      return ApiResponse(success: false, message: 'Client Error', data: null);
    }
  }

  static Future<ApiResponse> post(String domain, String path, dynamic body,
      {Map<String, String> headers = const {}}) async {
    try {
      final response = await http.post(Uri.parse('https://$domain$path'),
          body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(json.decode(response.body));
      } else {
        return ApiResponse(success: false, message: response.reasonPhrase, data: response.body);
      }
    } catch (e) {
      return ApiResponse(success: false, message: 'Client Error', data: null);
    }
  }
}
