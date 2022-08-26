class LoginResponse {
  LoginResponse({
      this.code,
      this.conductor,
      this.msg,});

  LoginResponse.fromJson(dynamic json) {
    code = json['code'];
    if (json['Conductor'] != null) {
      conductor = [];
      json['Conductor'].forEach((v) {
        conductor?.add(Conductor.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<Conductor>? conductor;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (conductor != null) {
      map['Conductor'] = conductor?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

}

class Conductor {
  Conductor({
      this.conductid,
      this.conductmobileno,
      this.conductotp,
      this.tripcode,
      this.tripdate,
      this.depttime,
      this.arrtime,});

  Conductor.fromJson(dynamic json) {
    conductid = json['CONDUCTID'];
    conductmobileno = json['CONDUCTMOBILENO'];
    conductotp = json['CONDUCTOTP'];
    tripcode = json['TRIPCODE'];
    tripdate = json['TRIPDATE'];
    depttime = json['DEPTTIME'];
    arrtime = json['ARRTIME'];
  }

  String? conductid;
  String? conductmobileno;
  String? conductotp;
  String? tripcode;
  String? tripdate;
  String? depttime;
  String? arrtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['CONDUCTID'] = conductid;
    map['CONDUCTMOBILENO'] = conductmobileno;
    map['CONDUCTOTP'] = conductotp;
    map['TRIPCODE'] = tripcode;
    map['TRIPDATE'] = tripdate;
    map['DEPTTIME'] = depttime;
    map['ARRTIME'] = arrtime;
    return map;
  }

}