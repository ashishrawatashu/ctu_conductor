class TripDetailsResponse {
  TripDetailsResponse({
      this.code, 
      this.tickets, 
      this.msg,});

  TripDetailsResponse.fromJson(dynamic json) {
    code = json['code'];
    if (json['Tickets'] != null) {
      tickets = [];
      json['Tickets'].forEach((v) {
        tickets?.add(TicketsDetails.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<TicketsDetails>? tickets;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (tickets != null) {
      map['Tickets'] = tickets?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

}

class TicketsDetails {
  TicketsDetails({
      this.ticketno, 
      this.journeydate, 
      this.totalfare, 
      this.busservicetype, 
      this.source, 
      this.destination, 
      this.departuretime, 
      this.totopassengers, 
      this.totaldistance, 
      this.seatno, 
      this.passengername, 
      this.gender, 
      this.age, 
      this.ticketstatus,});

  TicketsDetails.fromJson(dynamic json) {
    ticketno = json['TICKETNO'];
    journeydate = json['JOURNEYDATE'];
    totalfare = json['TOTALFARE'];
    busservicetype = json['BUSSERVICETYPE'];
    source = json['SOURCE'];
    destination = json['DESTINATION'];
    departuretime = json['DEPARTURETIME'];
    totopassengers = json['TOTOPASSENGERS'];
    totaldistance = json['TOTALDISTANCE'];
    seatno = json['SEATNO'];
    passengername = json['PASSENGERNAME'];
    gender = json['GENDER'];
    age = json['AGE'];
    ticketstatus = json['TICKETSTATUS'];
  }
  String? ticketno;
  String? journeydate;
  int? totalfare;
  String? busservicetype;
  String? source;
  String? destination;
  String? departuretime;
  String? totopassengers;
  int? totaldistance;
  String? seatno;
  String? passengername;
  String? gender;
  int? age;
  String? ticketstatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TICKETNO'] = ticketno;
    map['JOURNEYDATE'] = journeydate;
    map['TOTALFARE'] = totalfare;
    map['BUSSERVICETYPE'] = busservicetype;
    map['SOURCE'] = source;
    map['DESTINATION'] = destination;
    map['DEPARTURETIME'] = departuretime;
    map['TOTOPASSENGERS'] = totopassengers;
    map['TOTALDISTANCE'] = totaldistance;
    map['SEATNO'] = seatno;
    map['PASSENGERNAME'] = passengername;
    map['GENDER'] = gender;
    map['AGE'] = age;
    map['TICKETSTATUS'] = ticketstatus;
    return map;
  }

}