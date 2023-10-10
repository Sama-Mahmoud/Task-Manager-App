import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/constants/app_color.dart';
import 'package:iti_flutter_proj/screens/tasks_list_screen.dart';
import 'package:iti_flutter_proj/widgets/my_home_card.dart';

import '../../constants/app_svg.dart';
import '../../models/tasks.dart';
import '../../widgets/circle_profile_avatar.dart';
import '../../widgets/default_text_field.dart';
import '../../widgets/overlaping_avatar.dart';

List<String> name = List.generate(5, (index) => Faker().company.name());
List<String> date = List.generate(
    5, (index) => "${Random().nextInt(30)} ${Faker().date.month()}");

class HomeTabUi extends StatelessWidget {
  const HomeTabUi({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(top: 28, left: 0, right: 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome Back!",
                                  style: TextStyle(
                                      color: AppColor.lightyellow,
                                      fontSize: 12),
                                ),
                                Text(
                                  "Fazil Laghari",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w600,
                                    height: 1.23,
                                  ),
                                ),
                              ]),
                        ),
                        CircleProfileAvatar()
                      ],
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                              child: DefaultTextField(
                            //hint: "Search tasks",
                            labelcolor: AppColor.textcolor,
                            icon: AppSvg.searchnormal1,
                            label: "Search tasks",
                            // prefixIcon???
                            bottomPadding: 0,
                          )),
                          // const SizedBox(
                          //   width: 16,
                          // ),
                          Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: const BoxDecoration(
                              color: AppColor.lightyellow,
                            ),
                            child:  Icon(Icons.tune),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 34),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Completed Tasks',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              height: 1.38,
                            ),
                          ),
                          Text(
                            'See all',
                            style: GoogleFonts.inter(
                              color: AppColor.lightyellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.72,
                            ),
                          )
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 13,
                    // ),

                    //const OverlappingCircles(),
                    // const SizedBox(
                    //   height: 36,
                    // ),
                    //Expanded(child: TasksList()),
                  ],
                ),
              )),
              SizedBox(
                height: 250,
                child: TasksList(),
              ),
              SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34, right: 22, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ongoing Projects',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        height: 1.38,
                      ),
                    ),
                    Text(
                      'See all',
                      style: GoogleFonts.inter(
                        color: AppColor.lightyellow,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.72,
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                  child: ListView.builder(
                      itemCount: 4,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 15),
                        child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.fieldscolor,
                              borderRadius: BorderRadius.zero,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,top: 9),
                                  child: Text(
                                    "${name[index]}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontFamily: 'PilatExtended',
                                      fontWeight: FontWeight.w600,
                                      height: 1.21,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(children: [
                                        Text(
                                          'Team members',
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            height: 1.18,
                                          ),
                                        ),
                                        OverlappingCircles(),
                                        SizedBox(height: 13,),
                                        Row(children: [
                                          Text(
                                            'Due on :',
                                            style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              height: 1.18,
                                            ),
                                          ),
                                          Text("${date[index]}",
                                            style: GoogleFonts.inter(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              height: 1.18,
                                            ),
                                          )

                                        ],),
                                        SizedBox(height: 10,),
                                      ]),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 16.0),
                                        child: SvgPicture.asset(AppSvg.loading),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
