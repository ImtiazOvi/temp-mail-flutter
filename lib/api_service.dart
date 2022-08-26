import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:temp_mail_flutter/account.dart';
import 'package:temp_mail_flutter/domain_response.dart';

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


  // Future<Status?> CurrentStatus(token) async{
  //   print("Api_Service: "+token);
  //   try{
  //     var response = await http.post(
  //         Uri.parse(baseUrl+"applicationStatus"),
  //         headers: {
  //           "Authorization": "Bearer "+token
  //         }
  //
  //     );
  //     if(response.statusCode == 200){
  //       //success
  //       print("Registration: "+response.body);
  //       return Status.fromJson(jsonDecode(response.body));;
  //     }else{
  //       print("resCode: "+ response.statusCode.toString());
  //       return null;
  //     }
  //   }catch(e){
  //     print("resError: "+ e.toString());
  //     return null;
  //   }
  // }
}