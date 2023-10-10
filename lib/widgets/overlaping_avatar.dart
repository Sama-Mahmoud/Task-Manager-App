import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'circle_profile_avatar.dart';

class OverlappingCircles extends StatelessWidget {
  const OverlappingCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //var colors = [Colors.red, Colors.blue, Colors.yellow, Colors.green];
    //final size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.transparent,

      child: SizedBox(
        height: 30,
        width: 72,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // const CircleProfileAvatar(),
            for (var index = 0; index < 5; index++)
              Positioned(
                left: 13 * (index + 0.0),
                top: 5,
                child: CircleProfileAvatar(
                  //color: colors[Random().nextInt(colors.length - 1)],
                  avatar: "assets/images/Ellipse ${index+1}.png",
                  width: 20,
                  height: 20,
                ),
              ),
            // Transform.translate(
            //   offset: const Offset(-40, 0),
            //   child: const CircleProfileAvatar(
            //     color: Colors.blue,
            //   ),
            // ),
            // Transform.translate(
            //   offset: const Offset(-60, 0),
            //   child: const CircleProfileAvatar(
            //     color: Colors.orange,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
