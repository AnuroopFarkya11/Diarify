import 'dart:developer';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{

  static ApiClient get to => Get.find();

  late String token;
  String appBaseUrl = 'http://10.0.2.2:5000/sentiment';

  Future<Response> getData(String uri) async{
    try{
      var response = await get(appBaseUrl+uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri,dynamic body)async{
    try{
      log("Calling the request");
      var response = await post(appBaseUrl, body);
      log("Done with the request: ${response.body}.");
      return response;
    }catch(e){
      log("e.toString()");
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

}