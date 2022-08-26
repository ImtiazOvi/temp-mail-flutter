import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:temp_mail_flutter/loginResponse.dart';

import 'createAccountRes.dart';
class ApiService{
  String baseUrl = "https://api.mail.tm/";

  Future<dynamic> getDomainList() async {
    String fullUrl = baseUrl+'domains';
    var dio = Dio();
    final hydraMember = await dio.get(fullUrl);
    print("hydraMember_URL = " + fullUrl);
    print("hydraMember_Response = " + hydraMember.toString());
    if (hydraMember.statusCode == 200) {
      return hydraMember.data;
    } else {
      return 'null';
    }
  }

  Future<CreateAccountResponse?> createAccountCall(
      String address,
      String password,
      ) async {

    var body = jsonEncode({
      "address": address,
      "password": password
    });

    String fullUrl = baseUrl+'accounts';
    print("URL = " + fullUrl);
    print("formData = " + body.toString());

    final accountData = await http.post(Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: body,
    );
    print("URL = " + fullUrl);
    print("createAccountResponse res = " + accountData.body);
    if (accountData.statusCode == 201) {
      return CreateAccountResponse.fromJson(jsonDecode(accountData.body));
    } else {
      return null;
    }
  }

  Future<LoginResponse?> loginCall(
      String address,
      String password,
      ) async {

    var body = jsonEncode({
      "address": address,
      "password": password
    });

    String fullUrl = baseUrl+'token';
    print("URL = " + fullUrl);
    print("formData = " + body.toString());

    final accountData = await http.post(Uri.parse(fullUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
      body: body,
    );
    print("URL = " + fullUrl);
    print("loginResponse res = " + accountData.body);
    if (accountData.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(accountData.body));
    } else {
      return null;
    }
  }
  Future<dynamic> getMessageList(String token) async {
    print(">>>>>>>>>URL = " + token);
    String fullUrl = baseUrl+'messages';
    var dio = Dio();
    dio.options.headers["Authorization"] = token.toString();
    dio.options.headers["Content-Type"] = "application/json";
    final messageData = await dio.get(fullUrl);
    print("message_URL = " + token);
    print("message_respponse = " + messageData.toString());
    if (messageData.statusCode == 200) {
      return messageData.data;
    } else {
      return 'null';
    }
  }
}