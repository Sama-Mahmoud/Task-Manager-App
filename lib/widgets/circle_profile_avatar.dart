import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_svg.dart';
import '../managers/log_manager.dart';

class CircleProfileAvatar extends StatelessWidget {
  const CircleProfileAvatar({
    super.key,
    this.color,
    this.avatar,
    this.width,
    this.height,
  });
  final Color? color;
  final String? avatar;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
   // LogManager.logToConsole("rebuilding build() CircleProfileAvatar");
    return Container(
      width: width??47,
      height: height??47,
      decoration:  BoxDecoration(
          color: color ?? Colors.blue, shape: BoxShape.circle,
        image: DecorationImage(
      image: AssetImage(avatar?? AppSvg.avatar,),fit: BoxFit.fill, ),

    ),

    );
  }
}
