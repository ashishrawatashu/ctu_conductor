import 'dart:async';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStopDataSource/trip_stop_Api.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIHandler.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIs.dart';
import 'package:dio/dio.dart';

class TripStopDataSource implements TripStopApi {


  @override
  Future tripStotApi(String tripCode, String empCode, String closingKM, String amountFare, String amountToll, String amountParking, String amountOther, String receiptNo, String imei, String token) async {
    Map<String, String> requestHeader = Map();
    Map<String, String> requestBody = Map();
    requestHeader.putIfAbsent("Content-Type", () => Headers.formUrlEncodedContentType);
    requestBody.putIfAbsent("tripCode", () => tripCode);
    requestBody.putIfAbsent("empCode", () => empCode);
    requestBody.putIfAbsent("closingKM", () => closingKM);
    requestBody.putIfAbsent("amountFare", () => amountFare);
    requestBody.putIfAbsent("amountToll", () => amountToll);
    requestBody.putIfAbsent("amountParking", () => amountParking);
    requestBody.putIfAbsent("amountOther", () => amountOther);
    requestBody.putIfAbsent("receiptNo", () => receiptNo);
    requestBody.putIfAbsent("imei", () => imei);
    requestBody.putIfAbsent("token", () => token);
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.get(
        url: "${APIs.trip_Stop}",
        requestBody: requestBody,
        additionalHeaders: requestHeader);
    completer.complete(response);
    return completer.future;
  }
}
