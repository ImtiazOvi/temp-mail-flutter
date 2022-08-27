import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_service.dart';

class MessageScreen extends StatefulWidget {

  @override
  _MessageScreenState createState() => _MessageScreenState();

}

class _MessageScreenState extends State<MessageScreen> {
  ApiService apiService = ApiService();
  List<dynamic> messageList = [];
  String? token;
  @override
  void initState() {
    setState(() {
      messageApiCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          richText(),

          Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) =>
                    Card(
                      color: Colors.grey,
                      elevation: 6,
                      margin: const EdgeInsets.all(20),
                      child: ListTile(
                        title: Text("To: imtiaztemp020@gmail.com \nFrom: imtiaz123@arxxwalls.com"),
                        subtitle: Text("Subject: Hello User \nBody: Welcome message from sender"),
                      ),
                    ),
              )
          )

        ],
      ),
    );

  }

  Widget richText() {
    return const Text.rich(
      TextSpan(
        children: [
          // add a space between texts
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(top: 48.0),
            ),
          ),

          TextSpan(
            text: 'Message ',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'List',
            style: TextStyle(
              color: Color(0xFFFE9879),
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24)
    );
  }


  void messageApiCall() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token')!;
    print('data_token$token');
    final messageData = await apiService.getMessageList(token.toString());
    if (messageData != 'null') {
      //messageList = messageData['hydra:member'];
      print('data_message${messageData['@type']}');
      setState(() {});
    }
  }
}