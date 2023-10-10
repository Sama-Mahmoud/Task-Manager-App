import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color hexToColor() => Color(int.parse("0xFF$this"));
  int hexToInt() => int.parse("0xFF${replaceAll("#", "")}");
}

extension PaddingExtension on Widget {
  Padding paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding paddingSymmetric({double horizontal = 0.0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }
}

extension TextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => MediaQuery.sizeOf(this);

  NavigatorState get navigator => Navigator.of(this);

}

// extension StringExtension on String? {
//   String nullOrEmpty() {
//     print("===>$this");
//     return "AA";

//   }
// }

// extension BooleanExtension on bool {
//   void toggle() =>  !this ;
// }
