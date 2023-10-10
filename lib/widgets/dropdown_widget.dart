import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iti_flutter_proj/constants/app_color.dart';

import '../managers/log_manager.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>["My Tasks","task 1", "task 2", "task 3", "task 4"];

final tasksProvider = StateProvider<List<String>>((_) {
  List<String> tasks = ["task 1", "task 2", "task 3", "task 4"];
  return tasks;
});

// void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key,

  });

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DropdownButton Sample')),
        body: const Center(
          child: DropdownButtonExample(),
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key,
  });


  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(right: 32 , left: 32 , bottom: 28),
      child: Container(
        //width: size.width*0.95 ,
        //height:56,
        color: AppColor.fieldscolor,
        child: Center(
          child: DropdownButton<String>(
            alignment:AlignmentDirectional.centerStart ,
            dropdownColor: AppColor.fieldscolor,
            value: dropdownValue,
            isExpanded: true,
            icon:Padding(
                padding:  EdgeInsets.only(right: 15 ,top: 14 , bottom: 14),
                //padding:  EdgeInsets.only(left:0),

                //padding:  EdgeInsets.only(
                  //left:size.width*0.77
              //left: 0
              //),
              child: SvgPicture.asset("arrowdown2.svg",width: 13.59,height: 20, fit: BoxFit.scaleDown,alignment: Alignment.topRight,)//const Icon(Icons.arrow_downward,color: Colors.white ,),
            ),
            elevation: 0,
            style: GoogleFonts.inter(color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 1.05,),

            underline: Container(color: Colors.transparent,),
            borderRadius: BorderRadius.zero,
            //padding: EdgeInsets.only(left: 54),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value??"sama";
                //print("${ref.read(tasksProvider)}");

              });
            },
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Padding(
                  padding:  EdgeInsets.only(left:52 ),
                  child: Text(value),
                ),
              );
            }).toList(),
              //LogManager.logToConsole();
          ),
        ),
      ),
    );
    // LogManager.logToConsole("${ref.read()}");
  }
}
