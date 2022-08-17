import 'package:ctu_conductor_app/screens/dashboard_screen.dart';
import 'package:ctu_conductor_app/screens/login_screen.dart';
import 'package:ctu_conductor_app/screens/splash_screen.dart';
import 'package:ctu_conductor_app/screens/start_trip_screen.dart';
import 'package:ctu_conductor_app/screens/stop_trip_screen.dart';
import 'package:ctu_conductor_app/screens/trip_chart_screen.dart';
import 'package:ctu_conductor_app/utils/colors_code.dart';
import 'package:ctu_conductor_app/utils/hex_color.dart';
import 'package:ctu_conductor_app/utils/my_routes.dart';
import 'package:ctu_conductor_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return MaterialApp(
            color: HexColor(MyColors.primaryColor),
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColorDark: HexColor(MyColors.primaryColor),
                primaryColor: HexColor(MyColors.primaryColor),
                fontFamily: GoogleFonts
                    .poppins()
                    .fontFamily,
                primaryTextTheme: GoogleFonts.poppinsTextTheme()),
            // initialRoute: isSkipped=="true" ? MyRoutes.homeRoute : MyRoutes.introScreen,
            initialRoute: MyRoutes.splashScreen,
            routes: {
              MyRoutes.splashScreen: (context) => const SplashScreen(),
              MyRoutes.loginScreen: (context) => const LoginScreen(),
              MyRoutes.dashBoardScreen: (context) => const DashBoardScreen(),
              MyRoutes.tripChartScreen: (context) => const TripChartScreen(),
              MyRoutes.startTripScreen: (context) => const StartTripScreen(),
              MyRoutes.stopTripScreen: (context) => const StopTripScreen(),
            }
        );
      });
    });
  }
}
