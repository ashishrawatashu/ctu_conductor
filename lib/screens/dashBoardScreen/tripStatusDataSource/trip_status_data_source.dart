import 'dart:async';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStatusDataSource/trip_status_Api.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripTicketsDataSource/trip_tickets_Api.dart';
import 'package:ctu_conductor_app/screens/loginScreen/loginDataSource/conductor_login_Api.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIHandler.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIs.dart';
import 'package:dio/dio.dart';

class TripStatusDataSource implements TripStatusApi {

  @override
  Future tripStatusApi(String tripCode, String empCode, String imei, String token) async {
    Map<String, String> requestHeader = Map();
    Map<String, String> requestBody = Map();
    requestHeader.putIfAbsent("Content-Type", () => Headers.formUrlEncodedContentType);
    requestBody.putIfAbsent("tripCode", () => tripCode);
    requestBody.putIfAbsent("empCode", () => empCode);
    requestBody.putIfAbsent("imei", () => imei);
    requestBody.putIfAbsent("token", () => token);
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.get(
        url: "${APIs.trip_status}",
        requestBody: requestBody,
        additionalHeaders: requestHeader);
    completer.complete(response);
    return completer.future;
  }
}
