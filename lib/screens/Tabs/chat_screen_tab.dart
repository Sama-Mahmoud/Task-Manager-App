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
import '../../models/button_chosen.dart';
import '../../models/day_calendar.dart';
import '../../models/tasks.dart';
import '../../widgets/circle_profile_avatar.dart';
import '../../widgets/default_text_field.dart';
import '../../widgets/overlaping_avatar.dart';

final buttonProvider = StateNotifierProvider<ButtonNotifier, List<ChoosenButton>>((ref) {
  return ButtonNotifier();
});

class ButtonNotifier extends StateNotifier<List<ChoosenButton>> {
  ButtonNotifier()
      : super(List.generate(
      2,
          (index) => ChoosenButton(
          isSelected: false,
          id: index,
          )));
  void selectThisDay(ChoosenButton selectedButton) {

    state = [
      for (final day in state)
        if (day.id == selectedButton.id)
          selectedButton.copyWithToggleSection(!selectedButton.isSelected)
        else
          day.copyWithToggleSection(false)
    ];
  }
}


final ChatNotifierProvider = StateNotifierProvider<ChatProvider, List<TaskDay>>((ref) {
  return ChatProvider();
});
List<int> numbers = [6,7,8,9,10,11];
class ChatProvider extends StateNotifier<List<TaskDay>> {
  ChatProvider()
      : super(List.generate(
      11,
          (index) => TaskDay(
          isSelected: false,
          id: index,
          imgname: "assets/images/Ellipse ${Random().nextInt(10)+1}.png",
          Taskname: Faker().person.name(),
          time: "${Faker().lorem.sentence()}",
            duration: "${Faker().date.justTime()}"
      )));
}




class ChatTabUi extends StatelessWidget {
  const ChatTabUi({super.key});

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
                "Messages",
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
                AppSvg.edit,
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: Colors.white,
              ),
            )
          ],
        ),
        //APPcolor
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
      ), //app bar elavation 0 , transparent
      backgroundColor: AppColor.backgroundcolor,
      body: Consumer(builder: (context, ref, child) {
        var chat = ref.watch(buttonProvider)[0];
        var groub = ref.watch(buttonProvider)[1];
        return Container(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 29, bottom: 26, top: 36),
                    child: Row(
                      children: [
                        Container(
                          width: size.width/2-39,
                          height: 50,
                          color:chat.isSelected? AppColor.lightyellow: AppColor.navigationbackgroundcolor,
                          child: TextButton(onPressed: ()
                          { ref
                              .read(buttonProvider.notifier)
                              .selectThisDay(chat);
                            ref.invalidate(ChatNotifierProvider);
                            },
                            child:Text("Chat",
                              style: TextStyle(
                                color: chat.isSelected? Colors.black: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1.23,
                              ),) ,

                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: size.width/2-39,
                          height: 50,
                          color:groub.isSelected?AppColor.lightyellow : AppColor.navigationbackgroundcolor,
                          child: TextButton(
                            onPressed: ()
                            {ref
                                .read(buttonProvider.notifier)
                                .selectThisDay(groub);
                            ref.invalidate(ChatNotifierProvider);
                            },
                            child:Text("Groups",
                              style: TextStyle(
                                color: groub.isSelected? Colors.black: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                height: 1.23,
                              ),) ,

                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 34,
                  ),

                  Consumer( builder:(BuildContext context, WidgetRef ref, Widget? child) =>
                      Flexible(
                          child: ListView.builder(
                              itemCount: ref.watch(ChatNotifierProvider).length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index){
                                var Taskdate =
                                ref.watch(ChatNotifierProvider)[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 29, vertical: 15),
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.backgroundcolor,
                                        borderRadius: BorderRadius.zero,
                                      ),

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(Taskdate.imgname??"assets/images/Ellipse 6.png"
                                            ,fit: BoxFit.fill,width: 47 ,height: 47,),
                                          SizedBox(width: 17,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${Taskdate.Taskname}",
                                                maxLines: 2,
                                                style: TextStyle(

                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 1.39,
                                                ),
                                              ),

                                              SizedBox(
                                                width: size.width*0.5,
                                                child: Text(
                                                  "${Taskdate.time}",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: GoogleFonts.inter(
                                                    color: Color(0xFFB7B7B7),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.39,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          //  SizedBox(width: size.width/2,),
                                          Padding(
                                            padding:  EdgeInsets.only(left: 10),
                                            child: Text(Taskdate.duration ?? "" ,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                  height: 2.44,
                                                )
                                            ),
                                          )
                                        ],
                                      )),
                                );
                              }
                          )),

                  ),
                  SizedBox(height: 62,),
                  Padding(
                    padding:  EdgeInsets.only(left: size.width-29-(195)),
                    child: Visibility(
                      visible: chat.isSelected,
                      child: Container(
                        color: AppColor.lightyellow,
                        width: 195,
                       // transform: Matrix4(0.2),
                        //transformAlignment: AlignmentDirectional.bottomEnd,
                        height: 60,
                        child: TextButton(onPressed: (){},
                            child: Text(
                              'Start chat',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 2.38,
                              ),
                            ) ),
                      ),
                    ),
                  ),
                  SizedBox(height: 106,)
                ],
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}
