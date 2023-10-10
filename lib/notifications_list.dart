import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/screens/Tabs/notifications_screen_tab.dart';

import 'constants/app_color.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer(
      builder: (context, ref, child) => ListView.builder(
          itemCount: ref.watch(NotificationNotifierProvider).length,
          physics: AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var Taskdate = ref.watch(NotificationNotifierProvider)[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.backgroundcolor,
                    borderRadius: BorderRadius.zero,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        Taskdate.imgname ?? "assets/images/Ellipse 6.png",
                        fit: BoxFit.fill,
                        width: 47,
                        height: 47,
                      ),
                      SizedBox(
                        width: 17,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                           // width: size.width - 170,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: "${Taskdate.Taskname}",
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        height: 1.39,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n ${Taskdate.time}",
                                      style: GoogleFonts.inter(
                                        color: Color(0xFFB7B7B7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.39,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "\n ${Taskdate.jobposition}",
                                      style: GoogleFonts.inter(
                                        color: AppColor.lightyellow,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        height: 1.39,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "\n ${Taskdate.duration}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          height: 2.44,
                                        )),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      //  SizedBox(width: size.width/2,),
                      // Padding(
                      //   padding:  EdgeInsets.only(left: size.width-200-(600)),
                      //   child: Text(Taskdate.duration ?? "" ,
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 8,
                      //         fontFamily: 'Inter',
                      //         fontWeight: FontWeight.w600,
                      //         height: 2.44,
                      //       )
                      //   ),
                      // )
                    ],
                  )),
            );
          }),
    );
  }
}
