import 'dart:io';
import 'package:ctu_conductor_app/screens/loginScreen/ctu_conductor_provider.dart';
import 'package:ctu_conductor_app/utils/all_strings.dart';
import 'package:ctu_conductor_app/utils/colors_code.dart';
import 'package:ctu_conductor_app/utils/commonMethod.dart';
import 'package:ctu_conductor_app/utils/hex_color.dart';
import 'package:ctu_conductor_app/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();

}

class _DashBoardScreenState extends State<DashBoardScreen> {

  var _startTripFormKey = GlobalKey<FormState>();
  TextEditingController _platformNoController = TextEditingController();
  TextEditingController _kmDrivenController = TextEditingController();

  var _stopTripFormKey = GlobalKey<FormState>();
  TextEditingController _totalAmountNoController = TextEditingController();
  TextEditingController _totalTollController = TextEditingController();
  TextEditingController _parkingAmountController = TextEditingController();
  TextEditingController _otherAmountController = TextEditingController();
  TextEditingController _reciptNoController = TextEditingController();
  TextEditingController _kmCloseingDrivenController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    Future<bool> onWillPop() async {
        return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want exit from app ? '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        ));
    }

    return Consumer<CtuConductorProvider>(builder: (_, ctuConductorProvider, __) {
      return WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor(MyColors.primaryColor),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/images/starbusNewLogo.png",height: 40,width: 60),
                Text(" | ",style: GoogleFonts.nunito(fontSize: 20,color: Colors.white,),),
                Text("ORBMS ",style: GoogleFonts.nunito(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                Text(" CTU Parichalak",style: GoogleFonts.nunito(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),

              ],
            ),
            actions: [
              PopupMenuButton(
                // add icon, by default "3 dot" icon
                // icon: Icon(Icons.book)
                  itemBuilder: (context){
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("Exit"),
                      ),
                    ];
                  },
                  onSelected:(value){
                    if(value == 0){
                     onWillPop();
                    }
                  }
              ),
            ],
          ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.only(top: 20),
                            child: Center(
                              child: Text("Trip Details",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: HexColor(MyColors.blackColor),
                                      fontWeight: FontWeight.bold)),
                            ),),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0,left: 15),
                                      child: Text(
                                        "Trip Code",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: HexColor(MyColors.blackColor),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0,left: 15),
                                      child: Text(
                                       " .tripcode.toString()",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: HexColor(MyColors.blackColor),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(right: 15,),
                                        child: Text(
                                          "Trip Date",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: HexColor(MyColors.blackColor)),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 15,
                                        ),
                                        child: Text(
                                          ".tripdate.toString()",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: HexColor(MyColors.blackColor),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15, right: 15,top: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                   Text(
                                    "Depart from",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: HexColor(MyColors.blackColor),
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Text(
                                      "ctuConductorProvider.ticketsList[0].fromstation.toString()",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: HexColor(MyColors.blackColor),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 15,),
                                          child: Text(
                                            "Depart Time",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: HexColor(MyColors.blackColor)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            left: 15,
                                          ),
                                          child: Text(
                                            ".depttime.toString()",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: HexColor(MyColors.blackColor),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15,top: 18),
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Arrival at",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: HexColor(
                                                MyColors.blackColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 3.0),
                                          child: Text(
                                            "ctuConductorProvider.ticketsList[0].tostation.toString()",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: HexColor(
                                                    MyColors.blackColor),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 15,),
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: HexColor(MyColors.blackColor)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 15,
                                            ),
                                            child: Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: HexColor(MyColors.blackColor),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 15,top: 18),
                              child: Row(
                                children: [
                                  Text(
                                    "Total Tickets :  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                        HexColor(MyColors.blackColor)),
                                  ),
                                  Text(
                                    "ctuConductorProvider.ticketsList.length.toString()",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(MyColors.blackColor)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15,top: 18),
                              child: Row(
                                children: [
                                  Text(
                                    "Bus No :  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                        HexColor(MyColors.blackColor)),
                                  ),
                                  Text(
                                    "ctuConductorProvider.ticketsList[0].busNo.toString()",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(MyColors.blackColor)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15,top: 18),
                              child: Row(
                                children: [
                                  Text(
                                    "Trip Status :  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                        HexColor(MyColors.blackColor)),
                                  ),
                                  Text(
                                   " ctuConductorProvider.tripStatusResponse.trip![0].status.toString()",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor(MyColors.blackColor)),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.tripChartScreen);
                              },
                              child: Container(
                                margin:
                                    EdgeInsets.only(top: 30, left: 15, right: 15),
                                height: 60,
                                // height : 90,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    // color: Colors.white,
                                  color: HexColor(MyColors.primaryColor),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(1.0,
                                            1.0), // shadow direction: bottom right
                                      )
                                    ]),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 0.0, left: 20),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "View Trip Chart",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white
                                              // color: HexColor(MyColors.blackColor)
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                            padding: EdgeInsets.only(right: 20),
                                            alignment: Alignment.centerRight,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                    Icons.arrow_forward_ios_outlined,color: Colors.white,),
                                                Icon(
                                                  Icons.arrow_forward_ios_outlined,color: Colors.white,),
                                              ],
                                            )))
                                  ],
                                ),
                              ),
                            ),
                            // Visibility(
                            //   visible: ctuConductorProvider.tripStatusResponse.trip![0].statuscode==2?false:true,
                            //   child: InkWell(
                            //     onTap: () {
                            //       checkTripStatus(ctuConductorProvider);
                            //     },
                            //     child: Container(
                            //       margin:
                            //           EdgeInsets.only(top: 30, left: 15, right: 15,bottom: 20),
                            //       // height: 90,
                            //       height: 60,
                            //       width: MediaQuery.of(context).size.width,
                            //       decoration: BoxDecoration(
                            //           // color: Colors.white,
                            //         color: HexColor(MyColors.primaryColor),
                            //           borderRadius: BorderRadius.all(
                            //             Radius.circular(10.0),
                            //           ),
                            //           boxShadow: [
                            //             BoxShadow(
                            //               color: Colors.grey,
                            //               blurRadius: 2.0,
                            //               spreadRadius: 0.0,
                            //               offset: Offset(1.0,
                            //                   1.0), // shadow direction: bottom right
                            //             )
                            //           ]),
                            //       child: Row(
                            //         children: [
                            //           Padding(
                            //             padding: const EdgeInsets.only(
                            //                 top: 18.0, left: 20),
                            //             child: Column(
                            //               crossAxisAlignment:
                            //                   CrossAxisAlignment.start,
                            //               children: [
                            //                 Text(
                            //                   ctuConductorProvider.checkTripStatus(),
                            //                   style: TextStyle(
                            //                       fontSize: 18,
                            //                       color: Colors.white),
                            //                 ),
                            //               ],
                            //             ),
                            //           ),
                            //           Expanded(
                            //               child: Container(
                            //                   padding: EdgeInsets.only(right: 20),
                            //                   alignment: Alignment.centerRight,
                            //                   child: Row(
                            //                     mainAxisAlignment: MainAxisAlignment.end,
                            //                     children: [
                            //                       Icon(
                            //                         Icons.arrow_forward_ios_outlined,color: Colors.white,),
                            //                       Icon(
                            //                         Icons.arrow_forward_ios_outlined,color: Colors.white,),
                            //                     ],
                            //                   )))
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      )),
                  // Expanded(
                  //   flex: 2,
                  //   child: Container(
                  //     // color: Colors.red,
                  //     alignment: Alignment.bottomCenter,
                  //     child: Stack(
                  //       children: [
                  //         Container(
                  //           width: MediaQuery.of(context).size.width,
                  //           child: Visibility(
                  //             visible: ctuConductorProvider.chekHelpDeskCondition(),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 Text(
                  //                   "For any Help/Query",
                  //                   style: TextStyle(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: HexColor(MyColors.primaryColor)),
                  //                 ),
                  //                 Visibility(
                  //                   visible: ctuConductorProvider.chekHelpDeskMobileCondition(),
                  //                   child: GestureDetector(
                  //                     onTap: (){
                  //                       launchCaller(ctuConductorProvider.helpDeskResponse.helpdesk![0].mobileNo.toString());
                  //                     },
                  //                     child: Text(
                  //                       "Contact us at "+ctuConductorProvider.helpDeskResponse.helpdesk![0].mobileNo.toString(),
                  //                       style: TextStyle(
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.bold,
                  //                           color: HexColor(MyColors.primaryColor)),
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 Visibility(
                  //                   visible: ctuConductorProvider.chekHelpDeskEmailCondition(),
                  //                   child: Text(
                  //                     "Email at "+ctuConductorProvider.helpDeskResponse.helpdesk![0].emailId.toString(),
                  //                     style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: HexColor(MyColors.primaryColor)),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Align(
                  //               alignment: Alignment.bottomLeft,
                  //               child: Container(
                  //                   child: Card(child: Image.asset("assets/images/govsLogos.png",height: 45,width: 120,fit: BoxFit.fill,))),
                  //             ),
                  //             Align(
                  //               alignment: Alignment.bottomRight,
                  //               child: Container(
                  //                   child: Image.asset("assets/images/nicNewLogo.png",height: 45,width: 120,fit: BoxFit.fill,)),
                  //             )
                  //           ],
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )),
      );
    });

  }

  startTripBottomSheet(CtuConductorProvider ctuConductorProvider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).viewInsets,
          margin: EdgeInsets.only(top: 18, bottom: 15, left: 30, right: 30),
          child: Form(
            key: _startTripFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Current Odometer Reading (KM)"),
                  TextFormField(
                      controller: _kmDrivenController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor(MyColors.primaryColor),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(8),
                      ],
                      decoration: InputDecoration(
                        hintText: "Current Odometer Reading",
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        ctuConductorProvider.kmDrivenValidation(value);
                        return ctuConductorProvider.kmDriven;
                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(" Bus arrived at Platform No/Station )"),
                  TextFormField(
                    controller: _platformNoController,
                    autofocus: true,
                    cursorColor: HexColor(MyColors.primaryColor),
                    keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z ]')),
                        LengthLimitingTextInputFormatter(20),
                      ],
                    decoration: InputDecoration(
                      hintText: "Platform No/Station ",
                      hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                    ),
                      validator: (value) {
                        ctuConductorProvider.platformNoValidation(value);
                        return ctuConductorProvider.platformNo;
                      }
                  ),
                  GestureDetector(
                    onTap: () {
                      // startTrip(ctuConductorProvider);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: HexColor(MyColors.primaryColor),
                      ),
                      child: Center(
                        child: Text(
                          AllStrings.startTrip,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  stopTripBottomSheet(CtuConductorProvider ctuConductorProvider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (BuildContext context) {
        return Container(
          padding: MediaQuery.of(context).viewInsets,
          margin: EdgeInsets.only(top: 18, bottom: 15, left: 30, right: 30),
          child: Form(
            key: _stopTripFormKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("1. Current Odometer Reading (KM)"),
                  TextFormField(
                      controller: _kmCloseingDrivenController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor(MyColors.primaryColor),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(8),
                      ],
                      decoration: InputDecoration(
                        hintText: "Current Odometer Reading",
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        ctuConductorProvider.kmDrivenValidation(value);
                        return ctuConductorProvider.kmDriven;
                      }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("2. Amount collected (In Rs)"),
                  TextFormField(
                      controller: _totalAmountNoController,
                      autofocus: true,
                      cursorColor: HexColor(MyColors.primaryColor),
                      keyboardType: TextInputType.text,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        LengthLimitingTextInputFormatter(5),
                      ],
                      decoration: InputDecoration(
                        hintText: "Total amount",
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        ctuConductorProvider.totalAmountValidation(value);
                        return ctuConductorProvider.totalAmount;
                      }
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,bottom:8),
                    child: Text("3. Expenses (In Rs)"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Toll"),
                  TextFormField(
                      controller: _totalTollController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor(MyColors.primaryColor),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        LengthLimitingTextInputFormatter(5),
                      ],
                      decoration: InputDecoration(
                        hintText: "Toll",
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        ctuConductorProvider.totalTollValidation(value);
                        return ctuConductorProvider.totalToll;
                      }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Parking "),
                  TextFormField(
                      controller: _parkingAmountController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor(MyColors.primaryColor),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        LengthLimitingTextInputFormatter(5),
                      ],
                      decoration: InputDecoration(
                        hintText: "Parking",
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        ctuConductorProvider.totalAmountParkingValidation(value);
                        return ctuConductorProvider.totalAmountParking;
                      }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Other"),
                  TextFormField(
                      controller: _otherAmountController,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      cursorColor: HexColor(MyColors.primaryColor),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                        LengthLimitingTextInputFormatter(5),
                      ],
                      decoration: InputDecoration(
                        hintText: "Other",
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(MyColors.lightGrey),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        ctuConductorProvider.otherAmountValidation(value);
                        return ctuConductorProvider.otherAmount;
                      }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // stopTrip(ctuConductorProvider);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 18),
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: HexColor(MyColors.primaryColor),
                      ),
                      child: Center(
                        child: Text(
                          AllStrings.stopTrip,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // void startTrip(CtuConductorProvider ctuConductorProvider) async{
  //   if (await CommonMethod.getInternetUsingInternetConnectivity()) {
  //     if (_startTripFormKey.currentState!.validate()) {
  //       Navigator.pop(context);
  //       CommonMethod.showLoadingDialog(context);
  //       await ctuConductorProvider.startTrip(.tripcode, .conductid, _platformNoController.text.toString().trim(), _kmDrivenController.text.toString().trim());
  //       Navigator.pop(context);
  //       if (ctuConductorProvider.tripStartResponse.code=="100"){
  //         CommonMethod.showSnackBar(context, "Trip is started");
  //         _kmDrivenController.clear();
  //         _platformNoController.clear();
  //         await ctuConductorProvider.tripStatus(.tripcode, .conductid);
  //       }else {
  //         CommonMethod.showSnackBar(context, "Please try again !");
  //       }
  //     }
  //   }else {
  //     CommonMethod.showNoInternetDialog(context);
  //   }
  // }
  //
  // void stopTrip(CtuConductorProvider ctuConductorProvider) async{
  //   if (await CommonMethod.getInternetUsingInternetConnectivity()) {
  //     if (_stopTripFormKey.currentState!.validate()) {
  //       Navigator.pop(context);
  //       CommonMethod.showLoadingDialog(context);
  //       await ctuConductorProvider.stopTrip(.tripcode.toString(),
  //       .conductid.toString(),
  //           _kmCloseingDrivenController.text.toString(),
  //       _totalAmountNoController.text.toString(),
  //       _totalTollController.text.toString(),
  //       _parkingAmountController.text.toString(),
  //       _otherAmountController.text.toString(),
  //       " ");
  //       Navigator.pop(context);
  //       if (ctuConductorProvider.tripStopResponse.code=="100"){
  //         CommonMethod.showSnackBar(context, "Trip is stopped");
  //         _kmCloseingDrivenController.clear();
  //         _totalAmountNoController.clear();
  //         _totalTollController.clear();
  //         _parkingAmountController.clear();
  //         _otherAmountController.clear();
  //         _reciptNoController.clear();
  //         await ctuConductorProvider.tripStatus(.tripcode, .conductid);
  //       }else {
  //         CommonMethod.showSnackBar(context, "Please try again !");
  //       }
  //     }
  //   }else {
  //     CommonMethod.showNoInternetDialog(context);
  //   }
  // }
  //
  // void checkTripStatus(CtuConductorProvider ctuConductorProvider) async {
  //   if (await CommonMethod.getInternetUsingInternetConnectivity()) {
  //     CommonMethod.showLoadingDialog(context);
  //     await ctuConductorProvider.tripStatus(.tripcode.toString(), .conductid.toString());
  //     Navigator.pop(context);
  //     if(ctuConductorProvider.tripStatusResponse.code=="100"){
  //       if(ctuConductorProvider.tripStatusResponse.trip![0].statuscode==0){
  //         startTripBottomSheet(ctuConductorProvider);
  //       }else  if(ctuConductorProvider.tripStatusResponse.trip![0].statuscode==1){
  //         // startTripBottomSheet(ctuConductorProvider);
  //         stopTripBottomSheet(ctuConductorProvider);
  //       }else {
  //         CommonMethod.showSnackBar(context, "Trip has closed !");
  //       }
  //     }else {
  //       CommonMethod.showSnackBar(context, "Something went wrong !");
  //     }
  //   }else {
  //     CommonMethod.showNoInternetDialog(context);
  //   }
  // }

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
