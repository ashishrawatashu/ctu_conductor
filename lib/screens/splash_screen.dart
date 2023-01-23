import 'package:ctu_conductor_app/utils/colors_code.dart';
import 'package:ctu_conductor_app/utils/hex_color.dart';
import 'package:ctu_conductor_app/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, MyRoutes.loginScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: splashBody(),
    );
  }

  Widget splashBody(){
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor(MyColors.primaryColor),
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                    color: HexColor(MyColors.primaryColor),
                    child: Image.asset("assets/images/ctubg.png",fit: BoxFit.fill,),
                  )),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/starbusNewLogo.png",height: 80,width: 120),
                          Text("|",style: GoogleFonts.nunito(fontSize: 50,color: Colors.white,),),
                          Text("ORBMS",style: GoogleFonts.nunito(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Text("Parichalak",style: GoogleFonts.oleoScript(fontSize: 50,color: Colors.white),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Chandighar Transport Undertaking",textAlign:TextAlign.center,style: GoogleFonts.nunito(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                    child: Card(child: Image.asset("assets/images/govsLogos.png",height: 45,width: 120,fit: BoxFit.fill,))),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    child: Image.asset("assets/images/nicNewLogo.png",height: 45,width: 120,fit: BoxFit.fill,)),
              )
            ],
          ),
        ));
  }

}
