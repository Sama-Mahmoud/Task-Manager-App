import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iti_flutter_proj/constants/app_color.dart';
import 'package:iti_flutter_proj/screens/Tabs/home_screen_tab.dart';
import 'package:iti_flutter_proj/screens/create_account_screen.dart';
import 'package:iti_flutter_proj/screens/profile_screen.dart';
import 'package:iti_flutter_proj/screens/signin_screen.dart';

import '../../managers/log_manager.dart';
import '../../widgets/my_app_bar.dart';
import '../constants/app_svg.dart';
import 'Tabs/calender_screen_tab.dart';
import 'Tabs/chat_screen_tab.dart';
import 'Tabs/notifications_screen_tab.dart';

final bottomBarIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class NavigationScreen extends ConsumerWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LogManager.logToConsole("rebuidling");
    List<Widget> pages = const [
      HomeTabUi(),
      ChatTabUi(),
      ProfileUI(),
      CalenderTabUi(),
      NotificationTabUi()
    ];
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      // appBar: const MyAppBar(title: "Main Screen"),
      extendBody: true,

      body: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) =>
              pages[ref.watch(bottomBarIndexProvider)]),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          fixedColor: AppColor.lightyellow,
          backgroundColor: AppColor.backgroundcolor,
          useLegacyColorScheme: true,
          currentIndex: ref.watch(bottomBarIndexProvider),
          onTap: (value) => ref
              .read(bottomBarIndexProvider.notifier)
              .update((state) => value

          ),
          selectedIconTheme: IconThemeData(color: AppColor.lightyellow,size: 5  ),

          //selectedItemColor: AppColor.lightyellow,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvg.home_tab),
                activeIcon: SvgPicture.asset(AppSvg.home_tab,color: AppColor.lightyellow,),
                label: "Home",
                tooltip: "sama",
                backgroundColor: AppColor.navigationbackgroundcolor),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvg.chat_tab),
                activeIcon: SvgPicture.asset(AppSvg.chat_tab,color: AppColor.lightyellow,),
                label: "Chat",
                backgroundColor: AppColor.navigationbackgroundcolor),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvg.addsquare_tab,color: AppColor.iconcolor,),
                activeIcon: SvgPicture.asset(AppSvg.addsquare_tab,color: AppColor.lightyellow,),

                label: "Profile",
                backgroundColor: AppColor.navigationbackgroundcolor),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvg.calendar_tab),
                activeIcon: SvgPicture.asset(AppSvg.calendar_tab,color: AppColor.lightyellow,),

                label: "Calender",
                backgroundColor: AppColor.navigationbackgroundcolor),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppSvg.notifacation_tab),
                activeIcon: SvgPicture.asset(AppSvg.notifacation_tab,color: AppColor.lightyellow,),
                label: "Notification",
                backgroundColor: AppColor.navigationbackgroundcolor),
          ]),
    );
  }
}
