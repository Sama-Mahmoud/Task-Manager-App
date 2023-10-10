import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/constants/app_svg.dart';
import 'package:iti_flutter_proj/screens/signin_screen.dart';

import '../constants/app_color.dart';
import '../constants/route_constants.dart';
import '../managers/log_manager.dart';
import '../widgets/my_app_bar.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashUI();
  }
}

class _SplashUI extends State<SplashUI> {
  //static String selectedprice = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 23,left: 40),
              child: SvgPicture.asset("assets/icons/sun.svg",),
            ),

            //SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.only(left: 26 , bottom: 37),
              child: Row(
                children: [
                  Text("Day",

                   style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.26,
                      fontFamily: 'PilatExtended',
                      fontWeight: FontWeight.w600,
                      height: 0.94,
                    ),

                  ),
                  Text("Task",

                    style: TextStyle(
                      color:AppColor.lightyellow,
                      fontSize: 16.26,
                      fontFamily: 'PilatExtended',
                      fontWeight: FontWeight.w600,
                      height: 0.94,
                    ),

                  )
                ],
              ),
            ),
            Center(
              child: SizedBox(
                  width: size.width*0.92,
                  //height: size.height*0.35,
                child: Image.asset(AppSvg.man,fit:BoxFit.fill ,),
              ),
            ),
            SizedBox(height: 57,),
            Padding(
              padding: EdgeInsets.only(left:8),
              child: Center(
                child: Text('Manage\nyour\nTask with',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontFamily: 'PilatExtended',
                    fontWeight: FontWeight.w600,
                    height: 0.98,
                  ),
                  ),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8),
              child: Center(
                child: Text('DayTask',
                  style: TextStyle(
                    color: AppColor.lightyellow,
                    fontSize: 55,
                    fontFamily: 'PilatExtended',
                    fontWeight: FontWeight.w600,
                    height: 0.98,
                  ),
                ),
              ),
            ),
            SizedBox(height: 64,),
            Center(
              child: ElevatedButton.icon(
                  label: Text(
                    "Let’s Start",
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.05,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SignInUI() ));

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
            SizedBox(height: 64,),

          ],
        )),
      ),
    );
  }
}
