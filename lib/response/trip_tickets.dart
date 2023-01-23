class TripTickets {
  TripTickets({
      this.code, 
      this.tickets, 
      this.msg,});

  TripTickets.fromJson(dynamic json) {
    code = json['code'];
    if (json['Tickets'] != null) {
      tickets = [];
      json['Tickets'].forEach((v) {
        tickets?.add(Tickets.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<Tickets>? tickets;
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

class Tickets {
  Tickets({
      this.ticketno, 
      this.totalfareamt, 
      this.journeydate, 
      this.totalseats, 
      this.ctzmobileno, 
      this.bookedbyuserid, 
      this.seatnumbers, 
      this.boardingstation, 
      this.fromstation, 
      this.tostation,
      this.busNo});

  Tickets.fromJson(dynamic json) {
    ticketno = json['TICKETNO'];
    totalfareamt = json['TOTALFAREAMT'];
    journeydate = json['JOURNEYDATE'];
    totalseats = json['TOTALSEATS'];
    ctzmobileno = json['CTZMOBILENO'];
    bookedbyuserid = json['BOOKEDBYUSERID'];
    seatnumbers = json['SEATNUMBERS'];
    boardingstation = json['BOARDINGSTATION'];
    fromstation = json['FROMSTATION'];
    tostation = json['TOSTATION'];
    busNo = json['BUSNO'];
  }
  String? ticketno;
  int? totalfareamt;
  String? journeydate;
  int? totalseats;
  String? ctzmobileno;
  String? bookedbyuserid;
  String? seatnumbers;
  String? boardingstation;
  String? fromstation;
  String? tostation;
  String? busNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TICKETNO'] = ticketno;
    map['TOTALFAREAMT'] = totalfareamt;
    map['JOURNEYDATE'] = journeydate;
    map['TOTALSEATS'] = totalseats;
    map['CTZMOBILENO'] = ctzmobileno;
    map['BOOKEDBYUSERID'] = bookedbyuserid;
    map['SEATNUMBERS'] = seatnumbers;
    map['BOARDINGSTATION'] = boardingstation;
    map['FROMSTATION'] = fromstation;
    map['TOSTATION'] = tostation;
    map['BUSNO'] = busNo;
    return map;
  }

}