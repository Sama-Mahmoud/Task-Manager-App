import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/constants/app_color.dart';
import 'package:iti_flutter_proj/models/task_of_day.dart';
import 'package:iti_flutter_proj/notifications_list.dart';
import 'package:iti_flutter_proj/screens/tasks_list_screen.dart';
import 'package:iti_flutter_proj/services/helpers.dart';
import 'package:iti_flutter_proj/widgets/my_home_card.dart';

import '../../constants/app_svg.dart';
import '../../models/button_chosen.dart';
import '../../models/day_calendar.dart';
import '../../models/tasks.dart';
import '../../widgets/circle_profile_avatar.dart';
import '../../widgets/default_text_field.dart';
import '../../widgets/overlaping_avatar.dart';




final NotificationNotifierProvider = StateNotifierProvider<NotificationProvider, List<TaskDay>>((ref) {
  return NotificationProvider();
});
List<String> sentances = ["left a comment in task","marked the task"];
class NotificationProvider extends StateNotifier<List<TaskDay>> {
  NotificationProvider()
      : super(List.generate(
      11,
          (index) => TaskDay(
          isSelected: false,
          id: index,
          imgname: "assets/images/Ellipse ${Random().nextInt(10)+1}.png",
          Taskname: Faker().person.name(),
          time: "${sentances[Random().nextInt(2)]}",
          jobposition: "${Faker().job.title()}",
          duration: "${Faker().date.justTime()}"
      )));
}




class NotificationTabUi extends StatelessWidget {
  const NotificationTabUi({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar:AppBar(
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.only(left: 41, top: 39),
          child: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: Icon(Icons.arrow_back)),
        ),
        //APPcolor
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 39),
          child: Text(
            "Notifications",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              //fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              height: 1.38,
            ),
          ),
        ),
      ), //app bar elavation 0 , transparent
      backgroundColor: AppColor.backgroundcolor,
      body: Consumer(builder: (context, ref, child) {

        return Container(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 44 ,top: 33),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      'New',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.38,
                      ),
                    ),
                    SizedBox(height: 20,),

                    Consumer( builder:(BuildContext context, WidgetRef ref, Widget? child) =>
                        Container(
                          height: size.height/2-70,
                          child: Flexible(
                              child: NotificationsList(),

                          ),
                        ),

                    ),
                    SizedBox(height: 36,),
                    Text(
                      'Earlier',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.38,
                      ),
                    ),
                    SizedBox(height: 20,),

                    Consumer( builder:(BuildContext context, WidgetRef ref, Widget? child) =>
                        Flexible(
                          child: NotificationsList(),

                        ),

                    ),

                    SizedBox(height: 179,)
                  ],
                ),
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
