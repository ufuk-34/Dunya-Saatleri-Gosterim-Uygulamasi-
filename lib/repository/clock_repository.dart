import '../model/clock.dart';
import 'api_manager.dart';
import 'package:get/get.dart';

Future getTimezoneList() async{  //  Dünyadaki tüm tmezone listesini getiren yapı
  var endpoint = '';
  var response = await ApiManager().getRequest(endpoint);
  if (response != null) {
    print(response.toString());
   return response;
  }
  return [];
}



Future<Clock> getTimezone(String timezone) async {  // ilgili timezone'nun yerel saati bilgisini veren yapı
  var endpoint = timezone;
  var response = await ApiManager().getRequest(endpoint);
  print(response.toString());
  return Clock.fromJSON(response);
}