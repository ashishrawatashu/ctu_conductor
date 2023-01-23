import 'package:ctu_conductor_app/screens/loginScreen/ctu_conductor_provider.dart';
import 'package:ctu_conductor_app/utils/colors_code.dart';
import 'package:ctu_conductor_app/utils/commonMethod.dart';
import 'package:ctu_conductor_app/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'package:url_launcher/url_launcher.dart';

class TripChartScreen extends StatefulWidget {
  const TripChartScreen({Key? key}) : super(key: key);

  @override
  State<TripChartScreen> createState() => _TripChartScreenState();
}

class _TripChartScreenState extends State<TripChartScreen> {


  @override
  Widget build(BuildContext context) {
    return Consumer<CtuConductorProvider>(builder: (_, ctuConductorProvider, __) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Chart"),
        backgroundColor: HexColor(MyColors.primaryColor),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 5,right: 5),
        child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: ctuConductorProvider.ticketsList.length,
        itemBuilder: (BuildContext context, int index) {
          // return busesListLayout(index);
          return passengersListItems(index,ctuConductorProvider);
        },
      ),
      ));

    });
  }

  passengersListItems(int index, CtuConductorProvider ctuConductorProvider){
    return GestureDetector(
      onTap: ()async {
        getTicketDetails(ctuConductorProvider,index);
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ctuConductorProvider.ticketsList[index].ticketno.toString(),style: TextStyle(fontSize: 15,color: HexColor(MyColors.blackColor),fontWeight: FontWeight.bold),),
                  Text("₹ "+ctuConductorProvider.ticketsList[index].totalfareamt.toString(),style: TextStyle(fontSize: 15,color: HexColor(MyColors.greenColor),fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Text("Boarding Station",style: TextStyle(fontSize: 12,color: HexColor(MyColors.greyDarkColor)),),
                  SizedBox(
                    width: 10,
                  ),
                  Text(ctuConductorProvider.ticketsList[index].boardingstation.toString(),style: TextStyle(fontSize: 12,color: HexColor(MyColors.blackColor),fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Passenger(s)",style: TextStyle(fontSize: 12,color: HexColor(MyColors.greyDarkColor)),),
                          SizedBox(
                            width: 10,
                          ),
                          Text(ctuConductorProvider.ticketsList[index].totalseats.toString(),style: TextStyle(fontSize: 12,color: HexColor(MyColors.blackColor),fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Row(
                        children: [
                          Text("Seat(s)",style: TextStyle(fontSize: 12,color: HexColor(MyColors.primaryColor)),),
                          SizedBox(
                            width: 10,
                          ),
                          Text(ctuConductorProvider.ticketsList[index].seatnumbers.toString(),style: TextStyle(fontSize: 12,color: HexColor(MyColors.blackColor),fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                  Icon(Icons.arrow_drop_down_outlined,color: HexColor(MyColors.primaryColor),size: 35,),
                ],
              )
            ],
          ),
        ),

      ),
    );
  }

  showPassengerDetailsDilaog(CtuConductorProvider ctuConductorProvider, int index){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20)
      )),
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).viewInsets,
          margin: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "PNR: ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor(MyColors.greyDarkColor),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ctuConductorProvider.tripDetailsResponse.tickets![0].ticketno.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor(MyColors.blackColor),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                Row(
                  children: [
                    Text(
                      "Mobile No : ",
                      style: TextStyle(
                          fontSize: 16,
                          color: HexColor(MyColors.blackColor)),
                    ),
                    Expanded(
                      child: Text(
                        ctuConductorProvider.ticketsList[index].ctzmobileno!,
                        style: TextStyle(
                            fontSize: 16,
                            color: HexColor(MyColors.blackColor),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Depart from",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: HexColor(MyColors.greyDarkColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(
                                ctuConductorProvider.tripDetailsResponse.tickets![0].source.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: HexColor(MyColors.blackColor),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                    HexColor(MyColors.borderGrey),
                                    border: Border.all(
                                      color: HexColor(
                                          MyColors.borderGrey),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)))),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                    HexColor(MyColors.borderGrey),
                                    border: Border.all(
                                      color: HexColor(
                                          MyColors.borderGrey),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)))),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                    HexColor(MyColors.borderGrey),
                                    border: Border.all(
                                      color: HexColor(
                                          MyColors.borderGrey),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)))),
                            Image.asset("assets/images/busicon.png"),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                    HexColor(MyColors.borderGrey),
                                    border: Border.all(
                                      color: HexColor(
                                          MyColors.borderGrey),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)))),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                    HexColor(MyColors.borderGrey),
                                    border: Border.all(
                                      color: HexColor(
                                          MyColors.borderGrey),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)))),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 2, right: 2),
                                height: 5,
                                width: 5,
                                decoration: BoxDecoration(
                                    color:
                                    HexColor(MyColors.borderGrey),
                                    border: Border.all(
                                      color: HexColor(
                                          MyColors.borderGrey),
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20)))),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Arrival at",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: HexColor(
                                        MyColors.greyDarkColor),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    ctuConductorProvider.tripDetailsResponse.tickets![0].destination.toString(),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: HexColor(
                                            MyColors.blackColor),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 10),
                            child: Text(
                              "Depart Time",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor(MyColors.blackColor)),
                            ),
                          ),
                          Text(
                            ctuConductorProvider.tripDetailsResponse.tickets![0].departuretime.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor(MyColors.blackColor),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 0, top: 10),
                            child: Text(
                              "Trip Date",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor(MyColors.blackColor)),
                            ),
                          ),
                          Text(
                            ctuConductorProvider.tripDetailsResponse.tickets![0].journeydate.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor(MyColors.blackColor),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 0, top: 10),
                            child: Text(
                              "Total Seats",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor(MyColors.blackColor)),
                            ),
                          ),
                          Text(
                            ctuConductorProvider.tripDetailsResponse.tickets![0].totopassengers.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor(MyColors.blackColor),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 0, top: 10),
                            child: Text(
                              "Total Fare",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: HexColor(MyColors.blackColor)),
                            ),
                          ),
                          Text(
                            "₹ "+ ctuConductorProvider.tripDetailsResponse.tickets![0].totalfare.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor(MyColors.greenColor),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Passengers : ",
                      style: TextStyle(
                          fontSize: 12,
                          color: HexColor(MyColors.blackColor)),
                    ),
                    Expanded(
                      child: Text(
                        ctuConductorProvider.passengername,
                        style: TextStyle(
                            fontSize: 12,
                            color: HexColor(MyColors.blackColor),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                         launchCaller(ctuConductorProvider.ticketsList[index].ctzmobileno.toString());
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20,right: 5),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color:HexColor(MyColors.primaryColor))
                          ),
                          child: Center(
                            child: Text(
                              "Call ",
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: HexColor(MyColors.primaryColor),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20,left: 5),
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: HexColor(MyColors.primaryColor),
                          ),
                          child: Center(
                            child: Text(
                              "OK",
                              style: GoogleFonts.nunito(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  getTicketDetails(CtuConductorProvider ctuConductorProvider, int index) async {
    if (await CommonMethod.getInternetUsingInternetConnectivity()) {
      CommonMethod.showLoadingDialog(context);
      await ctuConductorProvider.ticketsDetails(ctuConductorProvider.ticketsList[index].ticketno.toString());
      Navigator.pop(context);
      if(ctuConductorProvider.tripDetailsResponse.code=="100"){
        showPassengerDetailsDilaog(ctuConductorProvider,index);
      }else {
        CommonMethod.showSnackBar(context, "Something went wrong !");
      }
    }else {
      CommonMethod.showNoInternetDialog(context);
    }

  }

  launchCaller(String mobileNo) async {
    String urlName = "tel:"+mobileNo;
    var url = urlName.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
