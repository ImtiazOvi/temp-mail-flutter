import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:temp_mail_flutter/domain_response.dart';
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

  // Future<HospitalBook?> postHospitalBooking(
  //     String id,
  //     String patientValue,
  //     String selectedSurName,
  //     String patientName,
  //     String careOf,
  //     String age,
  //     String currentLocation,
  //     String presentLocation,
  //     String caseSummery,
  //     String initialDateText,
  //     String sexValue,
  //     String selectedCabinCriteria,
  //     String incentiveValue,
  //     String emergencyContact,
  //     String optionalContact
  //     ) async {
  //
  //   var body = jsonEncode({
  //     "hospital_id": id,
  //     "patient_type": patientValue,
  //     "name": selectedSurName+' '+patientName,
  //     "care_of": careOf,
  //     "age": age,
  //     "current_location": currentLocation,
  //     "present_address": presentLocation,
  //     "case_summary": caseSummery,
  //     "admission_date": initialDateText,
  //     "gender": sexValue,
  //     "cabin_type": selectedCabinCriteria,
  //     "incentive_care": incentiveValue,
  //     "emergency_mobile": emergencyContact,
  //     "other_mobile": optionalContact
  //   });
  //
  //   String fullUrl = baseUrl+'api/hospital-admission';
  //   print("URL = " + fullUrl);
  //   print("formData = " + body.toString());
  //
  //   final hospitalBookingData = await http.post(Uri.parse(fullUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Accept': 'application/json',
  //       'key': apiKey,
  //     },
  //     body: body,
  //   );
  //   print("URL = " + fullUrl);
  //   print("hospitalBookingData res = " + hospitalBookingData.body);
  //   if (hospitalBookingData.statusCode == 200) {
  //     return HospitalBook.fromJson(jsonDecode(hospitalBookingData.body));
  //   } else {
  //     return null;
  //   }
  // }
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