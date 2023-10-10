import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/constants/app_svg.dart';
import 'package:iti_flutter_proj/screens/create_account_screen.dart';
import 'package:iti_flutter_proj/screens/Tabs/home_screen_tab.dart';
import 'package:iti_flutter_proj/screens/navigation_bar.dart';
import 'package:iti_flutter_proj/screens/profile_screen.dart';

import '../constants/app_color.dart';
import '../managers/log_manager.dart';
import '../widgets/default_text_field.dart';
import '../widgets/my_app_bar.dart';

class SignInUI extends StatefulWidget {
  const SignInUI({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInUI();
  }
}

class _SignInUI extends State<SignInUI> {
  //static String selectedprice = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //textDirection: TextDirection.rtl,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 37.5),
                  child: Center(child: SvgPicture.asset(AppSvg.sun,width: 91.22,height: 71.38,)),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 49.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.30,
                          fontFamily: 'PilatExtended',
                          fontWeight: FontWeight.w600,
                          height: 0.94,
                        ),

                      ),
                      Text("Task",

                        style: TextStyle(
                          color:AppColor.lightyellow,
                          fontSize: 24.30,
                          fontFamily: 'PilatExtended',
                          fontWeight: FontWeight.w600,
                          height: 0.94,
                        ),

                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Text(
                    'Welcome Back!',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      height: 0.59,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23 , bottom: 16 ,left: 34),
                  child: Text(
                    'Email Address',
                    style: GoogleFonts.inter(
                      color: AppColor.textcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.05,
                    ),
                  ),
                ),
                DefaultTextField(
                  controller: emailController,
                  label: "fazzzil72@gmail.com",
                  icon: AppSvg.usertag,
                  //bottomPadding: 23,

                  // hint: "Enter your age",
                  //type: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //validator: Validator.validateage
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23 , bottom: 16 ,left: 34),
                  child: Text(
                    'Password',
                    style: GoogleFonts.inter(
                      color: AppColor.textcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      height: 1.05,
                    ),
                  ),
                ),
                DefaultTextField(
                  controller: passwordController,
                  label: "***************",
                  icon: AppSvg.lock1,
                  sicon: AppSvg.eyeslash,
                  bottomPadding: 11,
                  // hint: "Enter your age",
                  //type: TextInputType.number,
                  //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //validator: Validator.validateage
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 26, bottom: 38),
                      child: Text(
                        'Forgot Password?',

                        style: GoogleFonts.inter(
                          color: AppColor.textcolor,
                          //textStyle: TextField.materialMisspelledTextStyle,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.18,
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton.icon(
                      label: Text(
                        "Log In",
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.05,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NavigationScreen() ));

                        // Navigator.of(context)
                        //   .pushNamed(RouteConstants.signInPagerouteName);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.lightyellow,
                          fixedSize: Size(size.width - 64, 54),
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius
                                  .zero)), // set the background color
                      icon: SvgPicture.asset("")),
                ),
                SizedBox(height: 37,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Divider(endIndent: 14,indent:26 ,thickness: 0.8 , color: AppColor.textcolor,)),
                    Text(
                      'Or continue with',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: AppColor.textcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.18,
                      ),
                    ),
                    Expanded(child: Divider(indent: 14,endIndent:26 ,thickness: 0.8 , color: AppColor.textcolor,)),
                  ],
                ),
                SizedBox(height: 37,),
                Center(
                  child: ElevatedButton.icon(
                      label: Text(
                        'Google',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.33,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ProfileUI() ));

                        // Navigator.of(context)
                        //   .pushNamed(RouteConstants.signInPagerouteName);

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.backgroundcolor,
                          fixedSize: Size(size.width - 64, 54),
                          shape: ContinuousRectangleBorder(
                            side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius
                                  .zero)), // set the background color
                      icon: SvgPicture.asset(AppSvg.google)),
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: GoogleFonts.inter(
                        color: AppColor.textcolor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.18,
                      ),
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignUpUI() ));

                    }, child: Text(

                      'Sign Up',
                      style: GoogleFonts.inter(
                        color: AppColor.lightyellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.18,
                      ),

                    ))
                  ],
                ),
                SizedBox(height: 165,),

              ],
            )),
      ),
    );
  }
}
