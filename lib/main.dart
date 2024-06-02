import 'package:assignment/constants/const.dart';
import 'package:assignment/features/splash/splash_screen.dart';
import 'package:assignment/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.backgroundColor,
        colorScheme: const ColorScheme.dark(
          primary: Constants.secondaryColor,
          secondary: Constants.secondaryColor,
        ),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      onGenerateRoute: generateRoute,
    );
  }
}
