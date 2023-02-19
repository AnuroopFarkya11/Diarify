import 'dart:developer';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService{

  static ApiClient get to => Get.find();

  late String token;
  String appBaseUrl = 'http://192.168.191.27:5000/';

  Future<Response> getData(String uri) async{
    try{
      var response = await get(appBaseUrl);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  Future<Response> postData(String uri,dynamic body)async{
    try{
      var response = await post(appBaseUrl, body);
      log(response.body);
      return response;
    }catch(e){
      log(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

}