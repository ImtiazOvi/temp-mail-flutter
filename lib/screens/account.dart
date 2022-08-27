import 'package:flutter/material.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/mailer.dart';

import '../api/api_service.dart';
import 'login.dart';
class AccountScreen extends StatefulWidget{
  String domainName;
  AccountScreen(this.domainName);


  @override
  _AccountScreenState createState() => _AccountScreenState();

}

class _AccountScreenState extends State<AccountScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  ApiService apiService= ApiService();
  List<dynamic> domainList = [];
  @override
  void initState() {
    setState(() {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                richText(24),
                SizedBox(
                  height: size.height * 0.03,
                ),
                //email & password section
                emailTextField(size),
                SizedBox(
                  height: size.height * 0.02,
                ),
                passwordTextField(size),
                SizedBox(
                  height: size.height * 0.03,
                ),

                //sign in button & sign in with text
                signUpButton(size),
                SizedBox(
                  height: size.height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFEFEFEF),
        ),
      ),
      child: TextField(
        controller: _emailController,
        maxLines: 1,
        cursorColor: Color(0xFF15224F),
        decoration: const InputDecoration(
            labelText: 'Email',
            border: InputBorder.none),
      ),
    );
  }

  Widget richText(double fontSize) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Create ',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'Account',
            style: TextStyle(
              color: Color(0xFFFE9879),
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget passwordTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFFEFEFEF),
        ),
      ),
      child: TextField(
        controller: _passwordController,
        maxLines: 1,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: Color(0xFF15224F),
        decoration: const InputDecoration(
            labelText: 'Password',
            border: InputBorder.none),
      ),
    );
  }

  Widget signUpButton(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: const Color(0xFF21899C),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4C2E84).withOpacity(0.2),
            offset: const Offset(0, 15.0),
            blurRadius: 60.0,
          ),
        ],
      ),
      child: InkWell(
        onTap: (){
          createAccountApiCall();
        },
        child: Text('Sign Up'),)
    );
  }

  void createAccountApiCall() async{
    final accountData = await apiService.createAccountCall(_emailController.text, _passwordController.text);
    if (accountData != null) {
      // sending mail
      sendEmail(accountData.address.toString());
      print('data_account${accountData.address}');
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
      });
    }
  }

  void sendEmail(String address) async{
    final smtpServer = gmail('imtiaztemp020@gmail.com', 'Pa55W0rd');
    final message = Message()
      ..from = Address('imtiaztemp020@gmail.com', 'Imtiaz')
      ..recipients.add(address)
      ..subject = 'Hello User'
      ..text = 'Welcome message from sender';
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: $sendReport');
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
