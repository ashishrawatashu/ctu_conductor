class TripStartStopResponse {
  TripStartStopResponse({
      this.code, 
      this.trip, 
      this.msg,});

  TripStartStopResponse.fromJson(dynamic json) {
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
      this.status,});

  Trip.fromJson(dynamic json) {
    status = json['STATUS'];
  }
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['STATUS'] = status;
    return map;
  }

}