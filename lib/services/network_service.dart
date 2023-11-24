import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:polytech_visits/services/auth_repository.dart';
import 'package:polytech_visits/utils/const.dart';

class NetworkService {
  final String baseUrl = AppConstants.baseUrl;
  final Map<String, String> baseHeader = {
    "Access-Control-Allow-Origin": "*",
    "Accept": "application/json",
    "Content-Type": "application/json; charset=UTF-8",
  };

  Future<dynamic> login(String login, String password) async {
    final response = await http.post(
      Uri.parse('${baseUrl}users/login/'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({'username': login, 'password': password}),
    );

    var responseJson = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return responseJson;
    } else {
      throw Exception(responseJson['message']);
    }
  }

  Future<dynamic> checkSchedule(String number) async {
    final response = await http.post(
      Uri.parse('${baseUrl}schedule/check/'),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Accept": "application/json",
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Token ${await AuthRepository().getUserToken()}"
      },
      body: jsonEncode({'number': number}),
    );

    var responseJson = jsonDecode(response.body);
    print(responseJson);

    if (response.statusCode == 200) {
      return responseJson;
    } else {
      throw Exception(responseJson['message']);
    }
  }
}
