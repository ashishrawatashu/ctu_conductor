class TripStatusResponse {
  TripStatusResponse({
      this.code, 
      this.trip, 
      this.msg,});

  TripStatusResponse.fromJson(dynamic json) {
    code = json['code'];
    if (json['Trip'] != null) {
      trip = [];
      json['Trip'].forEach((v) {
        trip?.add(Trip.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<Trip>? trip;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (trip != null) {
      map['Trip'] = trip?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

}

class Trip {
  Trip({
      this.statuscode, 
      this.status, 
      this.tripcode, 
      this.conductorempcode, 
      this.openingdatetime, 
      this.plateformeno, 
      this.openingkm, 
      this.closingdatetime, 
      this.amtfare, 
      this.amttoll, 
      this.amtparking, 
      this.amtother, 
      this.cashreceiptno,});

  Trip.fromJson(dynamic json) {
    statuscode = json['STATUSCODE'];
    status = json['STATUS'];
    tripcode = json['TRIPCODE'];
    conductorempcode = json['CONDUCTOREMPCODE'];
    openingdatetime = json['OPENINGDATETIME'];
    plateformeno = json['PLATEFORMENO'];
    openingkm = json['OPENINGKM'];
    closingdatetime = json['CLOSINGDATETIME'];
    amtfare = json['AMT_FARE'];
    amttoll = json['AMT_TOLL'];
    amtparking = json['AMT_PARKING'];
    amtother = json['AMT_OTHER'];
    cashreceiptno = json['CASH_RECEIPT_NO'];
  }
  int? statuscode;
  String? status;
  String? tripcode;
  String? conductorempcode;
  String? openingdatetime;
  String? plateformeno;
  String? openingkm;
  String? closingdatetime;
  dynamic? amtfare;
  dynamic? amttoll;
  dynamic? amtparking;
  dynamic? amtother;
  String? cashreceiptno;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['STATUSCODE'] = statuscode;
    map['STATUS'] = status;
    map['TRIPCODE'] = tripcode;
    map['CONDUCTOREMPCODE'] = conductorempcode;
    map['OPENINGDATETIME'] = openingdatetime;
    map['PLATEFORMENO'] = plateformeno;
    map['OPENINGKM'] = openingkm;
    map['CLOSINGDATETIME'] = closingdatetime;
    map['AMT_FARE'] = amtfare;
    map['AMT_TOLL'] = amttoll;
    map['AMT_PARKING'] = amtparking;
    map['AMT_OTHER'] = amtother;
    map['CASH_RECEIPT_NO'] = cashreceiptno;
    return map;
  }

}