import 'package:assignment/features/auth/business_acc.dart';
import 'package:assignment/features/auth/email_screen.dart';
import 'package:assignment/features/auth/otp_screen.dart';
import 'package:assignment/features/auth/personal_acc.dart';
import 'package:assignment/features/auth/signin.dart';
import 'package:assignment/features/profiles/loan.dart';
import 'package:assignment/features/profiles/personal_profile.dart';
import 'package:assignment/features/profiles/profile_display.dart';
import 'package:assignment/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SplashScreen(),
      );

    case SigninScreen.routeName:
      return PageRouteBuilder(
        settings: routeSettings,
        pageBuilder: (_, __, ___) => const SigninScreen(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );

    case OTPScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const OTPScreen(),
      );

    case EmailScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const EmailScreen(),
      );

    case BusinessAccScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BusinessAccScreen(),
      );

    case PersonalAccountScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PersonalAccountScreen(),
      );

    case PersonalProfileScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => PersonalProfileScreen(),
      );

    case ProfileDisplayScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProfileDisplayScreen(),
      );

    case LoanScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => LoanScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
