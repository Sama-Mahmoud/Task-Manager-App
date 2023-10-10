import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_color.dart';
import '../models/tasks.dart';
import 'overlaping_avatar.dart';
//import 'card_chip.dart';

class MyHomeCard extends StatelessWidget {
  const MyHomeCard({
    super.key,
    required this.task,
    this.onTaskTapped,
    //this.onPriceTapped,
  });

  final Tasks task;
  final void Function(bool)? onTaskTapped;
  //final VoidCallback? onPriceTapped;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Visibility(
      visible: task.isFav == true,
      replacement: InkWell(
        onTap: () {
          onTaskTapped?.call(false);
        },

        child: Container(
          //height: 175,
          //width: size.width * 0.42,
          decoration: BoxDecoration(
              color: AppColor.fieldscolor, borderRadius: BorderRadius.zero),
          padding: const EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  task.name ?? "---",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'PilatExtended',
                    fontWeight: FontWeight.w600,
                    height: 1.21,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //mainAxisSize: MainAxisSize.min,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Team members',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  OverlappingCircles()
                ],
              ),
              const SizedBox(
                height: 6,
              ),

              const Spacer(),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Completed',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  //Learn it once, See it once, DO it once : Ya Eslam
                  SizedBox(
                    width: size.width * 0.42 ,
                  ),
                  Text(
                    '100%',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      height: 1.83,
                    ),
                  )
                ],
              ),
              // const Spacer(
              //   flex: 2,
              // ),
              Container(
                width: size.width * 0.58 ,
                height: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white),
              ),
            ],
          ),
        ),

        //Container(
        //   width: size.width*0.83,
        //   height: 6,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white),
        // ),
      ),
      child: InkWell(
        onTap: () {
          onTaskTapped?.call(true);
        },
        child: Container(
         // height: 175,
         // width: size.width * 0.42,
          decoration: BoxDecoration(
              color: AppColor.lightyellow, borderRadius: BorderRadius.zero),
          padding: const EdgeInsets.all(7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 300,
                child: Text(
                  task.name ?? "---",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontFamily: 'PilatExtended',
                    fontWeight: FontWeight.w600,
                    height: 1.21,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Team members',
                    style: GoogleFonts.inter(
                      color: Color(0xFF212832),
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      height: 1.50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  OverlappingCircles()
                ],
              ),
              const SizedBox(
                height: 6,
              ),

              const Spacer(),
              InkWell(
                //onDoubleTap: onPriceTapped,
                child: Visibility(
                  visible: true,
                  // replacement: const Text(
                  //   "Not for rent",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w900,
                  //       fontSize: 18,
                  //       color: Colors.red),
                  // ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Completed',
                        style: GoogleFonts.inter(
                          color: Color(0xFF212832),
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          height: 1.50,
                        ),
                      ),
                      //Learn it once, See it once, DO it once : Ya Eslam
                      SizedBox(
                        width: size.width * 0.42 ,
                      ),
                      Text(
                        '100%',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                          height: 1.83,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // const Spacer(
              //   flex: 2,
              // ),
              Container(
                width: size.width * 0.58 ,

                height: 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.backgroundcolor),
              ),
            ],
          ),
        ),

        // Container(
        //   width: size.width * 0.83,
        //   height: 6,
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       color: AppColor.backgroundcolor),
        // ),
      ),
    );
  }
}
