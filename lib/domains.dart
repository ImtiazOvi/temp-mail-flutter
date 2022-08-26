import 'package:flutter/material.dart';
import 'api_service.dart';
import 'domain_response.dart';

class DomainScreen extends StatefulWidget{

  @override
  _DomainScreenState createState() => _DomainScreenState();

}

class _DomainScreenState extends State<DomainScreen> {
  ApiService apiService= ApiService();
  List<dynamic> domainList = [];
  @override
  void initState() {
    setState(() {
      domainListApiCall();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }

  void domainListApiCall() async{
    final domainData = await apiService.getDomainList();
    if (domainData != 'null') {
      domainList = domainData['hydra:member'];
      print('data'+ domainList[0]['domain']);
      setState(() {});
    }
  }
}