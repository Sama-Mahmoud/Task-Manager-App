//import 'package:day_one/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_color.dart';

class DefaultTextField extends StatelessWidget {

  const DefaultTextField({
    super.key,
    this.onChanged,
    this.onEditingComplete,
    this.controller,
    this.enabled = true,
    this.label,
    this.hint,
    this.inputFormatters,
    this.type,
    this.bottomPadding = 8,
    this.validator,
    this.icon,
    this.sicon,
    this.labelcolor,
  });
  final void Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final bool enabled;
  final String? label;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? type;
  final double? bottomPadding;
  final String? Function(String?)? validator;
  final String? icon;
  final String? sicon;
  final Color? labelcolor;

  //15 => TextFormField

  @override
  Widget build(BuildContext context) {
    var defaultBorder = OutlineInputBorder(

        //borderSide: BorderSide(
          //  color: Colors.black.withOpacity(0.5)),
            borderRadius: BorderRadius.zero
    );
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 0,right: 32 , left: 32),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,

        //style: TextStyle(backgroundColor: Color(0xFF455A64)),
        // onChanged: (keyPress) => LogManager.logToConsole(keyPress),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: type,
        decoration: InputDecoration(
          fillColor: AppColor.fieldscolor,
         // icon: Icon(Icons.ice_skating , color: Colors.black, ),
          filled: true,
          enabled: enabled,
          border: defaultBorder,
          enabledBorder: defaultBorder,
          focusedBorder: defaultBorder.copyWith(
           // borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(
              color: AppColor.lightyellow,
            ),
          ),
          label: Padding(
            padding: const EdgeInsets.only(top:17 , bottom: 18 , ),
            child: Text(label ?? "", style: TextStyle(
              color: labelcolor??Colors.white,
              fontSize: 18,
              //fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.05,
            ),
            ),
          ),
          hintText: hint,
          // fillColor: Colors.red,
          // filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
              child: SvgPicture.asset(icon??"",width: 13.59,height: 20, fit: BoxFit.scaleDown,),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15 ,vertical: 14),
              child: SvgPicture.asset(sicon??"",width: 13.59,height: 20, fit: BoxFit.scaleDown,),
            ) ,
            //Icon(icon , color: Colors.white),
          errorBorder: defaultBorder.copyWith(
            //borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        // onEditingComplete: () => LogManager.logToConsole("Editing Done"),
      ),
    );
  }
}
