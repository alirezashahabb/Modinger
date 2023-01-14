import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/assets.gen.dart';
import 'package:instageram/gen/fonts.gen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  bool isObscureText = true;

  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });

    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff323A99),
              Color(0xffF98BFC),
            ]),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [_getImage(), _getBoxdecortions(context)],
          )),
    );
  }

  Widget _getBoxdecortions(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Container()),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: mianColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              physics: defultScroll,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign in to',
                          style: themeData.textTheme.headline4!.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Assets.img.moodingerLogo.image(width: 102, height: 25)
                      ],
                    ),
                  ),
                  emailFild(),
                  passwordFild(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: themeData.textTheme.headline4!
                          .copyWith(fontWeight: FontWeight.w200),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: themeData.textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: secoundryTextColor),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Singup',
                        style: themeData.textTheme.headline4,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  /// this is textFild for Email
  Widget emailFild() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 32, 42, 32),
      child: SizedBox(
        height: 46,
        width: 340,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          focusNode: negahban1,
          style: const TextStyle(
              fontFamily: FontFamily.gm, color: secoundryTextColor),
          decoration: InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(
                color: negahban1.hasFocus ? secoundColor : secoundryTextColor,
                fontFamily: FontFamily.gm),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 2, color: secoundryTextColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: secoundColor),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// this is Text Fild for Paasword
  Widget passwordFild() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(42, 10, 42, 32),
      child: SizedBox(
        height: 46,
        width: 340,
        child: TextField(
          obscureText: isObscureText,
          focusNode: negahban2,
          style: const TextStyle(
              fontFamily: FontFamily.gm, color: secoundryTextColor),
          decoration: InputDecoration(
            suffix: InkWell(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child:
                    isObscureText ? const Text('Show') : const Text('Hidden')),
            suffixStyle: const TextStyle(
                color: secoundryTextColor, fontFamily: FontFamily.gm),
            labelText: 'password',
            labelStyle: TextStyle(
                color: negahban2.hasFocus ? secoundColor : secoundryTextColor,
                fontFamily: FontFamily.gm),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(width: 2, color: secoundryTextColor),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: secoundColor),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// this is get RocketImage

  Widget _getImage() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      top: 50,
      child: Column(
        children: [
          Expanded(child: Assets.img.rocket.image()),
          Expanded(child: Container())
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    negahban1.dispose();
    negahban1.dispose();
  }
}
