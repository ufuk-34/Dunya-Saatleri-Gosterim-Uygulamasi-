import 'dart:async';
import 'dart:convert';
import "dart:core";
import 'package:http/http.dart' as http;

class ApiManager {

  final String AUTHORITY = "https://worldtimeapi.org";
  final String BASE_ENDPOINT = "/api/timezone/";


  Future<dynamic> getRequest(String endPoint,
      {Map<String, String>? queryParams, String? token}) async {

    try {
      var uri = "$AUTHORITY$BASE_ENDPOINT$endPoint";
      print('getRequest: ${uri.toString()}');
      var response = await http.get( Uri.parse(uri), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('http error ${response.statusCode}, ${response.body}');
      }
    } catch (e, trace) {
      print(trace);
    }
    return null;
  }



  Future<dynamic> postRequest(String endPoint,
      {Map<String, String>? body, String? token}) async {

    try {
      var uri = "$AUTHORITY$BASE_ENDPOINT$endPoint";
      print('postRequest: ${Uri.parse(uri)}, ${body.toString()}');
      var response = await http
          .post(Uri.parse(uri), body: body, headers: {
       // 'Content-Type': 'application/json',
       // 'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        print("200");
        return json.decode(response.body);
      }else {
        print('http error ${response.statusCode}, ${response.body}');
      }
    } catch (e, trace) {
      print('>>$trace');
    }
    return null;
  }

  Future<dynamic> deleteRequest(String endPoint, {String? token}) async {

    try {
      var uri = Uri.https(AUTHORITY, BASE_ENDPOINT + endPoint);
      print('deleteRequest: ${uri.toString()}');
      /*  var headers = null;
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }*/
      var response =
          await http.delete(uri, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else{
        print('http error ${response.statusCode}, ${response.body}');
      }
    } catch (e, trace) {
      print('>>$trace');
    }
    return null;
  }
}
