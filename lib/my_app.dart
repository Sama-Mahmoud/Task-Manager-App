import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter_proj/screens/Tabs/calender_screen_tab.dart';
import 'package:iti_flutter_proj/screens/Tabs/chat_screen_tab.dart';
import 'package:iti_flutter_proj/screens/Tabs/notifications_screen_tab.dart';
import 'package:iti_flutter_proj/screens/create_account_screen.dart';
import 'package:iti_flutter_proj/screens/Tabs/home_screen_tab.dart';
import 'package:iti_flutter_proj/screens/navigation_bar.dart';
import 'package:iti_flutter_proj/screens/tasks_list_screen.dart';
import 'package:iti_flutter_proj/screens/providers/state_counter_provider_screen.dart';
import 'package:iti_flutter_proj/screens/signin_screen.dart';
import 'package:iti_flutter_proj/screens/splash_screen.dart';
import 'package:iti_flutter_proj/screens/Tabs/home_screen_tab.dart';
import 'package:iti_flutter_proj/widgets/dropdown_widget.dart';

import 'constants/app_color.dart';
import 'screens/profile_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          //fontFamily: "SF-Pro-Text"
      ),

      home: const SplashUI(),
      //home: const SignUpUI(),
     // home: const HomeTabUi(),
      //home: const PropertyScreen(),
      //home: const HomeTabUi(),
      //home: const NavigationScreen(),
      //home: const ChatTabUi(),
     // home: const NotificationTabUi(),

     // home: const ProfileUI(),
      //home: const DropdownButtonApp(),
     // home: const CalenderTabUi(),

    );
  }
}