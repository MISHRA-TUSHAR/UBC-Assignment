import 'package:assignment/features/auth/business_acc.dart';
import 'package:assignment/features/auth/email_screen.dart';
import 'package:assignment/features/auth/otp_screen.dart';
import 'package:assignment/features/auth/personal_acc.dart';
import 'package:assignment/features/auth/signin.dart';
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
