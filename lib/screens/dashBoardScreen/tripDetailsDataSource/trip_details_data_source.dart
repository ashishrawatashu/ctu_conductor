import 'dart:async';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripDetailsDataSource/trip_details_Api.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStartDataSource/trip_start_Api.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripTicketsDataSource/trip_tickets_Api.dart';
import 'package:ctu_conductor_app/screens/loginScreen/loginDataSource/conductor_login_Api.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIHandler.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIs.dart';
import 'package:dio/dio.dart';

class TripDetailsDataSource implements TripDetailsApi {



  @override
  Future tripDetailsApi(String ticketNumber, String imei, String token) async {
    Map<String, String> requestHeader = Map();
    Map<String, String> requestBody = Map();
    requestHeader.putIfAbsent("Content-Type", () => Headers.formUrlEncodedContentType);
    requestBody.putIfAbsent("ticketNumber", () => ticketNumber);
    requestBody.putIfAbsent("imei", () => imei);
    requestBody.putIfAbsent("token", () => token);
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.get(
        url: "${APIs.ticket_detail}",
        requestBody: requestBody,
        additionalHeaders: requestHeader);
    completer.complete(response);
    return completer.future;
  }

}
