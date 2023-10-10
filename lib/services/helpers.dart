import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

void dismissKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

// bool validateEmail(String value) {
//   Pattern pattern =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   RegExp regex = RegExp(pattern.toString());
//   return (!regex.hasMatch(value)) ? false : true;
// }

// bool validateYoutubeURL(String value) {
//   Pattern pattern =
//       r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?$';
//   RegExp regex = RegExp(pattern.toString());
//   return (!regex.hasMatch(value)) ? false : true;
// }

// String? getYoutubeVideoId(String value) {
//   String pattern =
//       r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*';
//   RegExp regex = RegExp(pattern);

//   return regex.firstMatch(value) != null
//       ? regex.firstMatch(value)!.group(1)
//       : '';
// }

// bool validateSaudiMobileNumber(String mobileNumber) {
//   final RegExp regExp = RegExp(
//     r"^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$",
//   );

//   final bool isValid = regExp.hasMatch(mobileNumber);

//   return isValid;
// }

bool validateEgyptianMobileNumber(String? value) {
  Pattern pattern = r'^01[0-2,5]{1}[0-9]{8}$';

  RegExp regex = RegExp(pattern.toString());

  return (!regex.hasMatch(value!)) ? false : true;
}

// bool validateSaudiIBAN(String iban) {
//   iban = iban.replaceAll(" ", "");
//   final RegExp regExp = RegExp(
//       r"[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{4}[0-9]{7}([a-zA-Z0-9]?){0,16}"
//       // r"^(?:(?:IT|SM)\d{2}[A-Z]\d{22}|CY\d{2}[A-Z]\d{23}|NL\d{2}[A-Z]{4}\d{10}|LV\d{2}[A-Z]{4}\d{13}|(?:BG|BH|GB|IE)\d{2}[A-Z]{4}\d{14}|GI\d{2}[A-Z]{4}\d{15}|RO\d{2}[A-Z]{4}\d{16}|KW\d{2}[A-Z]{4}\d{22}|MT\d{2}[A-Z]{4}\d{23}|NO\d{13}|(?:DK|FI|GL|FO)\d{16}|MK\d{17}|(?:AT|EE|KZ|LU|XK)\d{18}|(?:BA|HR|LI|CH|CR)\d{19}|(?:GE|DE|LT|ME|RS)\d{20}|IL\d{21}|(?:AD|CZ|ES|MD|SA)\d{22}|PT\d{23}|(?:BE|IS)\d{24}|(?:FR|MR|MC)\d{25}|(?:AL|DO|LB|PL)\d{26}|(?:AZ|HU)\d{27}|(?:GR|MU)\d{28})$"
//       // r"^[A-Z]\d{4}[A-Z0-9]{18}$",
//       // r"^[A-Z]{2}(?:[ ]?[0-9]){18,20}$"
//       );

//   final bool isValid = regExp.hasMatch(iban);

//   return isValid;
// }

// bool isSmallPhone(BuildContext context) {
//   if (MediaQuery.of(context).size.height <= 592) {
//     return true;
//   } else {
//     return false;
//   }
// }

// bool isMediumPhone(BuildContext context) {
//   ///[was changed to 760 to include ]
//   if (MediaQuery.of(context).size.height >= 592 &&
//       MediaQuery.of(context).size.height <= 760) {
//     return true;
//   } else {
//     return false;
//   }
// }

// bool isBigPhone(BuildContext context) {
//   if (MediaQuery.of(context).size.height >= 761 &&
//       MediaQuery.of(context).size.height <= 930) {
//     return true;
//   } else {
//     return false;
//   }
// }

bool isKeyboardOpen(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom == 0.0) {
    return false;
  }
  return true;
}

// void selectThisText(TextEditingController textEditingController) {
//   textEditingController.selection = TextSelection(
//       baseOffset: 0, extentOffset: textEditingController.text.length);
// }

void copyToClipBoard(String copiedData) async {
  Clipboard.setData(ClipboardData(text: copiedData));

  HapticFeedback.heavyImpact();
}

String toArabic12TimeFromInt(int time) {
  return DateFormat('jm', 'ar_SA')
      .format(DateTime.fromMillisecondsSinceEpoch(time));
}

String toArabic12TimeFromTimeOfDay(TimeOfDay timeofDay) {
  return DateFormat('jm', 'ar_SA').format(DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      timeofDay.hour,
      timeofDay.minute));
}

extension DateExtension on DateTime? {
  String toBackEndDateOnly() {
    return this == null ? "----" : toString().split(' ')[0];
  }

  String toDetailedArabicDate() {
    return this == null ? "----" : DateFormat.yMMMMEEEEd('ar_SA').format(this!);
  }

  String toDetailedEnglishDate() {
    return this == null
        ? "----"
        : DateFormat.yMMMMEEEEd('en_US').add_jms().format(this!);
  }

  String toEnglishDate() {
    return this == null
        ? "----"
        : DateFormat('yyyy-MM-dd').add_jm().format(this!);
  }

  String toSndokDate({String? locale = "en"}) {
    return this == null
        ? "----"
        : DateFormat('dd/MM/yyyy', locale).add_jm().format(this!);
  }


  String toShortArabicDate() {
    return this == null ? "----" : DateFormat.yMMMMd('ar_SA').format(this!);
  }

  String toShortEnglishDate() {
    return this == null ? "----" : DateFormat.yMMMMd('en_US').format(this!);
  }

  String toABBRWEEKDAY() {
    return this == null ? "----" : DateFormat.E('en_US').format(this!);
  }
}
