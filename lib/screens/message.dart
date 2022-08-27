import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service.dart';

class MessageScreen extends StatefulWidget {

  @override
  _MessageScreenState createState() => _MessageScreenState();

}

class _MessageScreenState extends State<MessageScreen> {
  ApiService apiService = ApiService();
  List<dynamic> domainList = [];
  String? domainName;
  String? token;
  @override
  void initState() {
    setState(() {
      print('message page>>>>>>>>>>>>>>>>>>>>>>');
      messageApiCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          body: Column(
            children: [
             //List builder task
            ]
            ,
          )
          ,
        ));
  }

  void messageApiCall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token')!;
    print('data_token' + token.toString());
    final messageData = await apiService.getMessageList(token.toString());
    if (messageData != 'null') {
      //messageList = messageData['hydra:member'];
      print('data_message' + messageData['@type'].toString());
      setState(() {});
    }
  }
}