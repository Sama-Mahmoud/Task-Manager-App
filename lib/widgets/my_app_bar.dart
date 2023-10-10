import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, required this.title, this.color, this.height, this.actions});
  final String title;
  final Color? color;
  final double? height;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: color,
      toolbarHeight: height,
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>   Size.fromHeight(height ?? 40);
}
