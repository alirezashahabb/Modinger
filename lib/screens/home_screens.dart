import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instageram/constant/color.dart';
import 'package:instageram/constant/commone.dart';
import 'package:instageram/gen/assets.gen.dart';
import 'package:instageram/widgets/bottomsheet_widgets.dart';

class HomswScreens extends StatelessWidget {
  const HomswScreens({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: _getAppBar(),
      body: SafeArea(
          child: CustomScrollView(
        physics: defultScroll,
        slivers: [
          SliverToBoxAdapter(child: _getStory(themeData)),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _showShare(context);
                    //   },
                    //   child: const Text('sss'),
                    // ),
                    _getHeaderPost(
                        themeData: themeData,
                        mainName: 'alirezashahabb',
                        nickName: 'علیرضا برنامه نویس موبایل'),
                    const SizedBox(
                      height: 10,
                    ),
                    _getPostBody(
                        context: context,
                        themeData: themeData,
                        imagePostbody:
                            Assets.img.wall.image(width: 394, height: 394))
                  ],
                ),
              );
            },
          ))
        ],
      )),
    );
  }

  SizedBox _getStory(ThemeData themeData) {
    return SizedBox(
      height: 118,
      child: ListView.builder(
        physics: defultScroll,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return index == 0
              ? _getAddStoryBox(themeData)
              : _getDashBorder(
                  themeData: themeData,
                  hightSize: 64,
                  withSize: 64,
                  dash1: 10,
                  dash2: 5,
                  imageName: Assets.img.alireza.image(width: 60, height: 60));
        },
      ),
    );
  }

  /// this method  for Share Box
  _showShare(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.6,
          builder: (context, scrollController) {
            return BottomSheetWidgets(
              controller: scrollController,
            );
          },
        ),
      ),
    );
  }

  /// this method creat AppBar
  PreferredSizeWidget _getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: SizedBox(
        width: 128,
        height: 18,
        child: Assets.img.moodingerLogo.image(),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          child: Assets.img.iconDirect.image(
            height: 30,
            width: 30,
          ),
        )
      ],
    );
  }

  /// this Widgets Creat Post
  Widget _getPost(
      {required ThemeData themeData,
      required String userName,
      required String nickName,
      required Widget imagePost}) {
    return ListView.builder(
      itemCount: 9,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _getHeaderPost(
                themeData: themeData, mainName: userName, nickName: nickName),
            const SizedBox(
              height: 20,
            ),
            _getPostBody(
                themeData: themeData,
                imagePostbody: imagePost,
                context: context),
          ],
        );
      },
    );
  }

  /// this method creat postBody
  Widget _getPostBody(
      {required ThemeData themeData,
      required Widget imagePostbody,
      required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(left: 17, right: 17),
      height: 440,
      width: 394,
      decoration: BoxDecoration(
          color: mianColor, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: imagePostbody,
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Assets.img.iconVideo.image(),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          mainTextColor.withOpacity(0.5),
                          mainTextColor.withOpacity(0.2)
                        ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Assets.img.iconHart.image(),
                            const SizedBox(
                              width: 6,
                            ),
                            Text('2.5K',
                                style: themeData.textTheme.headline4!
                                    .copyWith(fontSize: 14))
                          ],
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Row(
                          children: [
                            Assets.img.iconComments.image(),
                            const SizedBox(
                              width: 6,
                            ),
                            Text('1.5K',
                                style: themeData.textTheme.headline4!
                                    .copyWith(fontSize: 14))
                          ],
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        InkWell(
                            onTap: () => _showShare(context),
                            child: Assets.img.iconShare.image()),
                        const Spacer(),
                        Assets.img.iconSave.image()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// this method crreat postHeader
  Widget _getHeaderPost(
      {required ThemeData themeData,
      required String mainName,
      required String nickName}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17),
      child: Row(
        children: [
          _getDashBorderPost(
              themeData: themeData,
              hightSize: 40,
              withSize: 40,
              dash1: 10,
              dash2: 5,
              imageName: Assets.img.alireza.image()),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(mainName,
                    style:
                        themeData.textTheme.headline4!.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 4,
                ),
                Text(nickName,
                    style:
                        themeData.textTheme.bodyText1!.copyWith(fontSize: 14))
              ],
            ),
          ),
          const Spacer(),
          Assets.img.iconMenu.image()
        ],
      ),
    );
  }

  /// this method creat DashBorder Stroy

  /// this method Creat Add Stroty
  Widget _getAddStoryBox(ThemeData themeData) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          decoration: BoxDecoration(
              color: mainTextColor, borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Container(
              height: 66,
              width: 66,
              decoration: BoxDecoration(
                color: mianColor,
                borderRadius: BorderRadius.circular(17),
              ),
              child: Assets.img.iconPlus.image(),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Add Stroy',
          style: themeData.textTheme.headline4!.copyWith(fontSize: 12),
        )
      ],
    );
  }

  Widget _getDashBorder({
    required double hightSize,
    required double withSize,
    required double dash1,
    required double dash2,
    required Widget imageName,
    required ThemeData themeData,
  }) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: secoundColor,
            strokeWidth: 2,
            dashPattern: [dash1, dash2],
            radius: const Radius.circular(17),
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: SizedBox(
                height: hightSize,
                child: imageName,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          'Alireza',
          style: themeData.textTheme.headline4!.copyWith(fontSize: 14),
        )
      ],
    );
  }

  Widget _getDashBorderPost({
    required double hightSize,
    required double withSize,
    required double dash1,
    required double dash2,
    required Widget imageName,
    required ThemeData themeData,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 10),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: secoundColor,
        strokeWidth: 2,
        dashPattern: [dash1, dash2],
        radius: const Radius.circular(17),
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: SizedBox(
            height: hightSize,
            child: imageName,
          ),
        ),
      ),
    );
  }
}
