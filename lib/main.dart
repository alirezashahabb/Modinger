import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/gen/fonts.gen.dart';
import 'package:instageram/screens/splash_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instageram',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: mianColor,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            fontFamily: FontFamily.gm,
            fontSize: 12,
            color: Color(0xffc5c5c5),
          ),
          // this Style for Persian Text
          bodyText1: TextStyle(
            fontFamily: FontFamily.iran,
            color: mainTextColor,
            fontSize: 16,
          ),
          headline4: TextStyle(
              color: mainTextColor,
              fontSize: 16,
              fontFamily: FontFamily.gb,
              fontWeight: FontWeight.w700),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: secoundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: const TextStyle(
              fontFamily: FontFamily.gb,
              fontSize: 16,
            ),
          ),
        ),
        scaffoldBackgroundColor: mianColor,
      ),
      home: const SplashScreen(),
    );
  }
}
