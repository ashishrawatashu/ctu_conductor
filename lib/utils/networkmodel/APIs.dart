import 'package:flutter/cupertino.dart';
class APIs {
  APIs._();


  // Base url
  static const String baseUrl = "http://utcdemo.uk.gov.in/ctuonline/wsConductor.asmx";

  static const String conductor_login = "$baseUrl/conductor_login";
  static const String ticket_detail = "$baseUrl/ticket_detail";
  static const String trip_Stop = "$baseUrl/trip_Stop";
  static const String trip_start = "$baseUrl/trip_start";
  static const String trip_status = "$baseUrl/trip_status";
  static const String trip_tickets = "$baseUrl/trip_tickets";

  static late BuildContext context;

}
