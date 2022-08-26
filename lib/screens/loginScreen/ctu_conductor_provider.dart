import 'package:ctu_conductor_app/response/login_response.dart';
import 'package:ctu_conductor_app/response/trip_details_response.dart';
import 'package:ctu_conductor_app/response/trip_start_stop_response.dart';
import 'package:ctu_conductor_app/response/trip_status_response.dart';
import 'package:ctu_conductor_app/response/trip_tickets.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripDetailsDataSource/trip_details_data_source.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStartDataSource/trip_start_data_source.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStatusDataSource/trip_status_data_source.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripStopDataSource/trip_stop_data_source.dart';
import 'package:ctu_conductor_app/screens/dashBoardScreen/tripTicketsDataSource/trip_tickets_data_source.dart';
import 'package:ctu_conductor_app/screens/loginScreen/loginDataSource/conductor_login_data_source.dart';
import 'package:ctu_conductor_app/utils/all_strings.dart';
import 'package:ctu_conductor_app/utils/images_path_string.dart';
import 'package:flutter/material.dart';

class CtuConductorProvider extends ChangeNotifier {

  //phone Number Validate

  var _userPhoneNumber;

  get userPhoneNumber => _userPhoneNumber;

  void phoneNumberValidation(String? phoneNumber) {
    if (phoneNumber!.length == 10) {
      _userPhoneNumber = null;
      notifyListeners();
    } else {
      _userPhoneNumber = "Invalid mobile number";
      notifyListeners();
    }
  }

  //phone Number Validate
  var _password;
  get password => _password;

  void passwordValidation(String? userPassword) {
    if (userPassword!.length > 5) {
      _password = null;
      notifyListeners();
    } else {
      _password = "Invalid password";
      notifyListeners();
    }
  }


  //ctu conductor
  List<Conductor>? conductor;
  LoginResponse loginResponse = LoginResponse();
  ConductorLoginDataSource conductorLoginDataSource = ConductorLoginDataSource();
  Future<LoginResponse> loginConductor(String mobileNo,String otpPassword) async {
    setLoading(true);
    var response = await conductorLoginDataSource.conductorLoginApi(mobileNo, otpPassword, AllStrings.IMEI_NO, AllStrings.TOKEN);
    print(response);
    loginResponse = LoginResponse.fromJson(response);
    if(loginResponse.code=="100"){
      conductor = loginResponse.conductor;
    }
    return loginResponse;
  }

  //trip tickets
  List<Tickets> ticketsList = [];
  TripTickets tripTickets = TripTickets();
  TripDataSource tripDataSource = TripDataSource();
  Future<TripTickets> getTripTickets() async {
    var response = await tripDataSource.tripTicketsApi(conductor![0].tripcode.toString(), AllStrings.IMEI_NO, AllStrings.TOKEN);
    print(response);
    tripTickets = TripTickets.fromJson(response);
    if(tripTickets.code=="100"){
      ticketsList = tripTickets.tickets!;
      setLoading(false);
    }

    return tripTickets;

  }

  //start trip

  TripStartStopResponse tripStartResponse = TripStartStopResponse();
  TripStartDataSource tripStartDataSource = TripStartDataSource();
  Future<TripStartStopResponse> startTrip(tripCode, empCode, plateformeNo, openingKM) async {
    setLoading(true);
    var response = await tripStartDataSource.tripStartApi(tripCode, empCode, plateformeNo, openingKM, AllStrings.IMEI_NO, AllStrings.TOKEN);
    print(response);
    tripStartResponse = TripStartStopResponse.fromJson(response);
    if(tripStartResponse.code=="100"){
      setLoading(false);
    }

    return tripStartResponse;

  }


  //start trip

  TripStartStopResponse tripStopResponse = TripStartStopResponse();
  TripStopDataSource tripStopDataSource = TripStopDataSource();
  Future<TripStartStopResponse> stopTrip(tripCode, empCode,closingKM, amountFare, amountToll, amountParking, amountOther, receiptNo) async {
    setLoading(true);
    var response = await tripStopDataSource.tripStotApi(tripCode, empCode, closingKM, amountFare, amountToll, amountParking, amountOther, receiptNo, AllStrings.IMEI_NO, AllStrings.TOKEN);
    print(response);
    tripStopResponse = TripStartStopResponse.fromJson(response);
    if(tripStopResponse.code=="100"){
      setLoading(false);
    }

    return tripStopResponse;

  }



  var _platformNo;
  get platformNo => _platformNo;

  void platformNoValidation(String? platformNumber) {
    if (platformNumber!.length >0) {
      _platformNo = null;
      notifyListeners();
    } else {
      _platformNo = "Invalid Platform No/Station";
      notifyListeners();
    }
  }

  var _kmDriven;
  get kmDriven => _kmDriven;

  void kmDrivenValidation(String? kmDriven) {
    if (kmDriven!.length > 0) {
      _kmDriven = null;
      notifyListeners();
    } else {
      _kmDriven = "Invalid km";
      notifyListeners();
    }
  }



  var _totalAmount;
  get totalAmount => _totalAmount;

  void totalAmountValidation(String? totalAmount) {
    if (totalAmount!.length > 0) {
      _totalAmount = null;
      notifyListeners();
    } else {
      _totalAmount = "Invalid amount ";
      notifyListeners();
    }
  }


  var _totalToll;
  get totalToll => _totalToll;

  void totalTollValidation(String? totalToll) {
    if (totalToll!.length > 0) {
      _totalToll = null;
      notifyListeners();
    } else {
      _totalToll = "Invalid toll amount";
      notifyListeners();
    }
  }

  var _totalAmountParking;
  get totalAmountParking => _totalAmountParking;

  void totalAmountParkingValidation(String? totalAmountParking) {
    if (totalAmountParking!.length > 0) {
      _totalAmountParking = null;
      notifyListeners();
    } else {
      _totalAmountParking = "Invalid parking amount";
      notifyListeners();
    }
  }

  var _otherAmount;
  get otherAmount => _otherAmount;

  void otherAmountValidation(String? otherAmount) {
    if (otherAmount!.length >0) {
      _otherAmount = null;
      notifyListeners();
    } else {
      _otherAmount = "Invalid amount";
      notifyListeners();
    }
  }

  var _receiptNo;
  get receiptNo => _receiptNo;

  void receiptNoValidation(String? receiptNo) {
    if (receiptNo!.length >0) {
      _receiptNo = null;
      notifyListeners();
    } else {
      _receiptNo = "Invalid receipt";
      notifyListeners();
    }
  }


  //start trip

  TripStatusResponse tripStatusResponse = TripStatusResponse();
  TripStatusDataSource tripStatusDataSource = TripStatusDataSource();
  Future<TripStatusResponse> tripStatus(tripCode, empCode) async {
    setLoading(true);
    var response = await tripStatusDataSource.tripStatusApi(tripCode, empCode, AllStrings.IMEI_NO, AllStrings.TOKEN);
    print(response);
    tripStatusResponse = TripStatusResponse.fromJson(response);
    if(tripStatusResponse.code=="100"){
      setLoading(false);
    }

    return tripStatusResponse;

  }



  checkTripStatus(){
    if(tripStatusResponse.trip![0].statuscode==0){
      return "Start Trip";
    }else {
      return "Stop Trip";
    }
  }

  checkTripStatusChangeIcon(){
    if(tripStatusResponse.trip![0].statuscode==0){
      return ImagesPathStrings.start;
    }else {
      return ImagesPathStrings.stop;
    }
  }

  List<TicketsDetails> ticketsDetailsList =[];
  TripDetailsResponse tripDetailsResponse = TripDetailsResponse();
  TripDetailsDataSource tripDetailsDataSource = TripDetailsDataSource();
  Future<TripDetailsResponse> ticketsDetails(String ticketNumber) async {
    var response = await tripDetailsDataSource.tripDetailsApi(ticketNumber, AllStrings.IMEI_NO, AllStrings.TOKEN);
    print(response);
    tripDetailsResponse = TripDetailsResponse.fromJson(response);
    if(tripDetailsResponse.code=="100"){
      tripDetailsResponse = tripDetailsResponse;
      ticketsDetailsList = tripDetailsResponse.tickets!;
      concatString();
      setLoading(false);
    }

    return tripDetailsResponse;

  }


  String passengername ="";
  concatString(){
    passengername = "";
    for(int i=0;i<ticketsDetailsList.length;i++){
      passengername = passengername+", " + ticketsDetailsList[i].passengername.toString();
    }

    passengername = passengername.substring(1,passengername.length);
  }


  bool _isLoading = true;
  get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

}



