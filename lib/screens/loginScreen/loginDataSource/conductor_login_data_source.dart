import 'dart:async';
import 'package:ctu_conductor_app/screens/loginScreen/loginDataSource/conductor_login_Api.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIHandler.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIs.dart';
import 'package:dio/dio.dart';

class ConductorLoginDataSource implements ConductorLoginApi {


  @override
  Future conductorLoginApi(String mobileNo, String otpPassword, String imei, String token) async {
    Map<String, String> requestHeader = Map();
    Map<String, String> requestBody = Map();
    requestHeader.putIfAbsent("Content-Type", () => Headers.formUrlEncodedContentType);
    requestBody.putIfAbsent("mobileNo", () => mobileNo);
    requestBody.putIfAbsent("otpPassword", () => otpPassword);
    requestBody.putIfAbsent("imei", () => imei);
    requestBody.putIfAbsent("token", () => token);
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.get(
        url: "${APIs.conductor_login}",
        requestBody: requestBody,
        additionalHeaders: requestHeader);
    completer.complete(response);
    return completer.future;
  }
}
