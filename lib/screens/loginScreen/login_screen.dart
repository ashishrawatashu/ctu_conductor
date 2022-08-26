import 'package:ctu_conductor_app/screens/loginScreen/ctu_conductor_provider.dart';
import 'package:ctu_conductor_app/utils/all_strings.dart';
import 'package:ctu_conductor_app/utils/colors_code.dart';
import 'package:ctu_conductor_app/utils/commonMethod.dart';
import 'package:ctu_conductor_app/utils/hex_color.dart';
import 'package:ctu_conductor_app/utils/images_path_string.dart';
import 'package:ctu_conductor_app/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _loginFormKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Consumer<CtuConductorProvider>(builder: (_, loginProvider, __) {
      return Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: Container(
                                  color: HexColor(MyColors.primaryColor),
                                  child: Image.asset(
                                    ImagesPathStrings.ctulogin,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 25.0,left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/images/starbusNewLogo.png",height: 40,width: 60),
                                      Text(" | ",style: GoogleFonts.nunito(fontSize: 20,color: Colors.white,),),
                                      Text("ORBMS",style: GoogleFonts.nunito(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Text("CTU Parichalak",style: GoogleFonts.nunito(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white),
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text(
                                AllStrings.welcomeBack,
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: HexColor(MyColors.blackColor),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0, bottom: 20),
                              child: Text(
                                AllStrings.loginMsg,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: HexColor(MyColors.blackColor),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Column(
                              children: [
                               loginForm(loginProvider),
                               loginButton(loginProvider)
                              ],
                            )
                            // loginSection(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                )
              ],
            ),
          ),
        ),
      );
    });
  }


  loginButton(CtuConductorProvider loginProvider) {
    return GestureDetector(
      // onTap: () => BlocProvider.of<LoginScreenBloc>(context).add(LoginApiEvent()),
      onTap: () async {
        loginConductor(loginProvider);
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: HexColor(MyColors.primaryColor),
        ),
        child: Center(
          child: Text(
            AllStrings.signIn,
            style: GoogleFonts.poppins(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  loginForm(CtuConductorProvider loginProvider) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImagesPathStrings.cardCircle,
                          height: 80,
                          width: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImagesPathStrings.phoneicon,
                          color:
                          HexColor(MyColors.primaryColor),
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  padding:
                  EdgeInsets.only(left: 70, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10, left: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:
                          HexColor(MyColors.borderGrey)),
                      borderRadius: BorderRadius.all(
                          Radius.circular(150))),
                  child: TextFormField(
                    controller: _phoneNumberController,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]')),
                    ],
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AllStrings.mobileNo,
                      hintStyle: GoogleFonts.poppins(
                          color: HexColor(
                              MyColors.greyDarkColor),
                          fontSize: 12),
                    ),
                    validator: (value) {
                      loginProvider.phoneNumberValidation(value);
                      return loginProvider.userPhoneNumber;
                    },
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
                  height: 80,
                  width: 80,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImagesPathStrings.cardCircle,
                          height: 80,
                          width: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          ImagesPathStrings.password,
                          color:
                          HexColor(MyColors.primaryColor),
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  child: Container(
                    height: 60,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 70, bottom: 5),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color:
                            HexColor(MyColors.borderGrey)),
                        borderRadius: BorderRadius.all(
                            Radius.circular(150))),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: AllStrings.password,
                        hintStyle: GoogleFonts.poppins(
                            color: HexColor(
                                MyColors.greyDarkColor),
                            fontSize: 12),
                      ),
                      validator: (value) {
                        loginProvider.passwordValidation(value);
                        return loginProvider.password;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loginConductor(CtuConductorProvider loginProvider)async  {
    if (await CommonMethod.getInternetUsingInternetConnectivity()) {
      if (_loginFormKey.currentState!.validate()) {
        loginProvider.setLoading(true);
        CommonMethod.showLoadingDialog(context);
        await loginProvider.loginConductor(_phoneNumberController.text.toString().trim(), _passwordController.text.toString().trim());
        if (loginProvider.loginResponse.code == "100") {
          await loginProvider.getTripTickets();
          await loginProvider.tripStatus(loginProvider.conductor![0].tripcode.toString(), loginProvider.conductor![0].conductid.toString());
          Navigator.pop(context);
          if(loginProvider.tripTickets.code=="100"){
            _passwordController.clear();
            _phoneNumberController.clear();
            Navigator.pushNamed(context, MyRoutes.dashBoardScreen);

          }else {
            CommonMethod.showSnackBar(context, "Something went wrong !");
          }
        } else {
          Navigator.pop(context);
          CommonMethod.showSnackBar(context, "Invalid User !");
        }
      }
    }else {
      CommonMethod.showNoInternetDialog(context);
    }
  }
}
