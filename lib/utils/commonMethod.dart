import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_code.dart';
import 'hex_color.dart';

class CommonMethod{

  static showLoadingDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
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
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}