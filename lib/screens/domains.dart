import 'package:flutter/material.dart';
import '../api/api_service.dart';
import 'account.dart';
import 'login.dart';
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
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              navigateToLoginButton(size),

              SizedBox(
                height: size.height * 0.03,
              ),
              richText(),

              Expanded(
                  child: ListView.builder(
                    itemCount: domainList.length,
                    itemBuilder: (context, index) =>
                        Card(
                          color: Colors.grey,
                          elevation: 6,
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text("Domain: "+domainList[index]['domain']),
                            subtitle: Text("Id: "+domainList[index]['id']),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(domainList[index]['domain']!)));
                            },
                          ),
                        ),
                  )
              )

            ],
        ),
    );

  }

  Widget navigateToLoginButton(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      margin: const EdgeInsets.only(left: 24.0, top: 16.0, right: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0),
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
        Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
      },
      child: const Text(
        'Login Account',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    )

    );
  }

  Widget richText() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Domain ',
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
      style: TextStyle(fontSize: 24),
    );
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