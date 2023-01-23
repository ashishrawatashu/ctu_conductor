class HelpDeskResponse {
  HelpDeskResponse({
      this.code, 
      this.helpdesk, 
      this.msg,});

  HelpDeskResponse.fromJson(dynamic json) {
    code = json['code'];
    if (json['Helpdesk'] != null) {
      helpdesk = [];
      json['Helpdesk'].forEach((v) {
        helpdesk?.add(Helpdesk.fromJson(v));
      });
    }
    msg = json['msg'];
  }
  String? code;
  List<Helpdesk>? helpdesk;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    if (helpdesk != null) {
      map['Helpdesk'] = helpdesk?.map((v) => v.toJson()).toList();
    }
    map['msg'] = msg;
    return map;
  }

}

class Helpdesk {
  Helpdesk({
      this.mobileNo, 
      this.emailId,});

  Helpdesk.fromJson(dynamic json) {
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
  }
  String? mobileNo;
  String? emailId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobileNo'] = mobileNo;
    map['emailId'] = emailId;
    return map;
  }

}