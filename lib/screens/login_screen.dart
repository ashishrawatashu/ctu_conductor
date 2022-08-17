import 'package:ctu_conductor_app/utils/all_strings.dart';
import 'package:ctu_conductor_app/utils/colors_code.dart';
import 'package:ctu_conductor_app/utils/commonMethod.dart';
import 'package:ctu_conductor_app/utils/hex_color.dart';
import 'package:ctu_conductor_app/utils/images_path_string.dart';
import 'package:ctu_conductor_app/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: 200,
                  color: Colors.green,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    ImagesPathStrings.ctulogin,fit: BoxFit.fill,width: MediaQuery.of(context).size.width,
                  height: 150,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 165),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                        topLeft: Radius.circular(25.0),
                      )
                  ),

                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(AllStrings.welcomeBack,
                          style: GoogleFonts.poppins(fontSize: 24,color: HexColor(MyColors.blackColor),fontWeight: FontWeight.w500),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0,bottom: 20),
                        child: Text(AllStrings.loginMsg,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(fontSize: 12,color: HexColor(MyColors.blackColor),fontWeight: FontWeight.w400),),
                      ),
                      loginSection(),
                    ],
                  ),
                )

              ],
            ),
          ),
        ));
  }

  loginSection() {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(ImagesPathStrings.cardCircle,
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(ImagesPathStrings.phoneicon,
                        color: HexColor(MyColors.primaryColor),
                        height: 22,
                        width: 22,),
                    ),
                  ],
                ),
              ),
              Align(
                child: Container(
                  height: 42,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 50,bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor(MyColors.borderGrey)),
                      borderRadius: BorderRadius.all(Radius.circular(150))
                  ),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AllStrings.mobileNo,
                      hintStyle: GoogleFonts.poppins(color: HexColor(MyColors.greyDarkColor),fontSize: 12),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(ImagesPathStrings.cardCircle,
                        height: 60,
                        width: 60,
                        fit: BoxFit.contain,),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(ImagesPathStrings.password,
                        color: HexColor(MyColors.primaryColor),
                        height: 22,
                        width: 22,),
                    ),
                  ],
                ),
              ),
              Align(
                child: Container(
                  height: 42,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 50,bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10,left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor(MyColors.borderGrey)),
                      borderRadius: BorderRadius.all(Radius.circular(150))
                  ),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AllStrings.password,
                      hintStyle: GoogleFonts.poppins(color: HexColor(MyColors.greyDarkColor),fontSize: 12),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        loginButton(),
      ],
    );
  }

  loginButton() {

    return GestureDetector(
      onTap: () async {
        // await loadLoader();
        CommonMethod.showLoadingDialog(context);
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          Navigator.pushNamed(context, MyRoutes.dashBoardScreen);
          CommonMethod.showSnackBar(context, "Login successfully ....");
        });

      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: HexColor(MyColors.primaryColor),
        ),
        child: Center(
          child: Text(
            AllStrings.signIn,
            style: GoogleFonts.poppins(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

}
