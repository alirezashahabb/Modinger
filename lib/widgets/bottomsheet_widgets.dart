import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/assets.gen.dart';

class BottomSheetWidgets extends StatelessWidget {
  const BottomSheetWidgets({super.key, this.controller});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                _getContent(themeData),
                Positioned(
                    bottom: 35,
                    child: SizedBox(
                      width: 129,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'send',
                          style: themeData.textTheme.headline4,
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }

  /// this  method creat Content GridView
  Widget _getContent(ThemeData themeData) {
    return CustomScrollView(
      physics: defultScroll,
      controller: controller,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: Container(
                  width: 67,
                  height: 5,
                  decoration: BoxDecoration(
                    color: mainTextColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Share',
                      style: themeData.textTheme.headline4,
                    ),
                    Assets.img.iconDirect.image(height: 16, width: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Container(
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.1),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child:
                            Assets.img.iconSearch.image(height: 20, width: 20),
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: themeData.textTheme.headline4!
                                .copyWith(fontSize: 12),
                            border: InputBorder.none),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // ===========================================================>>>>>>>>>>>> this is for Grid
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate(childCount: 20, (context, index) {
            return getContatntGrid(themeData);
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 90,
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ),

        const SliverPadding(padding: EdgeInsets.only(top: 80))
      ],
    );
  }

  /// this method for Contannt Grid
  Widget getContatntGrid(ThemeData themeData) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Assets.img.nazi.image(),
        ),
        const SizedBox(
          height: 10,
        ),
        Text('nazii_',
            style: themeData.textTheme.headline4!.copyWith(fontSize: 12))
      ],
    );
  }
}
