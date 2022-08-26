import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'colors_code.dart';
import 'hex_color.dart';

class CommonMethod{

  static showLoadingDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (_, __, ___) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                // Dialog background
                width: 50, // Dialog width
                height: 50, // Dialog height
                child: CircularProgressIndicator(
                  color: HexColor(MyColors.primaryColor),
                )),
          ),
        );
      },
    );
  }

  static showSnackBar(BuildContext context, String msg) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: GoogleFonts.nunito(fontSize: 16),
      ),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  static Future<bool> getInternetUsingInternetConnectivity() async {
    bool result = await InternetConnectionChecker().hasConnection;
    print("CHECK----"+result.toString());
    return result;
  }


  static showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("No internet"),
        content: Text("Please connet your device with internet"),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

}