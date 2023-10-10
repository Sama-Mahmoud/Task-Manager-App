
import 'package:flutter/material.dart';
import 'package:iti_flutter_proj/screens/create_account_screen.dart';
import 'package:iti_flutter_proj/screens/Tabs/home_screen_tab.dart';
import 'package:iti_flutter_proj/screens/profile_screen.dart';
import 'package:iti_flutter_proj/screens/signin_screen.dart';

import '../constants/route_constants.dart';
import '../screens/splash_screen.dart';


class RouteManager {
  RouteManager._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashPagerouteName:
        return MaterialPageRoute(
            settings:
                 RouteSettings(name: RouteConstants.splashPagerouteName,arguments: settings.arguments),
            builder: (ctx) => const SplashUI());

      case RouteConstants.signInPagerouteName:
        return MaterialPageRoute(
            settings:
                 RouteSettings(name: RouteConstants.signInPagerouteName,arguments: settings.arguments),
            builder: (ctx) => const SignInUI());
      case RouteConstants.profilePagerouteName:
        return MaterialPageRoute(
            settings:
                 RouteSettings(name: RouteConstants.profilePagerouteName,arguments: settings.arguments),
            builder: (ctx) => const ProfileUI());

      case RouteConstants.SignUpPagerouteName:
        return MaterialPageRoute(
            settings:
            RouteSettings(name: RouteConstants.SignUpPagerouteName,arguments: settings.arguments),
            builder: (ctx) => const SignUpUI());

      case RouteConstants.HomeTabPagerouteName:
        return MaterialPageRoute(
            settings:
            RouteSettings(name: RouteConstants.HomeTabPagerouteName,arguments: settings.arguments),
            builder: (ctx) => const HomeTabUi());
    }

    return null;
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (ctx) =>
            SplashUI());
  }
}
