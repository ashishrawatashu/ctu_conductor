import 'dart:async';
import 'package:ctu_conductor_app/response/help_desk_response.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/helpDeskDataSource/help_desk_Api.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripDetailsDataSource/trip_details_Api.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStartDataSource/trip_start_Api.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripTicketsDataSource/trip_tickets_Api.dart';
import 'package:ctu_conductor_app/screens/loginScreen/loginDataSource/conductor_login_Api.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIHandler.dart';
import 'package:ctu_conductor_app/utils/networkmodel/APIs.dart';
import 'package:dio/dio.dart';

class HelpDeskDataSource implements HelpDeskApi {
  @override
  Future helpDeskApi() async {
    Map<String, String> requestHeader = Map();
    Map<String, String> requestBody = Map();
    requestHeader.putIfAbsent("Content-Type", () => Headers.formUrlEncodedContentType);
    Completer<dynamic> completer = new Completer<dynamic>();
    print(requestBody);
    var response = await APIHandler.get(
        url: "${APIs.helpdesk}",
        requestBody: requestBody,
        additionalHeaders: requestHeader);
    completer.complete(response);
    return completer.future;
  }


}
