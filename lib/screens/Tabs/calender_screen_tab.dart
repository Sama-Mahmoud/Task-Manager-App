import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/constants/app_color.dart';
import 'package:iti_flutter_proj/models/task_of_day.dart';
import 'package:iti_flutter_proj/screens/tasks_list_screen.dart';
import 'package:iti_flutter_proj/services/helpers.dart';
import 'package:iti_flutter_proj/widgets/my_home_card.dart';

import '../../constants/app_svg.dart';
import '../../models/day_calendar.dart';
import '../../models/tasks.dart';
import '../../widgets/circle_profile_avatar.dart';
import '../../widgets/default_text_field.dart';
import '../../widgets/overlaping_avatar.dart';

final sevenDaysCalenderProvider =
    StateNotifierProvider<DayCalenderNotifier, List<DayCalender>>((ref) {
  return DayCalenderNotifier();
});

class DayCalenderNotifier extends StateNotifier<List<DayCalender>> {
  DayCalenderNotifier()
      : super(List.generate(
            7,
            (index) => DayCalender(
                isSelected: false,
                id: index,
                date: DateTime.now().add(Duration(days: index)))));
  void selectThisDay(DayCalender selectedDay) {
    // state = [
    //   for(final day in state)
    //     if (day.id == selectedDay.id)
    //       selectedDay.copyWithToggleSection(!selectedDay.isSelected)
    //
    // ]
    state = [
      for (final day in state)
        if (day.id == selectedDay.id)
          selectedDay.copyWithToggleSection(!selectedDay.isSelected)
        else
          day.copyWithToggleSection(false)
    ];
  }
}

final sevenDaysTasksProvider =
StateNotifierProvider<DayTasksProvider, List<TaskDay>>((ref) {
  return DayTasksProvider();
});

class DayTasksProvider extends StateNotifier<List<TaskDay>> {
  DayTasksProvider()
      : super(List.generate(
      7,
          (index) => TaskDay(
          isSelected: false,
          id: index,
          Taskname: Faker().company.position(),
              time: "${Faker().date.time().split(" ")[0]} - ${Faker().date.time().split(" ")[0]}"
          )));
  void selectTaskday(DayCalender selectedDay , TaskDay selectedTaskDay) {

    state = [
      for (final day in state)
        if (selectedDay.isSelected)
          day.newDayTask(Faker().company.position(), "${Faker().date.time().split(" ")[0]} - ${Faker().date.time().split(" ")[0]}")
        else
          day.copyWithToggleSection(false)
    ];
  }
}


//List<String> name = List.generate(5, (index) => Faker().company.position() );


class CalenderTabUi extends StatelessWidget {
  const CalenderTabUi({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: size.width,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 41, top: 39),
              child: IconButton(
                  onPressed: Navigator.of(context).pop,
                  icon: Icon(Icons.arrow_back)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 39),
              child: Text(
                "Schedule",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  //fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 1.38,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 41, top: 39),
              child: SvgPicture.asset(
                AppSvg.addsquare,
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
        //APPcolor
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
      ), //app bar elavation 0 , transparent
      backgroundColor: AppColor.backgroundcolor,
      body: Container(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 29, bottom: 26, top: 28),
                  child: Text(
                    "${DateTime.now().toShortEnglishDate().split(" ")[0]}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.23,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 29),
                  child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) =>
                            SizedBox(
                      height: 69,
                      child: ListView.separated(
                        itemCount: ref.watch(sevenDaysCalenderProvider).length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // physics:
                        //   const NeverScrollableScrollPhysics(), //can be changed
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: size.width * 0.048,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          var date =
                              ref.watch(sevenDaysCalenderProvider)[index];
                          var Taskdate =
                          ref.watch(sevenDaysTasksProvider)[index];

                          return InkWell(
                            onTap: () {
                              ref
                                  .read(sevenDaysCalenderProvider.notifier)
                                  .selectThisDay(date);
                              ref.invalidate(sevenDaysTasksProvider);
                            },
                            child: Container(
                              width: 45,
                              height: 70,
                              color: date.isSelected
                                  ? AppColor.lightyellow
                                  : AppColor.navigationbackgroundcolor,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(date.date.day.toString(),
                                          style: TextStyle(
                                            color: date.isSelected
                                                ? Colors.black
                                                : Colors.white,
                                            fontSize: 18.82,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w600,
                                            height: 1.19,
                                          )),
                                      Text(
                                        date.date.toABBRWEEKDAY(),
                                        style: GoogleFonts.inter(
                                          color: date.isSelected
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 9.41,
                                          fontWeight: FontWeight.w500,
                                          height: 1.72,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 29, bottom: 26),
                  child: Text(
                    'Today’s Tasks',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      height: 1.38,
                    ),
                  ),
                ),

                Consumer( builder:(BuildContext context, WidgetRef ref, Widget? child) =>
                   Flexible(
                      child: ListView.builder(
                          itemCount: ref.watch(sevenDaysTasksProvider).length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            var Taskdate =
                            ref.watch(sevenDaysTasksProvider)[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 29, vertical: 15),
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.fieldscolor,
                                      borderRadius: BorderRadius.zero,
                                    ),

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 10,
                                          height: 72,
                                          color: AppColor.lightyellow,
                                        ),
                                        SizedBox(
                                          width: 32,
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 13 ,),
                                                  child: SizedBox(
                                                    width: size.width/2,
                                                    child: Text(
                                                      "${Taskdate.Taskname}",
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(

                                                        color: Colors.white,
                                                        fontSize: 18,
                                                        fontFamily: 'Inter',
                                                        fontWeight: FontWeight.w500,
                                                        height: 1.19,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Text(
                                                  "${Taskdate.time}",
                                                  style: GoogleFonts.inter(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    height: 1.18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          //  SizedBox(width: size.width/2,),

                                            OverlappingCircles(),
                                          ],
                                        ),
                                      ],
                                    )),
                              );

                          }

                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
