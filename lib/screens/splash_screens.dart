import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/gen/assets.gen.dart';
import 'package:instageram/screens/swich_scree.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: mianColor,
          image: DecorationImage(
              repeat: ImageRepeat.repeat,
              image: Assets.img.pattern1.provider())),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Expanded(
                child: Center(
                  child: Assets.img.logoSplash.image(width: 155, height: 77),
                ),
              ),
              Positioned(
                bottom: 32,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(
                          color: secoundryTextColor.withOpacity(0.5),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'ExpertFlutter',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SwichtScreen())));
  }
}
