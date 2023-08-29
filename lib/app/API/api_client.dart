import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as api;

class ApiClient extends GetConnect implements GetxService {
  static ApiClient get to => Get.find();
  final dio = api.Dio();
  late String token;
  String appBaseUrl = 'http://192.168.29.217:5000/sentiment';

  getData(String uri) async {
    try {
      var response = await dio.get(appBaseUrl);
      return response;
    } catch (e) {
      return null;
    }
  }

  postData(String uri,Map<String, dynamic> body)async{
    try{
      log("Calling the request");

      var response = await httpClient.post(
        appBaseUrl,
        body: body,
      );
      log(Uri.parse(appBaseUrl).toString());
      // final response1 = await http.post(Uri.parse(appBaseUrl), body: body);
      log("Done with the request: ${response.body}.");
      return response;
    }catch(e){
      log(e.toString());
      return null;
    }
  }
}
