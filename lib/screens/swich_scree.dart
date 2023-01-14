import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/gen/assets.gen.dart';
import 'package:instageram/screens/main_screen.dart';

class SwichtScreen extends StatelessWidget {
  const SwichtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 42),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: mianColor,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Assets.img.switchAccountBackground.provider(),
                      ),
                    ),
                  ),
                  Center(
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 3,
                          sigmaY: 3,
                        ),
                        child: Container(
                          height: 351,
                          width: 340,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  mainTextColor.withOpacity(0.5),
                                  mainTextColor.withOpacity(0.2),
                                ]),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(105, 30, 105, 20),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    'assets/img/alireza.jpg',
                                    width: 129,
                                    height: 129,
                                  ),
                                ),
                              ),
                              Text('Alirezshahabb',
                                  style: themeData.textTheme.headline4),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 46,
                                width: 129,
                                child: ElevatedButton(
                                  style: themeData.elevatedButtonTheme.style,
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MainScreen(),
                                        ));
                                  },
                                  child: const Text('Confirm'),
                                ),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                              Text('swichAcoount',
                                  style: themeData.textTheme.headline4)
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t have an account?',
                    style: themeData.textTheme.headline4!
                        .copyWith(color: Colors.grey[500])),
                const SizedBox(
                  width: 8,
                ),
                Text('Sign up', style: themeData.textTheme.headline4!)
              ],
            ),
          )
        ],
      ),
    );
  }
}
