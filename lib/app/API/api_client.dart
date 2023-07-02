import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';


class ApiClient extends GetConnect implements GetxService{

  static ApiClient get to => Get.find();

  late String token;
  String appBaseUrl = 'http://127.0.0.1:5000/sentiment';

  Future<Response> getData(String uri) async{
    try{
      var response = await get(appBaseUrl+uri);
      return response;
    }catch(e){
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

  postData(String uri,Map<String, dynamic> body)async{
    try{
      log("Calling the request");

      var response = await post('http://127.0.0.1:5000/sentiment', body);
      log(Uri.parse(appBaseUrl).toString());
      // final response1 = await http.post(Uri.parse(appBaseUrl), body: body);
      log("Done with the request: ${response.body}.");
      return response;
    }catch(e){
      log(e.toString());
      return Response(statusCode: 1,statusText: e.toString());
    }
  }

}