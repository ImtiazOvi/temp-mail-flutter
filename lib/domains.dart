import 'package:flutter/material.dart';
import 'package:temp_mail_flutter/account.dart';
import 'api_service.dart';
class DomainScreen extends StatefulWidget {

  @override
  _DomainScreenState createState() => _DomainScreenState();

}

class _DomainScreenState extends State<DomainScreen> {
  ApiService apiService = ApiService();
  List<dynamic> domainList = [];
  String? domainName;
  @override
  void initState() {
    setState(() {
      domainListApiCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:  Scaffold(
          body: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(domainName!)));
            },
            child: Text('Create Account'),)
        ]
        ,
      )
      ,
    ));
  }

  void domainListApiCall() async {
    final domainData = await apiService.getDomainList();
    if (domainData != 'null') {
      domainList = domainData['hydra:member'];
      domainName = domainList[0]['domain'];
      print('data' + domainList[0]['domain']);
      setState(() {});
    }
  }
}